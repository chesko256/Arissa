scriptname MS01GuardTriggerScript extends ReferenceAlias

import game
import debug

quest property MS01 auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		MS01QuestScript MyQuest
		MyQuest = MS01 as MS01QuestScript
		if (triggerRef == getPlayer() as actor) && (MyQuest.GuardAmbush == 1)
			if prereqStageOPT == -1 || MS01.getStageDone(prereqStageOPT) == 1
				MS01.setStage(stage)
				gotoState("hasBeenTriggered")
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE