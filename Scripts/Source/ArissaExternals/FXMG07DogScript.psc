Scriptname FXMG07DogScript extends ActiveMagicEffect  
{Adds fx to the dog in mg07}

import utility
import form

;===============================================

ObjectReference selfRef

VisualEffect Property FXMG07DogEyeGlowEffect Auto
VisualEffect Property FXMG07DogDarkeningEffect Auto


	EVENT OnEffectStart(Actor Target, Actor Caster)
		selfRef = caster
		FXMG07DogEyeGlowEffect.Play(selfRef, -1)	
		FXMG07DogDarkeningEffect.Play(selfRef, -1)	
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)	
		FXMG07DogEyeGlowEffect.Stop(selfRef)	
		FXMG07DogDarkeningEffect.Stop(selfRef)	
	ENDEVENT
	
	EVENT onDying(actor myKiller)
		FXMG07DogEyeGlowEffect.Stop(selfRef)
		FXMG07DogDarkeningEffect.Stop(selfRef)		
	ENDEVENT
	