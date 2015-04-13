Scriptname dunTransmogrifyAnimal extends ObjectReference  

OBJECTREFERENCE PROPERTY storedActor AUTO
EXPLOSION PROPERTY appearExplosion AUTO
EFFECTSHADER PROPERTY shader AUTO

EVENT onLoad()

	SELF.placeAtMe(appearExplosion)
	shader.play(SELF, 2)
	
	utility.wait(15)
	
	IF(SELF.isEnabled() == TRUE)
		storedActor.moveTo(SELF)
		storedActor.enableNoWait()	
		storedActor.placeAtMe(appearExplosion)
		storedActor.moveTo(SELF)
		SELF.disableNoWait()
	ENDIF

endEVENT


EVENT onHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked) 

	IF(akAggressor == game.getPlayer())	
		storedActor.moveTo(SELF)
		storedActor.enableNoWait()
		storedActor.placeAtMe(appearExplosion)
		shader.play(storedActor, 2)
		storedActor.moveTo(SELF)
		SELF.disableNoWait()
	ENDIF

endEVENT
