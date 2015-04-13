Scriptname HildeSoldierScript extends ObjectReference  

Quest Property DialogueQuest Auto
Quest Property MQ103 Auto
GlobalVariable Property GameHour Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		If DialogueQuest.GetStageDone(10) == 0
			If MQ103.GetStageDone(10) == 0
				If GameHour.GetValue() > 8 && GameHour.GetValue() < 20
					DialogueQuest.SetStage(10)
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent