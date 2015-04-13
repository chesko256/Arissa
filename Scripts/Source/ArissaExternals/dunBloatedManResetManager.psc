Scriptname dunBloatedManResetManager extends ObjectReference  
{On reset, if DA05 is completed and Sinding is dead, restore the level to its original state.}

Quest property DA05 Auto
{DA05}

ObjectReference property PreDA05EnableMarker Auto
ObjectReference property QuestStartedEnableMarker Auto
ObjectReference property BloatedManEnableMarker Auto

Event OnReset()
	if (DA05.GetStageDone(100))
		PreDA05EnableMarker.Enable()
		QuestStartedEnableMarker.Disable()
		BloatedManEnableMarker.Disable()
	EndIf
EndEvent
	