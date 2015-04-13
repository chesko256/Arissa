Scriptname MS06IntroTrigScript extends ObjectReference  
{ this is the MS06 script for one-shot quest stage updates}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

quest property MS05 auto	
{ Pass in MSo6 so you can check that your not in an MS05 stage.}

int property MS05prereqStageOPT = 5000 auto
{ OPTIONAL: Lowest MS05 stage that must not be set for this trigger to fire }

int property MS05prereqStageOPT2 = 5000 auto
{ OPTIONAL: Highest MS05 stage that must not be set for this trigger to fire }

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == getPlayer() as actor
			if MS05.GetStage() < MS05prereqStageOPT || MS05.GetStage() >  MS05prereqStageOPT2
				myQuest.setStage(stage)
				gotoState("hasBeenTriggered")
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE