Scriptname spellSummonDraugrBomb extends ACTOR  


EXPLOSION PROPERTY fireballExplosion AUTO
EffectShader Property AtronachUnsummonDeathFXS Auto

BOOL doOnce=TRUE

EVENT onLoad()
	
	utility.wait(5)
	
	IF(doOnce && SELF.is3DLoaded())
		SELF.placeAtMe(fireballExplosion)
		doOnce = FALSE
		utility.wait(0.1)
		disable()
		utility.wait(0.5)	
		delete()
	ENDIF
	
ENDEVENT

EVENT onHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	IF(doOnce)
		SELF.placeAtMe(fireballExplosion)
		doOnce = FALSE
		utility.wait(0.1)
		disable()
		utility.wait(0.5)	
		delete()
	ENDIF

ENDEVENT

	EVENT onDying(actor myKiller)
		AtronachUnsummonDeathFXS.Play(self)
	ENDEVENT
	
	
