Scriptname FXDwarvenSpiderSCRIPT extends ActiveMagicEffect  
{Add the fx art to the dwarven centurion, sphere,and spider. There are tests for properties being filler since not all three have three addons.}

import utility
import form

;===============================================

Actor selfRef
VisualEffect Property FXDwarvenSpiderEffect Auto
Explosion Property ExplosionDwarvenSpider Auto

	EVENT OnEffectStart(Actor Target, Actor Caster)
		selfRef = caster
		FXDwarvenSpiderEffect.Play(selfRef, -1)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		FXDwarvenSpiderEffect.Stop(selfRef)
	ENDEVENT
	
	EVENT onDying(actor myKiller)
		if selfRef.GetLevel() > 7
			selfRef.PlaySubGraphAnimation( "StopEffect" )
			FXDwarvenSpiderEffect.Stop(selfRef)
			selfRef.placeAtMe(ExplosionDwarvenSpider)
		EndIf
	ENDEVENT
	