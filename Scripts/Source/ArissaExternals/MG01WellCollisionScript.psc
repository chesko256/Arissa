Scriptname MG01WellCollisionScript extends ObjectReference  


ReferenceAlias Property MG01FaraldaAlias Auto

Spell Property Magelight Auto



Event OnHit(ObjectReference Aggressor, Form Source, Projectile AkProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)


if Source == Magelight
	if Aggressor == MG01FaraldaAlias.GetReference()
		GetLinkedRef().SetAnimationVariableFloat("fmagicburnamount", 1)
		Self.Disable()
	endif
endif


EndEvent