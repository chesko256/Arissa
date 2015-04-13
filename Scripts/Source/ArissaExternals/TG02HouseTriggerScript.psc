Scriptname TG02HouseTriggerScript extends ObjectReference  Conditional

TG02QuestScript Property pTG02QS  Auto  
Quest Property pTG02Quest  Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTG02QS.pTG02HouseTriggerDone == 0
		pTG02Quest.SetObjectiveDisplayed(48,1)
		pTG02QS.pTG02HouseTriggerDone = 1
	endif

endEvent