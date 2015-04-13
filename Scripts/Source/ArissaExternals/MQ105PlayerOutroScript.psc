Scriptname MQ105PlayerOutroScript extends ObjectReference  
{advances outro scene when player & greybeards are all in place}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

MQ105GreybeardOutroScript property greybeardTrigger auto
{ Greybeard outro trigger - check to see if they're all in place }

bool playerInTrigger

auto STATE waiting

	EVENT onTriggerEnter(objectReference triggerRef)
		if CheckTriggerRef(triggerRef)
			playerInTrigger = true
; 			debug.trace(self + " player enters trigger")
;			NEW
			if greybeardTrigger.IsTriggerReady() && playerInTrigger
; 				debug.trace(self + " - everything ready - trigger scene")
				TriggerMe()
			endif
			
;			OLD
;			; start update loop
;			RegisterForUpdate(1)
		endif
	endEVENT

	EVENT OnTriggerLeave(objectReference triggerRef)
		if CheckTriggerRef(triggerRef)
			playerInTrigger = false
; 			debug.trace(self + " player exits trigger")
;			; start update loop
;			UnregisterForUpdate()
		endif
	endEvent

;	Event OnUpdate()
;		; check if greybeards are in position - if so, set stage
;		if greybeardTrigger.IsTriggerReady() && playerInTrigger
; ;			debug.trace(self + " OnUpdate - everything ready - trigger scene")
;			TriggerMe()
;		endif
;	endEvent

endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE

bool function CheckTriggerRef(objectReference triggerRef)
		bool bSuccess = false

		if triggerRef == Game.GetPlayer()
			bSuccess = true
		endif

		return bSuccess
endFunction

; what happens when all my targets are in the trigger?
; override on subclass to change behavior
function TriggerMe()
	myQuest.setStage(stage)
	gotoState("hasBeenTriggered")
	UnregisterForUpdate()
	Disable()
endFunction

; greybeard trigger calls this when ready
function GreybeardsReady()
		if playerInTrigger
			TriggerMe()
		endif
endFunction
