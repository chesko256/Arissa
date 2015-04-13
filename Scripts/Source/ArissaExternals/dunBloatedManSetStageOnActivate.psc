scriptname dunBloatedManSetStageOnActivate extends objectReference
{Set a quest stage when this object is activated. Nothing specific to DA05 or Bloated Man's Grotto, but not broadly useful enough to genericize it.}

quest property myQuest auto	
{ Quest to call SetStage on}

int property stage auto
{ Stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: Stage that must be set for this trigger to fire }

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		if prereqStageOPT == -1 || MyQuest.getStageDone(prereqStageOPT) == 1
			myQuest.setStage(stage)
			gotoState("hasBeenTriggered")
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE