Scriptname MQ304PlayerScript extends ReferenceAlias  
{used to detect player change of location}

import game

; detect when player enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	; watch for player to enter Sovngarde Hall of Heroes location
		if akNewLoc == (GetOwningQuest() as MQ304Script).SovngardeHallofHeroesLocation
			DisablePlayerControls(abMovement = false, abFighting = true, abActivate=false, abMenu=false, abSneaking=true)			
		endif

	; watch for player to leave Hall of Heroes
		if akNewLoc != (GetOwningQuest() as MQ304Script).SovngardeHallofHeroesLocation
			EnablePlayerControls()
		endif
endEvent

