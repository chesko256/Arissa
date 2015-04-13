Scriptname MQ305AlduinScript extends ReferenceAlias  
{make sure Alduin becomes vulnerable when he can't fly}


Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	; make sure his invulnerability stays in synch with his flying state
; 	debug.trace(self + "OnHit - IsAllowedToFly = " + GetActorRef().IsAllowedToFly())
	GetActorRef().GetActorBase().SetInvulnerable(GetActorRef().IsAllowedToFly())
; 	debug.trace(self + "OnHit - IsInvulnerable = " + GetActorRef().GetActorBase().IsInvulnerable())
endEvent
