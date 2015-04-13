ScriptName DA11QuestScript extends Quest Conditional

;Is Verulus in the shrine room? 0 = No; 1 = Yes
Int Property iVerulusAtShrine Auto Conditional

GlobalVariable Property pDA11DraugrDeadCount auto
GlobalVariable Property pDA11DraugrTotalCount auto

Function DraugrDead()
	
	If (GetStageDone(10) == 1) && (GetStageDone(20) == 0)
		If (ModObjectiveGlobal(1, pDA11DraugrDeadCount , 10, pDA11DraugrTotalCount.value))
			SetStage(20)
		EndIf
	Else
		pDA11DraugrDeadCount.SetValue(pDA11DraugrDeadCount.GetValue() + 1)
	EndIf

EndFunction
