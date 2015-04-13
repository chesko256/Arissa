scriptName DBSanctuaryDB10ExteriorLoadCheck extends objectReference
{Script to enable/disable the DB10 Imagespace Modifier, Smoke, and Rumble FX when the player enters or leaves the Sanctuary.}

ObjectReference property DB10LoadCheckMarker Auto

Event OnCellAttach()
	(DB10LoadCheckMarker as DBSanctuaryDB10LoadCheck).RunLoadCheck()
EndEvent