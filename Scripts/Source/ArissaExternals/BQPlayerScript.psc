Scriptname BQPlayerScript extends ReferenceAlias  
{Script attached to Player Alias in BQ quests (handles shutting down the quest if the player leaves before getting it)}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	(GetOwningQuest() as BQScript).PlayerChangedLocation()

EndEvent
