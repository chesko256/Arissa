Scriptname FXDwarvenSphereScript extends ActiveMagicEffect  
{Attached dwarven sphere fx}

import utility
import form

;===============================================
actor selfRef
VisualEffect Property FXDwarvenSphereEffect Auto

	EVENT OnEffectStart(Actor Target, Actor Caster)
		selfRef = caster
		FXDwarvenSphereEffect.Play(selfRef, -1)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		FXDwarvenSphereEffect.Stop(selfRef)
	ENDEVENT
	
	EVENT onDeath(actor myKiller)
		selfRef.PlaySubGraphAnimation( "StopEffect" )
		wait(4.0)
		FXDwarvenSphereEffect.Stop(selfRef)
	ENDEVENT
	
	