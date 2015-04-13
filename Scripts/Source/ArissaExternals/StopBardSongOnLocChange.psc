Scriptname StopBardSongOnLocChange extends ReferenceAlias  

Quest Property BardSongs  Auto  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	(BardSongs as BardSongsScript).StopAllSongs()
endEvent

