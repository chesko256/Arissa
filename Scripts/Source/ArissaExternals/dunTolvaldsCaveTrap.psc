Scriptname dunTolvaldsCaveTrap extends objectReference Hidden
{generic script for one-shot quest stage update}

import game
import debug

quest property myQuest auto
{ OPTIONAL: stage that must be set for this trigger to fire }

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		if triggerRef == getPlayer() && myQuest.getStage() == 0
			dunTolvaldsCaveSCRIPT questScript = (myQuest as quest) as dunTolvaldsCaveScript
			questScript.SpringTrap()
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this state doesn't do anything
	EVENT onActivate(objectReference triggerRef)
	endEvent
endSTATE

EVENT onActivate(objectReference triggerRef)
endEvent