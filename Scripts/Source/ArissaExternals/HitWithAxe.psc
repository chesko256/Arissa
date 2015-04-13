Scriptname HitWithAxe extends ReferenceAlias  
{generic script for one-shot quest stage update}

import game
import debug

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

ReferenceAlias Property Alias_Barbas auto

ReferenceAlias Property DA03RuefelAxe auto

auto STATE waitingForPlayer
	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if (akWeapon == DA03RuefelAxe.Getref())																	;trace(self + " OnHit in waitingForPlayer")
 			if prereqStageOPT == -1 || GetOwningQuest().getStageDone(prereqStageOPT) == 1							;debug.trace(self + " testforTrigger SUCCEEDED")
				Alias_Barbas.GetActorRef().GetActorBase().setEssential(0)
				Alias_Barbas.GetActorRef().kill()
			endif
		endif
	endEvent
endSTATE



STATE hasBeenTriggered
	; this state doesn't do anything
endSTATE