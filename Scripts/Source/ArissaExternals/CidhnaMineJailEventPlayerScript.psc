ScriptName CidhnaMineJailEventPlayerScript Extends ReferenceAlias

Location Property CidhnaMineLocation Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	If akOldLoc == CidhnaMineLocation
	
		GetOwningQuest().SetStage(100)
	
	EndIf

EndEvent