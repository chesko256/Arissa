Scriptname defaultSetStageTRIGSpecificFaction extends ObjectReference  
{trigger looking for a particular base actor
 to set a quest stage
}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

Faction property TriggerFaction auto
{faction that trigger is looking for}

bool property disableWhenDone = true auto
{ disable myself after I've been triggered. Defaults to true }

bool property onlyOnce = true auto
{ stage will be set only once. Defaults to true }

auto STATE waitingForActor
	EVENT onTriggerEnter(objectReference triggerRef)
		; check for correct actor
		actor actorRef = triggerRef as actor
		if actorRef != None && actorRef.IsInFaction(TriggerFaction)
			if prereqStageOPT == -1 || MyQuest.getStageDone(prereqStageOPT) == 1
				myQuest.setStage(stage)
				if onlyOnce
					gotoState("hasBeenTriggered")
				endif
				if disableWhenDone
					Disable()
				endif
				trace(self+" triggered by "+actorRef)
			endif
		else
			trace(self+" didn't trigger for actor " + actorRef)
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
