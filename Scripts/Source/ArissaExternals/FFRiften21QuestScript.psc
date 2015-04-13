Scriptname FFRiften21QuestScript extends Quest  Conditional

int Property pFFR21Entered Auto Conditional
GlobalVariable Property pFFR21Count Auto Conditional
Quest Property pFFRiften21Quest Auto Conditional

Function JournalCheck()

	if pFFRiften21Quest.IsRunning() == 1

		ModObjectiveGlobal(1, pFFR21Count, 20)

		if pFFR21Count.Value >= 4
			pFFRiften21Quest.SetStage(40)
		endif
	endif

endFunction