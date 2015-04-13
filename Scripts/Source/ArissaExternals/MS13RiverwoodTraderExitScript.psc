scriptname MS13RiverwoodTraderExitScript extends objectReference

import game
import debug

Quest property MS13 auto

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == getPlayer() as actor
				If ((MS13 as MS13QuestScript).CamillaForceGreet == 1)
					(MS13 as MS13QuestScript).CamillaForceGreet = 0
				EndIf
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE