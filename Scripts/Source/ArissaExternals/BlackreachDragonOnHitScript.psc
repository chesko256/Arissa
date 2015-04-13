Scriptname BlackreachDragonOnHitScript extends ReferenceAlias  
{watch for being low health, if so kill looping scene}

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if GetOwningQuest().GetStageDone(30) == 0
		if self.GetActorRef().IsAllowedToFly() == false
			GetOwningQuest().setstage(30)
		endif
	endif
endEvent