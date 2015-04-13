Scriptname TG08BScene08TriggerScript extends ObjectReference  Conditional

Scene Property pTG08BExploreScene08  Auto  
int Property pTG08BTriggered  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BTriggered == 0
			if Game.GetPlayer().IsInCombat() == 0
				pTG08BExploreScene08.Start()
				pTG08BTriggered = 1
			endif
		endif
	endif

endEvent
