Scriptname skuldafnTopExteriorSetupSCRIPT extends ObjectReference  

; // the creatures up top
OBJECTREFERENCE PROPERTY dragonLeft AUTO
OBJECTREFERENCE PROPERTY dragonRight AUTO

OBJECTREFERENCE PROPERTY dragonPriest AUTO

; // the portal script
OBJECTREFERENCE PROPERTY controllerScript AUTO

FXSkuldafnPortal portalScript

EVENT onTRIGGERENTER(OBJECTREFERENCE trigRef)

	IF(trigRef == game.getPlayer())

		; //setting the master script to be the one with the stored vars
		portalScript = controllerScript AS FXSkuldafnPortal
		
		dragonLeft.enable()
		dragonRight.enable()
		dragonPriest.enable()

		portalScript.closePortal()
	ENDIF
	
endEVENT

