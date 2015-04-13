Scriptname FFRiften21TriggerScript extends ObjectReference  Conditional

Quest Property pFFR21Quest  Auto
int Property pTriggered Auto
FFRiften21QuestScript Property pFFR21QS Auto Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			if pFFR21Quest.GetStageDone(20) == 1
				pFFR21Quest.SetStage(30)
				pFFR21QS.pFFR21Entered = 1
			elseif pFFR21Quest.GetStageDone(20) == 0
				pFFR21QS.pFFR21Entered = 1
			endif
		endif
	endif

endEvent