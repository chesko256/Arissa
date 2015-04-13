Scriptname JailQuestPlayerScript extends ReferenceAlias  
{if player leaves jail location before getting objective, kill quest}


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if !Game.GetPlayer().IsInLocation(EscapeHold.GetLocation())
		if GetOwningQuest().GetStage() < 20
			GetOwningQuest().SetStage(100)
		endif
	endif
endEvent

LocationAlias Property EscapeHold  Auto  
