Scriptname WIAssault02EnemyScript extends ReferenceAlias  
{Sets quest stage when player attacks the Enemy.}

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if akAggressor == game.getPlayer()
		GetOwningQuest().SetStage(30)
	endif
EndEvent