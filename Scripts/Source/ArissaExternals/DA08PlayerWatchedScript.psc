Scriptname DA08PlayerWatchedScript extends ReferenceAlias  



Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	Debug.Trace("DA08: Player changing location.")
	(GetOwningQuest() as DA08QuestScript).PlayerMoving()
EndEvent
