# Launch commands
Building

	build-fwupd; fwupdtool modify-config fwupd OnlyTrusted false && fwupd -vv
Launching tests

	fwupdmgr emulation-load ~/src/asusmcu/ally-emulation/emulation-data/ally.zip && fwupdmgr install ~/src/asusmcu/ally-emulation/cab/FGA80100.RC71LM.319.cab

# Converting emulation data

Use python like this by hand:

	import base64
	str="c0a0af013a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
	base64.b64encode(bytes.fromhex(str))
	b'wCyvAToAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

How to fixup garbage data on a command all over the file.
This can done for both C0 and D0 commands.

	./tshark.sh | grep ",d0" | sed 's/.*,//' > d0_commands.txt
	./b64encode.py d0_commands.txt d0_b64.txt
	./whitewash.py d0_b64.txt ./emulation-data/install.json  0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

	./tshark.sh | grep ",c0" | sed 's/.*,//' > c0_commands.txt
	./b64encode.py c0_commands.txt c0_b64.txt
	./whitewash.py c0_b64.txt ./emulation-data/install.json 
	wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

# Helper to convert

	~/src/fwupd/contrib/pcap2emulation.py ./wireshark/firmwareupdate319.pcapng /tmp/ally.zip 0b05:1abe 048d:89db
