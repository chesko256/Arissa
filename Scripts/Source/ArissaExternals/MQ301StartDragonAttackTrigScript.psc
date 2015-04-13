Scriptname MQ301StartDragonAttackTrigScript extends ObjectReference  

Quest Property MQ301  Auto  

int Property DragonAttackStage Auto
{what stage to advance to when triggered?}

ObjectReference Property TriggerActor Auto
{which actor triggers this?}

import game
import debug

auto STATE waiting
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == TriggerActor
			trace(self + ": " + TriggerActor + " entered stage " + dragonAttackStage + " trigger")
			; when actor enters the trigger at the right time, initiate the scene
			if MQ301.GetStageDone(120) == 1 && MQ301.GetStageDone(180) == 0 && (triggerRef as Actor).GetFlyingState() == 0
				if (MQ301 as MQ301Script).AdvanceDragonAttackScene(DragonAttackStage)
					gotoState("hasBeenTriggered")
				endif
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE

; called by the scene when it ends. Ready to restart
function ResetScene()
	; puts back into waiting state
	gotoState("waiting")
endFunction
