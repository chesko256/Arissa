scriptName TriggerBoxBase extends objectReference hidden
;
;	This script does nothing by default, it is the base for other trigger scripts
;		to extend by defining the fireTriggerEvent. This base script should handle
;		all logic to determine when to fire the event.
;
;		by default it will fire only once, and only when the player enters it
;=============================================================

import Game

bool property PlayerOnly = True auto
{If true, this trigger box will fire ONLY if the player is triggering it}

objectReference property ActivateRef auto
{If set, this trigger will only fire if this specific ref enters the trigger range}

int property WhenToTrigger = 0 auto
{This property tells the trigger when to fire the event
	0 = On Enter (default)
	1 = On Exit}
	
Auto State WaitingForTrigger
	Event OnTriggerEnter (objectReference TriggerRef)
		if WhenToTrigger == 0
			resolveTriggerLogic(TriggerRef)
		endif
	endEvent

	Event OnTriggerLeave (objectReference TriggerRef)
		if WhenToTrigger == 1
			resolveTriggerLogic(TriggerRef)
		endif
	endEvent
	
endState

State	HasBeenTriggered
	Event OnTriggerEnter(objectReference TriggerRef)
	endEvent
	
	Event OnTriggerLeave(objectReference TriggerRef)
	endEvent
endState

Function resolveTriggerLogic(ObjectReference TriggerRef)
	if PlayerOnly
		if TriggerRef == getPlayer() as Actor
		goToState("HasBeenTriggered")
			fireTriggerEvent()
		endif
	else
		if ActivateRef
			if ActivateRef == TriggerRef
				goToState("HasBeenTriggered")
				fireTriggerEvent()
			endif
		endif
	endif
endFunction

Function fireTriggerEvent()
endFunction

