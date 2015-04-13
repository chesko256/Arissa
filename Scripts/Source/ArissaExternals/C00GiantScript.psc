Scriptname C00GiantScript extends ReferenceAlias


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (Game.GetPlayer() == akAggressor && !GetActorReference().IsDead())
		(GetOwningQuest() as C00GiantAttackScript).PlayerAttacked = True
		((GetOwningQuest() as C00GiantAttackScript).CentralQuest as CompanionsHousekeepingScript).PlayerHelpedCompanionsAtGiant = True
		GetOwningQuest().SetStage(20)
	endif
EndEvent

Event OnDying(Actor akKiller)
	GetOwningQuest().SetStage(30)
EndEvent

