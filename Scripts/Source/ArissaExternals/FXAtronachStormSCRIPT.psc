Scriptname FXAtronachStormSCRIPT extends activeMagicEffect
{This script runs from the Storm Atronach's ability and controlls the fx arts.}
;===============================================

import utility
import form

;===============================================
VisualEffect Property AtronachStormCloak Auto
EffectShader Property AtronachStormShockFXS Auto
EffectShader Property AtronachUnsummonDeathFXS Auto
Armor Property FXAtronachStormArmor Auto
int atronachHealth 
actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		selfRef.PlaySubGraphAnimation( "AutoOneOff" )
		AtronachStormCloak.Play(selfRef, -1)
		AtronachStormShockFXS.Play(selfRef)
		selfRef.EquipItem(FXAtronachStormArmor)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		AtronachStormCloak.Stop(selfRef)
		AtronachStormShockFXS.Stop(selfRef)
		selfRef.unEquipItem(FXAtronachStormArmor)
	endEvent
	
	EVENT onDying(actor myKiller)
		atronachHealth = selfRef.GetAV("Health") as int
		if atronachHealth > 0
; 				debug.trace("health  > 0")
				AtronachStormCloak.Stop(selfRef)
				AtronachStormShockFXS.Stop(selfRef)
				AtronachUnsummonDeathFXS.Play(selfRef)
				wait(1.5)
				;selfRef.disable()
		elseIf atronachHealth <= 0
; 			debug.trace("health  == 0")
			AtronachStormCloak.Stop(selfRef)
			selfRef.PlaySubGraphAnimation( "StopEffect" )
			wait(3)
			AtronachStormShockFXS.Stop(selfRef)
			selfRef.unEquipItem(FXAtronachStormArmor)
		endIf
	ENDEVENT
	
	