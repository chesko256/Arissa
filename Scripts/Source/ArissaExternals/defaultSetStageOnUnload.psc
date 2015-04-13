scriptname defaultSetStageOnUnload extends objectReference
{Sets a stage when this object unloads.}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

bool property disableWhenDone = true auto
{ disable myself after I've been triggered. Defaults to true }


auto STATE waitingForPlayer
	Event OnUnload()
		if prereqStageOPT == -1 || MyQuest.getStageDone(prereqStageOPT) == 1
			; Start the quest just in case it isn't already running.
			if myQuest.isRunning() == FALSE
				bool check = myQuest.start()
				; do a quick check in case the quest could not be started
				if !check
; 					debug.trace("ERROR: "+myQuest+" not started by "+self)
				endif
			endif
				
			; do the actual business of setting the stage we want
			myQuest.setStage(stage)
			gotoState("hasBeenTriggered")
			if disableWhenDone
				Disable()
			EndIf
		endif
	EndEvent
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
