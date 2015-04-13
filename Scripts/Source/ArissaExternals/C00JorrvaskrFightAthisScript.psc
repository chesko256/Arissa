Scriptname C00JorrvaskrFightAthisScript extends ReferenceAlias  


Event OnEnterBleedout()
; 	Debug.Trace("C00: Athis entered bleedout; shutting down fight.")
	GetActorReference().GetActorBase().SetInvulnerable(true)
	Utility.Wait(4.0)
	GetOwningQuest().Stop()
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (akAggressor == Game.GetPlayer())
		(GetOwningQuest() as C00JorrvaskrFightSceneScript).PlayerEndedFight = True
		GetOwningQuest().Stop()
	endif
EndEvent
