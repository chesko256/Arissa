ScriptName DA11IntroPlayerScript extends ReferenceAlias

Location Property MarkarthHalloftheDeadLocation Auto
Scene Property DA11HalloftheDeadScene Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	If akOldLoc == MarkarthHalloftheDeadLocation && DA11HalloftheDeadScene.IsPlaying()
		DA11HalloftheDeadScene.Stop()
	EndIf

EndEvent