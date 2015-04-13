Scriptname NEAliasSetstageTriggerScript extends ReferenceAlias  


import game



int property StageToSet auto
{Owning Quests Setstage}

int property CheckForStage auto
{ Check Owning Quests Stage Before Setting}


auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == getPlayer()
			if GetOwningQuest().GetCurrentStageID() == CheckForStage
					GetOwningQuest().setStage(StageToSet)	
					gotoState("hasBeenTriggered") 					;trigger will only trigger once
			endif
		endif
	endEVENT
endSTATE


STATE hasBeenTriggered
	; this is an empty state.
endSTATE
