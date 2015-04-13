Scriptname CWAttackCityBodyguardOneHitScript extends ReferenceAlias  

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	GetActorReference().kill()	

EndEvent
