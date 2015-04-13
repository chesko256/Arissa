Scriptname DA02ElisifScript extends ReferenceAlias  
{Script on DA02 Elisif alias}

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if GetOwningQuest().getStage() >= 50 && akAggressor == Game.GetPlayer()
		GetActorReference().kill(Game.GetPlayer() as Actor)
	
	EndIf

EndEvent

Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(100)
	
EndEvent
