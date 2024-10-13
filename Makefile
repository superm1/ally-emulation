all: zip cabs

zip:
	cd emulation-data && zip -r ally.zip *json
cabs:
	cd cab && gcab --create FGA80100.RC71LM.318_T02.cab FGA80100.RC71LM.318_T02.bin FGA80100.RC71LM.318_T02.bin.metainfo.xml
