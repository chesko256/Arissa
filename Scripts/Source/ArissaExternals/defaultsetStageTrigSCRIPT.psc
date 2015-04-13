scriptname defaultSetStageTrigSCRIPT extends objectReference
{ this is a generic script for one-shot quest stage updates}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

bool property doOnce = True auto
{Set the stage only once.}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

bool property disableWhenDone = true auto
{ disable myself after I've been triggered. Defaults to true }


auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == getPlayer() as actor
			; check to see if a pre-req stage was specificed and if it's been met
			if prereqStageOPT == -1 || MyQuest.getStageDone(prereqStageOPT) == 1
				; Start the quest just in case it isn't already running.
				if myQuest.isRunning() == FALSE
					bool check = myQuest.start()
					; do a quick check in case the quest could not be started
					if !check
; 						debug.trace("ERROR: "+myQuest+" not started by "+self)
					endif
				endif
				
				; do the actual business of setting the stage we want
				myQuest.setStage(stage)
				if doOnce
					gotoState("hasBeenTriggered")
				endif
				if disableWhenDone
					Disable()
				endif
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
