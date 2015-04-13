Scriptname ExecutionInterruptTriggerScript extends ReferenceAlias  
{generic script for one-shot quest stage update}

import game
import debug

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

faction property CurrentFollowerFaction auto

int testState	; for debugging

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		testForTrigger(triggerRef, 0)
	endEVENT

	Event OnDeath(Actor akKiller)
		testForTrigger(getPlayer(), 1)
	endEvent

	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		trace(self + " OnHit in waitingForPlayer")
		testForTrigger(akAggressor, 2)
	endEvent

	EVENT OnTriggerEnter(objectReference triggerRef)
		testForTrigger(triggerRef, 3)
	endEVENT

	Event OnEquipped(Actor akActor)
		testForTrigger(akActor, 4)
	endEvent

	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		if aeCombatState != 0 ; 0 = not in combat, so non-zero means entered combat
			; FOR NOW, don't care if its player
			testForTrigger(getPlayer(), 5)
;			testForTrigger(akTarget, 5)
		endIf
	endEvent

	Event OnCellLoad()
		testForTrigger(Game.GetPlayer(), 6)
	endEvent
	
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		; trigger if object is added to player's inventory
		testForTrigger(akNewContainer, 7)
		; trigger if object is removed from player's inventory
		testForTrigger(akOldContainer, 8)
	endEvent
	
	Event OnOpen(ObjectReference akActionRef)
		testForTrigger(Game.GetPlayer(), 9)
	endEvent
	
	Event onRead()
; 		debug.Trace(self + " has been read")
		testForTrigger(Game.GetPlayer(), 10)
	endEvent

	Event OnEnterBleedout()
		testForTrigger(Game.GetPlayer(), 11)
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
		if triggerRef == getPlayer() || (triggerRef as Actor).IsInFaction(CurrentFollowerFaction)
			if prereqStageOPT == -1 || GetOwningQuest().getStageDone(prereqStageOPT) == 1
; 				debug.trace(self + " testforTrigger SUCCEEDED")
				GetOwningQuest().setStage(stage)
				gotoState("hasBeenTriggered")
			endif
		endif
	endif
endFunction

int Property TriggerType = 0 Auto  
{0 = OnActivate
1 = OnDeath
2 = OnHit
3 = OnTriggerEnter
4 = OnEquipped
5 = OnCombatBegin
6 = OnCellLoad
7 = Added to player inventory
8 = Removed from player inventory
9 = OnOpen (for Doors and Containers)
10 = onRead (for books)
11 = OnEnterBleedout

... etc...
TODO: Convert to enum when we have them
}
