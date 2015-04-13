ScriptName DA07MuseumTriggerScript extends ObjectReference

Int Property iSceneStartStage Auto
Int Property iSceneCompletedStage Auto
Quest Property pDA07MuseumScenes Auto
Quest Property pDA07 Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	If (akActionRef == Game.GetPlayer()) && (pDA07MuseumScenes.GetStageDone(iSceneCompletedStage) == 0) && (pDA07.GetStageDone(50) == 0)
		pDA07MuseumScenes.SetStage(iSceneStartStage)
	EndIf
	
EndEvent