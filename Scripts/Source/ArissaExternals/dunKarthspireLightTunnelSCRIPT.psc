Scriptname dunKarthspireLightTunnelSCRIPT extends ObjectReference  

OBJECTREFERENCE PROPERTY lightA1 AUTO
OBJECTREFERENCE PROPERTY lightA2 AUTO
OBJECTREFERENCE PROPERTY lightB1 AUTO
OBJECTREFERENCE PROPERTY lightB2 AUTO
OBJECTREFERENCE PROPERTY lightC1 AUTO
OBJECTREFERENCE PROPERTY lightC2 AUTO
OBJECTREFERENCE PROPERTY lightD1 AUTO
OBJECTREFERENCE PROPERTY lightD2 AUTO
OBJECTREFERENCE PROPERTY lightE1 AUTO
OBJECTREFERENCE PROPERTY lightE2 AUTO

BOOL doOnce=TRUE

EVENT onTriggerEnter(OBJECTREFEReNCE obj)

	; //check to make sure its the player and only do it once
	IF(obj == game.getplayer() && doOnce == TRUE)
	
		; //start the lights		
		lightA1.setAnimationVariableFloat("fToggleBlend", 1)
		lightA2.setAnimationVariableFloat("fToggleBlend", 1)
		
		utility.wait(1)
		
		lightB1.setAnimationVariableFloat("fToggleBlend", 1)
		lightB2.setAnimationVariableFloat("fToggleBlend", 1)
		
		utility.wait(1)
		
		lightC1.enable()
		lightC2.enable()
		
		utility.wait(1)
		
		lightD1.enable()
		lightD2.enable()
		
		utility.wait(1)
		
		lightE1.enable()
		lightE2.enable()
		
		; //make sure we only do it once
		doOnce = FALSE
	
	ENDIF

ENDEVENT
