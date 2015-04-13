Scriptname CWFinaleEnemySecondScript extends ReferenceAlias  
{Script attached to EnemySecond alias in CWFinale quest}

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	GetOwningQuest().setStage(150)

EndEvent

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as CWFinaleScript).EnemySecondDied()

EndEvent
