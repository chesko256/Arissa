scriptName dunBloatedManSetStageOnLoad extends ObjectReference
{ When loading into the exterior, check if we're in Stage 105 (Sinding-allied, post-quest). If so, clean up the Grotto, since DA05 has ended and can't request it.}

Quest property DA05 Auto
Quest property dunDeadMensRespiteQST Auto

Event OnLoad()
	if (DA05.GetStage() >= 50 && DA05.GetStage() < 105)
		Weather.ReleaseOverride()
	EndIf
	if (DA05.GetStage() >= 100)
		dunDeadMensRespiteQST.SetStage(105)
	EndIf
EndEvent