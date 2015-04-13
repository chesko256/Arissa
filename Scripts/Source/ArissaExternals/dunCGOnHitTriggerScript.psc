Scriptname dunCGOnHitTriggerScript extends ObjectReference  

import debug
import utility

Actor property myDragon auto
ObjectReference property myExplosionMarker auto
Explosion property myExplosion auto
Projectile property myDragonProjectile auto

;************************************

auto State Waiting
	
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		Actor actorRef = akAggressor as Actor
		
		if((actorRef == myDragon) && (myDragonProjectile == akProjectile))
			;Dragon has hit with correct projectile
			myExplosionMarker.placeatme(myExplosion)
			self.disable()
		endif
		
	endEvent
endState

;************************************