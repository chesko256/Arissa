Scriptname DA03RuefulDeath extends Actor


Weapon Property RuefulWeapon Auto


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; debug.trace("BarbasKillScriptStarted")
	if akAggressor == game.getPlayer()
		if akSource == RuefulWeapon
			GetActorBase().SetEssential(false)
			GetActorBase().SetInvulnerable(false)
			Kill(game.getplayer())
; 			debug.trace("BarbasKillScriptRanCorrectly")
		endif
	endif
EndEvent