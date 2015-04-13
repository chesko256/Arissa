Scriptname TG08BScene14TriggerScript extends ObjectReference  Conditional

Scene Property pTG08BExploreScene14  Auto  
int Property pTG08BTriggered  Auto  


Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BTriggered == 0
			pTG08BExploreScene14.Start()
			pTG08BTriggered = 1
		endif
	endif

endEvent
