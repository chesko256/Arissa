Scriptname dunCGOnHitActorScript extends ReferenceAlias

import debug
import utility

Actor property myDragon auto
Projectile property myDragonProjectile auto
Quest property myQuest auto

;************************************

auto State Waiting
	
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		Actor actorRef = akAggressor as Actor
		if((myQuest.getStage() >= 100) && (myQuest.getStage() <= 110))
		
			if((actorRef == myDragon) && (myDragonProjectile == akProjectile))
				;Actor has been hit with correct projectile
				gotoState("DoNothing")
				self.getActorReference().kill()
			endif
		endif
	endEvent
endState

;************************************

State done
	;do nothing
endState

;************************************
