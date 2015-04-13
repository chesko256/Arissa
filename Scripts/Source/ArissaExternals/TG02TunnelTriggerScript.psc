Scriptname TG02TunnelTriggerScript extends ObjectReference  Conditional

TG02QuestScript Property pTG02QS  Auto  
int Property pTriggered Auto
Quest Property pTG02Quest Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTriggered == 0
			if pTG02Quest.IsObjectiveDisplayed(47) == 1
				pTG02QS.pTG02TunnelTriggerDone = 1
				pTG02Quest.SetObjectiveCompleted(47,1)
				pTriggered = 1
			endif
		endif
	endif

endEvent