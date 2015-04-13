Scriptname MS04StartQuestTriggerScript extends ReferenceAlias  

import game
import debug

int property stage auto
{ stage to set, this will only set if the current quest is at stage 5 of greater}


auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == getPlayer()
			if GetOwningQuest().GetCurrentStageID() <= 5
				GetOwningQuest().setStage(stage)
				gotoState("hasBeenTriggered")
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE