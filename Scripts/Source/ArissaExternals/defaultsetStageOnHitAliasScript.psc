Scriptname defaultsetStageOnHitAliasScript extends ReferenceAlias  
{generic script for one-shot quest stage update}

import game
import debug

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

int testState	; for debugging

bool property playerOnly = True auto

auto STATE waitingForPlayer
	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		trace(self + " OnHit in waitingForPlayer")
		testForTrigger(akAggressor, 2)
	endEvent

endSTATE

STATE hasBeenTriggered
	; this state doesn't do anything
	EVENT onActivate(objectReference triggerRef)
	endEvent

	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		trace(self + " OnHit in hasBeenTriggered")
	endEvent

	EVENT onTriggerEnter(objectReference triggerRef)
	endEvent

	Event OnEquipped(Actor akActor)
	endEvent
endSTATE

EVENT onActivate(objectReference triggerRef)
endEvent

function testForTrigger(objectReference triggerRef, int pTestTriggerType)
; 	debug.trace(self + " testForTrigger, triggerRef=" + triggerRef + ", triggerType=" + pTestTriggerType)
	if TriggerType == pTestTriggerType
		if (triggerRef == getPlayer() || !playerOnly)
			if prereqStageOPT == -1 || GetOwningQuest().getStageDone(prereqStageOPT) == 1
; 				debug.trace(self + " testforTrigger SUCCEEDED")
				GetOwningQuest().setStage(stage)
				gotoState("hasBeenTriggered")
			endif
		endif
	endif
endFunction

int Property TriggerType = 2 Auto  hidden
{0 = OnActivate
1 = OnDeath
2 = OnHit
3 = OnTriggerEnter
4 = OnEquipped
5 = OnCombatBegin
6 = OnCellLoad
7 = Added to player inventory
8 = Removed from player inventory

... etc...
TODO: Convert to enum when we have them
}
