Scriptname defaultOnEnter extends ObjectReference  Conditional
{script to test if one or more actors are in a trigger}

import game
import debug

ActorBase property TriggerActor1 auto
{actor that trigger is looking for - all non-empty trigger actors need to be in trigger in order for IsTriggerReady to be true
 Update OnInit when adding new trigger properties!}

ActorBase property TriggerActor2 auto
{ref that trigger is looking for - all non-empty trigger actors need to be in trigger in order for stage to be set
 Update OnInit when adding new trigger properties!}

ActorBase property TriggerActor3 auto
{ref that trigger is looking for - all non-empty trigger actors need to be in trigger in order for stage to be set
 Update OnInit when adding new trigger properties!}

ActorBase property TriggerActor4 auto
{ref that trigger is looking for - all non-empty trigger actors need to be in trigger in order for stage to be set
 Update OnInit when adding new trigger properties!}

ReferenceAlias property TriggerAlias1 auto
{ref ALIAS that trigger is looking for - all non-empty triggerRefs need to be in trigger in order for stage to be set
 Update OnInit when adding new trigger properties!}


; etc. - add more as needed
bool property disableWhenDone = false  auto
{ disable myself after I've been triggered. Defaults to false }


;total targets currently in the trigger
int targetCountCurrent

;how many targets are we looking for? When targetCountCurrent reaches this, we trigger
int targetCountTotal

Event OnInit()
	; count my non-empty trigger properties
	if TriggerActor1
		targetCountTotal = targetCountTotal + 1
	endif
	if TriggerActor2
		targetCountTotal = targetCountTotal + 1
	endif
	if TriggerActor3
		targetCountTotal = targetCountTotal + 1
	endif
	if TriggerActor4
		targetCountTotal = targetCountTotal + 1
	endif
	if TriggerAlias1
		targetCountTotal = targetCountTotal + 1
	endif
endEvent


auto STATE waiting

	EVENT onTriggerEnter(objectReference triggerRef)
		if CheckTriggerRef(triggerRef)
			; increase ref count
			modTargetCount(1)
			; if all target refs are in the trigger, done
			if bAllTargetsInTrigger
				TriggerMe()
			endif
		endif
	endEVENT

	EVENT OnTriggerLeave(objectReference triggerRef)
		if CheckTriggerRef(triggerRef)
			; decrease ref count
			modTargetCount(-1)
		endif
	endEvent

endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE

function modTargetCount(int modValue)
	targetCountCurrent = targetCountCurrent + modValue
	; failsafe - don't go below 0
	if targetCountCurrent < 0
		targetCountCurrent = 0
	endif
	; update bAllTargetsInTrigger
	if targetCountCurrent >= targetCountTotal
		bAllTargetsInTrigger = true
	else
		bAllTargetsInTrigger = false
	endif
endFunction

int function GetCurrentTargetCount()
	return targetCountCurrent
endFunction

int function GetTotalTargetCount()
	return targetCountTotal
endFunction

bool function IsTriggerReady()
	return ( GetCurrentTargetCount() >= GetTotalTargetCount() )
endfunction

bool function CheckTriggerRef(objectReference triggerRef)
; 		debug.trace(self + "CheckTriggerRef for " + triggerRef)
		bool bSuccess = false

		if triggerRef
			Actor triggerActor = triggerRef as Actor
		
			if triggerActor
				; we have an actor, check if it matches any of our trigger actors
				ActorBase triggerActorBase = triggerActor.GetActorBase()
; 				debug.trace(self + "CheckTriggerRef for " + triggerRef + ": actorbase=" + triggerActorBase)
				if triggerActorBase == TriggerActor1 || triggerActorBase == TriggerActor2 || triggerActorBase == TriggerActor3 || triggerActorBase == TriggerActor4
; 					debug.trace(self + "CheckTriggerRef for " + triggerRef + ": MATCHED")
					bSuccess = true
				else
; 					debug.trace(self + "CheckTriggerRef for " + triggerRef + ": failed to match " + TriggerActor1 + ", " + TriggerActor2 + ", " + TriggerActor3 + ", " + TriggerActor4)
				endif
			endif
			; if we haven't already found something, check aliases
			if !bSuccess
				if (TriggerAlias1 && triggerRef == TriggerAlias1.GetRef())
					bSuccess = true
				endif
			endif
		endif

		return bSuccess
endFunction

; what happens when all my targets are in the trigger?
; override on subclass to change behavior
function TriggerMe()
	if disableWhenDone
		gotoState("hasBeenTriggered")
		Disable()
	endif
endFunction

bool Property bAllTargetsInTrigger = false Auto  conditional
{true when all targets are in trigger}