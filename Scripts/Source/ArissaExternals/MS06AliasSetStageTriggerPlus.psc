Scriptname MS06AliasSetStageTriggerPlus extends ReferenceAlias  
{ MS06 specific Alias based Setstage Trigger that that verifies MS05 is not in a range of stages before setting the stage.}

import game
import debug

int property MS06StageToSet auto

quest property MS05 auto
{declare MS05 property for checks}

quest property MQ302 auto
{declare MQ302 property for checks}

int property MS05DoNotStartRangeLowestStage auto
{ If MS05 is at this stage or above do not start MS06}

int property MS05DoNotStartRangeHighestStage auto
{ If MS05 is at this stage or below do not start MS06}



auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == getPlayer()
			if MS05.GetCurrentStageID() < MS05DoNotStartRangeLowestStage || MS05.GetCurrentStageID() > MS05DoNotStartRangeHighestStage 	;if outside of range
				if !MQ302.isrunning()
					GetOwningQuest().setStage(MS06StageToSet)	
					gotoState("hasBeenTriggered") 					;trigger will only trigger once
				endif
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE