Scriptname TG08BNoFollowTrigger extends ObjectReference  Conditional

Quest Property pTG08BQuest Auto
TG08BQuestScript Property pTG08BQS Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BQuest.GetStage() >= 30
			pTG08BQS.pTG08BNoCheck = 1
			pTG08BQuest.SetStage(32)
		endif
	endif

endEvent