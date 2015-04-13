scriptName DA13SpellBreakerEnchScript extends activeMagicEffect

actor player
actor caster
objectReference casterREF
objectReference playerREF

Event OnEffectStart(Actor akTarget, Actor akCaster)
	player = game.getPlayer()
	playerREF = (player as ObjectReference)
	caster = akCaster
	casterRef = (caster as ObjectReference)
endEVENT

EVENT onHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 	debug.trace("onHit information for: "+self)
; 	debug.trace("akAggressor: " +akAggressor)
; 	debug.trace("akSource: " +akSource)
; 	debug.trace("akProjectile: " +akProjectile)
; 	debug.trace("abPowerAttack: " +abPowerAttack)
; 	debug.trace("abSneakAttack: " +abSneakAttack)
; 	debug.trace("abHitBlocked: " +abHitBlocked)
	
	if (akSource as spell) != NONE
		(akSource as Spell).cast(caster, akAggressor)
	endif
endEVENT
