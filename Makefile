all: zip cabs

zip:
	cd emulation-data && zip -r ally.zip *json
cabs:
	cd cab && gcab --create FGA80100.RC71LM.319.cab FGA80100.RC71LM.319.bin FGA80100.RC71LM.319.bin.metainfo.xml
