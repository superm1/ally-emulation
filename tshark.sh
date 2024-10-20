#!/bin/sh
tshark -r /home/supermario/src/asusmcu/ally-emulation/wireshark/firmwareupdate314.pcapng  -Y '!(usbhid.setup.ReportID == 13) && _ws.col.protocol == "USBHID" && !(_ws.col.info == "SET_IDLE Request") && !(_ws.col.info == "SET_IDLE Response") && usbhid.setup.bRequest==0x09 && usbhid.setup.wValue == 0x0300' -T fields -e frame.number -e usb.data_fragment -E separator=, | less
