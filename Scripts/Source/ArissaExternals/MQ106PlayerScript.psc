Scriptname MQ106PlayerScript extends ReferenceAlias  
{used to detect player change of location}

; detect when player enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	; watch for player to leave Riverwood
	if GetOwningQuest().getStageDone(50) == 1 && GetOwningQuest().getStageDone(58) == 0
		if akNewLoc != (GetOwningQuest() as MQ106Script).RiverwoodLocation
			GetOwningQuest().SetStage(58)
		endif
	endif

	; watch for player to enter Kynesgrove
	if GetOwningQuest().getStageDone(50) == 1 && GetOwningQuest().getStageDone(65) == 0
		if akNewLoc == (GetOwningQuest() as MQ106Script).KynesgroveLocation
			GetOwningQuest().SetStage(65)
		endif
	endif

	; watch for player to enter burial mound location
	if GetOwningQuest().getStageDone(50) == 1 && GetOwningQuest().getStageDone(75) == 0
		if akNewLoc == (GetOwningQuest() as MQ106Script).KynesgroveBurialMoundLocation
			GetOwningQuest().SetStage(75)
		endif
	endif

endEvent
