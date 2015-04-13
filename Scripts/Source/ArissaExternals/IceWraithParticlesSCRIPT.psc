Scriptname IceWraithParticlesSCRIPT extends ActiveMagicEffect  
{Particles to auto add to ice wraith}

;===============================================

import utility
import actor
import form
;===============================================
Actor selfRef
VisualEffect Property IceWraithParticles01 Auto
Armor Property SkinIceWraithSmokeFins  Auto   
VisualEffect Property FXIceWraith2ndFormEffect auto

String property GroundDiveIceHazard auto 
String property ChangeForms auto 
Spell Property WallOfFrostIceWraith Auto

Float Property scaleRangeMax = 1.1Auto 
Float Property scaleRangeMin = 0.9 Auto 
Explosion Property deathExplosion Auto
Activator property AshPileObject auto
{The object we use as a pile.}


	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster	
		selfRef.setScale(RandomFloat(scaleRangeMin, scaleRangeMax))
		IceWraithParticles01.Play(selfRef, -1)
		selfRef.EquipItem(SkinIceWraithSmokeFins)	
		FXIceWraith2ndFormEffect.play(selfRef, -1)
		registerForAnimationEvent(selfRef, GroundDiveIceHazard)
		registerForAnimationEvent(selfRef, ChangeForms)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		IceWraithParticles01.Stop(selfRef)
		selfRef.unEquipItem(SkinIceWraithSmokeFins)	
		FXIceWraith2ndFormEffect.Stop(selfRef)
	ENDEVENT
	
	EVENT onAnimationEvent(ObjectReference akSource, string asEventName)
		if (asEventName == GroundDiveIceHazard)
; 			debug.trace("event")
			WallOfFrostIceWraith.Cast(selfRef) 
		endif
		if (asEventName == ChangeForms)

			selfRef.PlaySubGraphAnimation("SkinFadeOut")
			wait(2.0)
			selfRef.PlaySubGraphAnimation("SkinFadeIn")
		endif
	endEVENT
	
	EVENT onDying(actor myKiller)
		IceWraithParticles01.Stop(selfRef)
		FXIceWraith2ndFormEffect.stop(selfRef)
		selfRef.unEquipItem(SkinIceWraithSmokeFins)	
		selfRef.placeAtMe(deathExplosion)
		
		selfRef.SetCriticalStage(selfRef.CritStage_DisintegrateStart)
		selfRef.AttachAshPile(AshPileObject)		
		selfRef.SetAlpha (0.0,True)
		wait(1.0)		
		selfRef.SetCriticalStage(selfRef.CritStage_DisintegrateEnd)
	ENDEVENT

