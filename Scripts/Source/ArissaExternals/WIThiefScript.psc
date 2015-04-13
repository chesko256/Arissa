Scriptname WIThiefScript extends ReferenceAlias  
{script on Thief alias in WIThief01}

Faction Property WIPlayerEnemyFaction Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

; 	debug.trace(self + "OnHit()")
	
	Actor SelfActor = GetActorReference()
	
	selfActor.SetActorValue("Aggression", 2)
	selfActor.SetActorValue("Confidence", 4)
	selfActor.AddToFaction(WIPlayerEnemyFaction)

	(GetOwningQuest() as WIThief01Script).HasBeenAttacked = True
	
	selfActor.EvaluatePackage()
	
EndEvent
