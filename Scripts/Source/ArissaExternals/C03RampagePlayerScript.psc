Scriptname C03RampagePlayerScript extends ReferenceAlias  


Event OnEnterBleedout()
; 	Debug.Trace("C03: Player entering bleedout; turning back.")
	(GetOwningQuest() as C03RampageQuest).TurnBack()
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	float healthPerc = Game.GetPlayer().GetActorValuePercentage("health")
; 	Debug.Trace("C03: Player's health at " + (healthPerc * 100.0) + "%")
	if (healthPerc < 0.2)
; 		Debug.Trace("C03: Player health below 20%; turning back.")
		(GetOwningQuest() as C03RampageQuest).TurnBack()
	endif
EndEvent
