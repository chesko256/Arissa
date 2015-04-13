Scriptname WIChangeLocation04PlayerScript Extends ReferenceAlias

ReferenceAlias Property Student Auto

Keyword Property MagicWard Auto

Int Property CountHit Auto Conditional Hidden


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	if akAggressor == Student.GetActorReference()
		if Game.GetPlayer().HasEffectKeyword(MagicWard)
			CountHit += 1
		
			(GetOwningQuest() as WIChangeLocation04Script).countHit = countHit
		
		EndIf
	
	EndIf
	
EndEvent
