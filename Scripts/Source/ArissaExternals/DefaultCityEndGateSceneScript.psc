ScriptName DefaultCityEndGateSceneScript extends ObjectReference

Quest Property myQuest Auto
Int Property EndStage Auto

Event OnCellLoad()

	If (myQuest.GetStageDone(EndStage) == 0)
		myQuest.SetStage(EndStage)
	EndIf

EndEvent