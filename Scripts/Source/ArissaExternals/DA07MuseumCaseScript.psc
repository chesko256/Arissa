ScriptName DA07MuseumCaseScript extends ObjectReference

Int Property iSceneStartStage Auto
Int Property iSceneCompletedStage Auto
Quest Property pDA07MuseumScenes Auto

Event OnActivate(ObjectReference akActionRef)

	If (akActionRef == Game.GetPlayer()) && (pDA07MuseumScenes.GetStageDone(iSceneCompletedStage) == 0)
		pDA07MuseumScenes.SetStage(iSceneStartStage)
	EndIf
	
EndEvent