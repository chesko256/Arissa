Scriptname C00PlayerWatchingScript extends ReferenceAlias  
{The player gets put in here at certain points in C00 so we can watch for if he leaves during a scene.}


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	Debug.Trace("C00: Player changing location.")
	if     (GetOwningQuest().GetStage() <= 10)
		(GetOwningQuest() as CompanionsHousekeepingScript).PlayerWalkedAwayDuringKVScene = True
	elseif (GetOwningQuest().GetStage() == 40)
		(GetOwningQuest() as CompanionsHousekeepingScript).PlayerWalkedAwayDuringSAScene = True
	endif
EndEvent


