ScriptName MS02PlayerScript extends ReferenceAlias

Location Property MarkarthRuinsLocation Auto

auto state BeginState
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == MarkarthRuinsLocation	
			GetOwningQuest().SetStage(77)
			GotoState("DoNothingState")
		EndIf
	EndEvent
EndState

state DoNothingState
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		;do nothing
	EndEvent
EndState