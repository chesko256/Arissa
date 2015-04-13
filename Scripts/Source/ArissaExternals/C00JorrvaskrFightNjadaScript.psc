Scriptname C00JorrvaskrFightNjadaScript extends ReferenceAlias  


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (akAggressor == Game.GetPlayer())
		(GetOwningQuest() as C00JorrvaskrFightSceneScript).PlayerEndedFight = True
		GetOwningQuest().Stop()
	endif
EndEvent
