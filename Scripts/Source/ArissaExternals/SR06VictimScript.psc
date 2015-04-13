scriptname SR06VictimScript extends ReferenceAlias

import game
import debug

Message property SR06VictimSleepingMessage auto
ReferenceAlias property Boss auto

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		if triggerRef == getPlayer() as actor
			if Boss.GetActorReference().IsDead() == 0
				SR06VictimSleepingMessage.Show()
				gotoState("hasBeenTriggered")
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE