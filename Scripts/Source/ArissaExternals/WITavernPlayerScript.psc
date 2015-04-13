Scriptname WITavernPlayerScript Extends ReferenceAlias
{Script on Player Alias in WITavern quest}

 Event OnSit(ObjectReference akFurniture)
;	debug.MessageBox("WITavernPlayerScript Player sat down.")
 
	(GetOwningQuest() as WITavernScript).PlayerSatDown()

EndEvent

 Event OnGetUp(ObjectReference akFurniture)
;	debug.MessageBox("WITavernPlayerScript Player got up.")
 

EndEvent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		(GetOwningQuest() as WITavernScript).PlayerCHangedLocation()
	
EndEvent

