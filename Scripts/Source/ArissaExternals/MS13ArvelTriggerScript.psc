scriptname MS13ArvelTriggerScript extends objectReference

import game
import debug

Scene Property ArvelShout auto

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == getPlayer() as actor
				ArvelShout.Start()
				gotoState("hasBeenTriggered")
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE