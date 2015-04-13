scriptName FreeformKolskeggrAQuestScript extends Quest

GlobalVariable Property FreeformKolskeggrADeadCount auto
GlobalVariable Property FreeformKolskeggrATotalCount auto

Function ForswornDead()
	If (ModObjectiveGlobal(1, FreeformKolskeggrADeadCount, 10, FreeformKolskeggrATotalCount.value))
		SetStage(20)
	EndIf
EndFunction