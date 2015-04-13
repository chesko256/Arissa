Scriptname MQ302PlayerScript extends ReferenceAlias  
{used to detect player change of location}

; detect when player enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	; watch for player to enter High Hrothgar location
	if GetOwningQuest().getStageDone(40) == 1 && GetOwningQuest().getStageDone(50) == 0
		if akNewLoc == (GetOwningQuest() as MQ302Script).HighHrothgarLocation
			GetOwningQuest().SetStage(50)
		endif
	endif

	; watch for player to leave High Hrothgar location after council
	if GetOwningQuest().getStageDone(300) == 1 && GetOwningQuest().getStageDone(320) == 0
		if akNewLoc != (GetOwningQuest() as MQ302Script).HighHrothgarLocation
			GetOwningQuest().SetStage(320)
		endif
	endif

endEvent
