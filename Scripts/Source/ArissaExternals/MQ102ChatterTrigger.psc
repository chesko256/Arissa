Scriptname MQ102ChatterTrigger extends ObjectReference  
{sets MQ102 variable for chatter on way to Riverwood}

import game
import debug

quest property MQ102A auto	
quest property MQ102B auto	

int property chatterValue auto
{ value to set}

Faction property TriggerFaction auto
{actor faction that trigger is looking for}

auto STATE waitingForActor
	EVENT onTriggerEnter(objectReference triggerRef)
		; check for correct actor
		actor actorRef = triggerRef as actor
		if actorRef != None && actorRef.IsInFaction(triggerFaction)
			SetChatterValue(MQ102A, chatterValue)
			SetChatterValue(MQ102B, chatterValue)
			gotoState("hasBeenTriggered")
			disable()
			trace(self+" triggered by "+actorRef)
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE

function SetChatterValue(quest myQuest, int newValue)
	; only set if larger than current
	MQ102QuestScript myScript = myQuest as MQ102QuestScript
	if myScript.FriendTravelChatter < newValue
		myScript.FriendTravelChatter = newValue
	endif
endFunction