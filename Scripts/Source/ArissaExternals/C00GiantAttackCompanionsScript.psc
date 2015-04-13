Scriptname C00GiantAttackCompanionsScript extends ReferenceAlias  


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (Game.GetPlayer() == akAggressor)
		GetOwningQuest().SetStage(20)
	endif
EndEvent
