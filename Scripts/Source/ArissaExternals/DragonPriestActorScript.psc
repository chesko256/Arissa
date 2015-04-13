Scriptname DragonPriestActorScript extends ActiveMagicEffect  
{Abilities and FX for Dragon Priest}

import debug

armor property DragonPriestArmor01 auto
{Glowing cape and mouth streams armor}
VisualEffect Property DragonPriestParticlesFX Auto
{Floor based stream of upward particles}
VisualEffect Property DragonPriestEyeGlowFX Auto
{eye glow fx}
VisualEffect Property FXfallingSandDragonPriestEffect Auto
{falling sand from holes fx}
Explosion Property FXDragonPriestSmallExplosion Auto
{dust and fabric explosion played on state change}
Explosion Property FXDragonPriestLargeExplosion Auto
{large dust fabric and metal bits explosion played on dying}
Activator property AshPileObject auto
{The object we use as a pile.}
int doOnce = 0 ;Stops on hit from spamming
Actor selfRef ;local pointer to the curren dragon priest

EVENT OnEffectStart(Actor Target, Actor Caster)
	selfRef = caster  ;local pointer to the curren dragon priest
	if (selfRef.GetSleepState() == 3)
; 			Debug.Trace("DP is sleeping! 3")
	else
		;Play all of the magic fx
		selfRef.equipitem(DragonPriestArmor01)
		DragonPriestParticlesFX.play(selfRef, -1)
		DragonPriestEyeGlowFX.play(selfRef, -1)
	endIf
ENDEVENT

	Event OnGetUp(ObjectReference akFurniture)
; 		Debug.Trace("Dragon preist just got up from " )
		;Play all of the magic fx
		selfRef.equipitem(DragonPriestArmor01)
		DragonPriestParticlesFX.play(selfRef, -1)
		DragonPriestEyeGlowFX.play(selfRef, -1)
	endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;When hit incriments and plays the trasition to hirt state fx. Currently plays on the 5th hit. To be redone by design to work on health
		doOnce = doOnce + 1
		if  doOnce == 5
			selfRef.placeAtMe(FXDragonPriestSmallExplosion, 1)
			DragonPriestParticlesFX.Stop(selfRef)
			FXfallingSandDragonPriestEffect.play(selfRef, -1)
			selfRef.PlaySubGraphAnimation( "stage2" )
			doOnce = doOnce + 1
		endIf
ENDEVENT

EVENT OnDying(Actor akKiller)
	; play all of the many dying fx and clean up the magic fx
	selfRef.placeAtMe(FXDragonPriestLargeExplosion, 1)
	selfRef.PlaySubGraphAnimation( "stage3" )
	selfRef.unequipitem(DragonPriestArmor01)
	DragonPriestEyeGlowFX.Stop(selfRef)
	;place ash pile
	utility.wait(1.0)
	selfRef.AttachAshPile(AshPileObject)
	utility.wait(2.0)
	FXfallingSandDragonPriestEffect.Stop(selfRef)
	
ENDEVENT

