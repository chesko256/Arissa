scriptName POIVolcanicHunterCampPropertyScript extends objectReference
{this script will make the faction hostile to the player when the ref is stolen or grabbed}


faction property POIVolcanicHunterFaction auto
faction property playerFaction auto

event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == game.getPlayer()
		POIVolcanicHunterFaction.setEnemy(playerFaction)
	endif
endEvent

event onGrab()
	POIVolcanicHunterFaction.setEnemy(playerFaction)
endEvent


