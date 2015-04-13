scriptname MS13SpiderTriggerScript extends objectReference

import game
import debug

Quest Property pMS13 auto

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == getPlayer() as actor
				pMS13.SetStage(20)
				gotoState("hasBeenTriggered")
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE