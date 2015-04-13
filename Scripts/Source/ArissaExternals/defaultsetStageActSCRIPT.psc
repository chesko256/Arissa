scriptname defaultSetStageActSCRIPT extends objectReference
{ this is a generic script for one-shot quest stage updates}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

float property delay = 0.0 auto
{ OPTIONAL: Amount of time to wait until setting the stage.  Defaults to 0 }

bool property requirePlayerActivation = True auto
{ Whether or not the player needs to be the one to activate this: Defaults to True}

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		if (triggerRef == getPlayer() as actor || !requirePlayerActivation)
			if prereqStageOPT == -1 || MyQuest.getStageDone(prereqStageOPT) == 1
				utility.Wait(delay)
				myQuest.setStage(stage)
				gotoState("hasBeenTriggered")
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE