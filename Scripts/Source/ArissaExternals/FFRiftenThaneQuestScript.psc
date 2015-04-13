Scriptname FFRiftenThaneQuestScript extends Quest  Conditional

GlobalVariable Property pThaneCount Auto Conditional
GlobalVariable Property pThaneQLDone Auto Conditional
Quest Property pFFRiftenThaneQuest Auto Conditional
int Property pFFRiftenHouse Auto Conditional
int Property pFFDia Auto Conditional

Function ThaneCheck()

	if pFFRiftenThaneQuest.GetStage() < 10
		if pThaneCount.Value >= 5
			if pThaneQLDone.Value == 1
				pFFRiftenThaneQuest.SetStage(10)
			endif
		endif
	endif

endFunction

