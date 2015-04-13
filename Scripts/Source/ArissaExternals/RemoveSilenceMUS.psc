Scriptname RemoveSilenceMUS Extends ReferenceAlias   


musictype Property MUSTavernSilence Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	MUSTavernSilence.Remove()
EndEvent