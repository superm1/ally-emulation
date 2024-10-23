-- Define a new protocol
local usb_proto = Proto("respond", "Control packet response")

-- Define the fields
local f_data = ProtoField.bytes("respond.data", "Data")

-- Add the fields to the protocol
usb_proto.fields = {f_data}

-- Create a dissector function
function usb_proto.dissector(buffer, pinfo, tree)
    -- Check if the frame is long enough
    if buffer:len() < 63 then return end

    -- Get the last 63 bytes
    local offset = buffer:len() - 63
    local last_bytes = buffer(offset, 63)

    -- Add the extracted bytes to the protocol tree
    local subtree = tree:add(usb_proto, last_bytes, "respond")
    subtree:add(f_data, last_bytes)
end

register_postdissector(usb_proto, true)
