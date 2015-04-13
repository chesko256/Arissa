Scriptname DA02DeadFriendScript extends ReferenceAlias  

;REF FORCED BY DA02PillarScript

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	
	actor SelfActor = GetActorReference()

	(GetOwningQuest() as DA02Script).PillarKill(SelfActor)
	
EndEvent
