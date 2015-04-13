scriptname defaultSetStageOnOpenSCRIPT extends objectReference
{ this is a generic script for one-shot quest stage updates
  put on a door, sets stage when door is opened by player}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		if triggerRef == getPlayer() as actor
			if (self.GetOpenState() == 1 || self.GetOpenState() == 2) ; Open or opening
				if prereqStageOPT == -1 || MyQuest.getStageDone(prereqStageOPT) == 1
					myQuest.setStage(stage)
					gotoState("hasBeenTriggered")
				endIf
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE