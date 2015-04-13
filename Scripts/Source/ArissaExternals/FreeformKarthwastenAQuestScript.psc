scriptName FreeformKarthwastenAQuestScript extends Quest

GlobalVariable Property FreeformKarthwastenADeadCount auto
GlobalVariable Property FreeformKarthwastenATotalCount auto

Function GuardDead()
	If (ModObjectiveGlobal(1, FreeformKarthwastenADeadCount, 10, FreeformKarthwastenADeadCount.value))
		SetStage(20)
	EndIf
EndFunction