Scriptname defaultsetMultiStageAliasScript extends ReferenceAlias  
{generic script for one-shot quest stage update}

import game
import debug

int Property TriggerType = 0 Auto  
{0 = OnActivate
1 = OnDeath
2 = OnHit
3 = OnTriggerEnter
... etc...
TODO: Convert to enum when we have them
}


int property prereqStage1 auto
{If this stage is active, resultStage1 will be set}

int property resultStage1 auto
{ Stage to set if prereqStage1 is true }

int property prereqStage2 auto
{If this stage is active, resultStage2 will be set}

int property resultStage2 auto
{ Stage to set if prereqStage2 is true }

int testState	; for debugging

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		if TriggerType == 0
			if triggerRef == getPlayer()
				if GetOwningQuest().getStageDone(prereqStage1) == 1
					GetOwningQuest().setStage(resultStage1)
					gotoState("hasBeenTriggered")
				endif
				if GetOwningQuest().getStageDone(prereqStage2) == 1
					GetOwningQuest().setStage(resultStage2)
					gotoState("hasBeenTriggered")
				endif
			endif
		endif
	endEVENT

	Event OnDeath(Actor akKiller)
		if TriggerType == 1
				if GetOwningQuest().getStageDone(prereqStage1) == 1
					GetOwningQuest().setStage(resultStage1)
					gotoState("hasBeenTriggered")
				endif
				if GetOwningQuest().getStageDone(prereqStage2) == 1
					GetOwningQuest().setStage(resultStage2)
					gotoState("hasBeenTriggered")
			endif
		endif
	endEvent

	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		trace("OnHit in waitingForPlayer")
		if TriggerType == 2
				if GetOwningQuest().getStageDone(prereqStage1) == 1
					GetOwningQuest().setStage(resultStage1)
					gotoState("hasBeenTriggered")
				endif
				if GetOwningQuest().getStageDone(prereqStage2) == 1
					GetOwningQuest().setStage(resultStage2)
					gotoState("hasBeenTriggered")
			endif
		endif
	endEvent

	EVENT OnTriggerEnter(objectReference triggerRef)
		if TriggerType == 3
				if GetOwningQuest().getStageDone(prereqStage1) == 1
					GetOwningQuest().setStage(resultStage1)
					gotoState("hasBeenTriggered")
				endif
				if GetOwningQuest().getStageDone(prereqStage2) == 1
					GetOwningQuest().setStage(resultStage2)
					gotoState("hasBeenTriggered")
			endif
		endif
	endEVENT

endSTATE

STATE hasBeenTriggered
	; this state doesn't do anything
	EVENT onActivate(objectReference triggerRef)
	endEvent

	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		trace("OnHit in hasBeenTriggered")
	endEvent

	EVENT onTriggerEnter(objectReference triggerRef)
	endEvent
endSTATE

EVENT onActivate(objectReference triggerRef)
endEvent