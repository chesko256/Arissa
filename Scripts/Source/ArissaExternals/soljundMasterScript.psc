Scriptname soljundMasterScript extends ObjectReference  

BOOL PROPERTY leverA AUTO
BOOL PROPERTY leverB AUTO

OBJECTREFERENCE PROPERTY leverMarkerA AUTO
OBJECTREFERENCE PROPERTY leverMarkerB AUTO

OBJECTREFERENCE PROPERTY portDoor AUTO
OBJECTREFERENCE PROPERTY portMarker AUTO

EVENT onActivate(OBJECTREFERENCE trigRef)

	playAnimation("FullPush")
	
	;disable the proper xmarker for easy scripting
	IF(LEVERA)
		leverMarkerA.disable()
	ELSEIF(LEVERB)
		leverMarkerB.disable()
	ENDIF
	
	;if both levers have been switched, open the main door
	IF(leverMarkerA.isEnabled() == FALSE && leverMarkerB.isEnabled() == FALSE)
		portDoor.activate(portMarker)
		
	ENDIF

ENDEVENT
