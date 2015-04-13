Scriptname AtronachFrostScript extends ActiveMagicEffect  
;===============================================

;===============================================
;VisualEffect Property AtronachFrostEffect01 Auto
EffectShader Property AtronachFrostFXS Auto
EffectShader Property AtronachUnsummonDeathFXS Auto
Explosion Property deathExplosion Auto
Actor selfRef
int atronachHealth 

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster	
		AtronachFrostFXS.Play(selfRef)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		AtronachFrostFXS.Stop(selfRef)
	ENDEVENT
	
	EVENT onDying(actor myKiller)
		atronachHealth = selfRef.GetAV("Health") as int
		if atronachHealth > 0
; 			debug.trace("frost health  > 0")
			AtronachFrostFXS.Stop(selfRef)
			AtronachUnsummonDeathFXS.Play(selfRef)
		elseIf atronachHealth <= 0
; 			debug.trace("frost health  <= 0")
			selfRef.placeAtMe(deathExplosion)
			AtronachFrostFXS.Stop(selfRef)
		endIf
	ENDEVENT
