# Launch commands
Building
	build-fwupd; fwupdtool modify-config fwupd OnlyTrusted false && fwupd -vv
Launching tests
	fwupdmgr emulation-load ~/src/asusmcu/ally-emulation/emulation-data/ally.zip && fwupdmgr install ~/src/asusmcu/ally-emulation/cab/FGA80100.RC71LM.319.cab

# Converting emulation data

Use python like this:
	import base64
	str="c0a0af013a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
	base64.b64encode(bytes.fromhex(str))
	b'wCyvAToAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

# Helper to convert

	~/src/fwupd/contrib/pcap2emulation.py ./wireshark/firmwareupdate319.pcapng /tmp/ally.zip 0b05:1abe 048d:89db
