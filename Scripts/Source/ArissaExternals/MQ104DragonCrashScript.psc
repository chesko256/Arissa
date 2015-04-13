Scriptname MQ104DragonCrashScript extends ObjectReference  
{script for trigger on dragon crash
might be temp if this gets hooked up to animation events
}

Quest Property MQ104  Auto  

ObjectReference Property TriggerActor Auto
{which actor triggers this?}

import game
import debug

auto STATE waiting
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == TriggerActor
			int flyingState =  (triggerRef as Actor).GetFlyingState()
			bool allowedToFly = (triggerRef as Actor).IsAllowedToFly()

			trace(self + ": " + TriggerActor + " entered, flying state = " + flyingState + ", allowedToFly=" + allowedToFly )
			; when actor enters the trigger at the right time, initiate the scene
			if MQ104.GetStageDone(65) == 1 && MQ104.GetStageDone(80) == 0 && flyingState == 0
				MQ104.SetStage(70)
				gotoState("hasBeenTriggered")
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
