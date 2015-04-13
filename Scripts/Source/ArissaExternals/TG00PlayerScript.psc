Scriptname TG00PlayerScript extends ReferenceAlias  

Location Property pRiften Auto
Quest Property pTG00Quest Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	if pTG00Quest.GetStage() >= 10 && pTG00Quest.GetStage() < 30
		if Game.GetPlayer().GetCurrentLocation() != pRiften
			pTG00Quest.SetStage(40)
		endif
	endif

endEvent