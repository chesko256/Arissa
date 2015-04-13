Scriptname TG08BScene02TriggerScript extends ObjectReference  

Scene Property pTG08BExploreScene02  Auto  
int Property pTG08BTriggered  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BTriggered == 0
			if Game.GetPlayer().IsInCombat() == 0
				pTG08BExploreScene02.Start()
				pTG08BTriggered = 1
			endif
		endif
	endif

endEvent