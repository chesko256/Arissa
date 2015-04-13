Scriptname WIChangeLocation03ChallengerScript extends ReferenceAlias 
{script on Challenger alias in WIChangeLocation03}

;*** TO DO - when we can test for the difference between spell projectiles and non-spell projectiles this script should make non-spell projtectiles trigger the "hit with non-spell"

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 	debug.trace("WIChangeLocation03ChallengerScript OnHit: akAggressor->" + akAggressor + ", akWeapon->" + akWeapon + ", akProjectile->" + akProjectile)

	weapon akWeapon = akSource as Weapon
	
	if akAggressor != Game.GetPlayer()
		(GetOwningQuest() as WIChangeLocation03Script).HitByNonPlayer = 1
	EndIf
	
	if akWeapon != none ;then we were hit by a non Spell
		(GetOwningQuest() as WIChangeLocation03Script).HitByNonSpell = 1
	EndIf

EndEvent
