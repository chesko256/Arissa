Scriptname MS07setstageonhitaliasscript extends ReferenceAlias  
{generic script for one-shot quest stage update}

import game
import debug

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

bool property playerOnly = True auto

auto STATE waitingForPlayer
	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if (akAggressor == getPlayer() || !playerOnly)																	;trace(self + " OnHit in waitingForPlayer")
 			if prereqStageOPT == -1 || GetOwningQuest().getStageDone(prereqStageOPT) == 1							;debug.trace(self + " testforTrigger SUCCEEDED")
				GetOwningQuest().setStage(stage)
				gotoState("hasBeenTriggered")
			endif
		endif
	endEvent
endSTATE



STATE hasBeenTriggered
	; this state doesn't do anything
endSTATE


