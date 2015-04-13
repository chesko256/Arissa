Scriptname TG08BStartOverrideTriggerScript extends ObjectReference  Conditional

Quest Property pTG08BQuest Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BQuest.GetStage() < 30
			pTG08BQuest.SetStage(30)
		endif
	endif

endEvent