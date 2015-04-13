Scriptname TG08BEscapedTrigger extends ObjectReference  Conditional

Quest Property pTG08BQuest Auto
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BQuest.GetStage() == 50
			if pTriggered == 0
				pTG08BQuest.SetStage(60)
				pTriggered = 1
			endif
		endif
	endif

endEvent