Scriptname TG08BScene05SetupTrigger extends ObjectReference  

int Property pTG08BTriggered  Auto  
objectReference property TG08BTowerFallActivator auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BTriggered == 0
			TG08BTowerFallActivator.activate(self)
			pTG08BTriggered = 1
		endif
	endif

endEvent