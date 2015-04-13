Scriptname FFRiften01QuestScript extends Quest  Conditional

GlobalVariable Property pFFR01Count Auto Conditional
Quest Property pFFR01Quest Auto Conditional

Function KillCounter()

	if pFFR01Quest.GetStage() >= 20 && pFFR01Quest.GetStage() < 40
		pFFR01Count.Value += 1
	endif

	if pFFR01Quest.GetStage() >= 20 && pFFR01Quest.GetStage() < 40
		if pFFR01Count.Value >= 7
			pFFR01Quest.SetStage(40)
		endif
	endif

endFunction