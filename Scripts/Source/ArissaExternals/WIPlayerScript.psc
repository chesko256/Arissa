Scriptname WIPlayerScript extends ReferenceAlias  
{Script to attach to Player alias in WI quests}

Bool Property StopQuestOnLocationChange = false auto
{Default: false; If the player changes location, should this quest stop?}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if StopQuestOnLocationChange
		GetOwningQuest().Stop()
	
	EndIf

EndEvent
