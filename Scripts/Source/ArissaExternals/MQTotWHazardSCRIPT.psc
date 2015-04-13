Scriptname MQTotWHazardSCRIPT extends ObjectReference  
	projectile property voiceClearSkiesProjectile01 auto		
	{Projectile fired by syllable 1}
	projectile property voiceClearSkiesProjectile03 auto		
	{syllable 2}
	idle property LooseFullBodyStagger auto
	{full body stagger for player}

	EVENT onHit(ObjectReference akAggressor, Form akWeapon, Projectile projectileRef, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if ProjectileRef && (ProjectileRef == voiceClearSkiesProjectile01 || ProjectileRef == voiceClearSkiesProjectile03)
			objectReference myBlizzard = getLinkedRef()
			myBlizzard.playAnimation("stopEffect")
			utility.wait(2.13)
			myBlizzard.disable()
			disable()
			;myBlizzard.delete()
			;delete()
		endif		
	endEVENT
	
	EVENT onTriggerEnter(objectReference actronaut)
; 		debug.trace("handle knockback")
		if (actronaut as actor)
			(actronaut as actor).playIdle(LooseFullBodyStagger)
		endif
		KnockAreaEffect(1.0, 3000)
	endEVENT
	