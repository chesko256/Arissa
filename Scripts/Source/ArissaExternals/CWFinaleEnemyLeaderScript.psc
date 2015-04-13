Scriptname CWFinaleEnemyLeaderScript extends ReferenceAlias  
{Script attached to EnemyLeader alias in CWFinale quest}

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	GetOwningQuest().setStage(150)


	
	if GetOwningQuest().GetStageDone(300)

		ActorBase selfActorBase = GetActorReference().GetActorBase()
		selfActorBase.SetEssential(False)
		selfActorBase.SetProtected(false)
		GetActorReference().kill() ;make it a one shot kill
	
	endif
	
	
EndEvent

Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(330)

EndEvent
 