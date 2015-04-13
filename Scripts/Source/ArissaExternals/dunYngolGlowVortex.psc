scriptname dunYngolGlowVortex extends objectReference
{Smaller trigger to create a more violent effect at helmet}

objectReference property moteBaseID auto
quest property myQuest auto
imageSpaceModifier property blackOut auto

int moteCount

EVENT onTriggerEnter(objectReference actronaut)
; 	debug.trace("Trigger caught "+actronaut )
	if actronaut.getBaseObject() == moteBaseID.getBaseObject()
		dunYngolGlow myGlow = actronaut as dunYngolGlow
		;myGlow.registerForUpdate(0.2) ; increase frequency of pushin	
		myGlow.setMotionType(Motion_Keyframed)
		moteCount += 1
		if moteCount >= 4
			myQuest.setStage(49)
			debug.messagebox("Stage 49 set")
		endif
	endif
endEVENT


; EVENT onTriggerLeave(objectReference actronaut)
	; if actronaut.getBaseObject() == moteBaseID.getBaseObject()
		; dunYngolGlow myGlow = actronaut as dunYngolGlow
		; myGlow.registerForUpdate(2) ; increase frequency of pushin	
	; endif
; endEVENT
