Scriptname MQ105SprintTriggerScript extends Trigger  conditional

{
This script keeps track of the player entering and leaving trigger.
}

import debug
import utility

Quest Property MQ105 auto
Scene Property SprintTrialScene auto

function fireTriggerEvent()
	if IsTargetInTrigger()
; 		debug.trace(self + " player ENTERS")
		(MQ105 as MQ105QuestScript).SprintStartTriggerChangeState(true)
	else
; 		debug.trace(self + " player EXITS")
		(MQ105 as MQ105QuestScript).SprintStartTriggerChangeState(false)
	endif
endFunction
