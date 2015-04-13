Scriptname FxDraugrMagicScript extends ActiveMagicEffect  
{Add magic draugr fx}



import utility
import form

;===============================================

ObjectReference selfRef
ActorBase myActorBase
int draugrSex
VisualEffect Property DraugrMaleEyeGlowFX Auto
VisualEffect Property DraugrFemaleEyeGlowFX Auto
VisualEffect Property FXMagicDraugrDarkeningEffect Auto
; VisualEffect Property  FXDraugrMagicSwordStreakEffect Auto
; VisualEffect Property  FXDraugrMagicAxeStreakEffect Auto
; VisualEffect Property  FXDraugrMagicBowStreakEffect Auto
weapon property Sword1H auto
weapon property Axe2H auto
weapon property Bow auto


	EVENT OnEffectStart(Actor Target, Actor Caster)
		selfRef = caster
		myActorBase = caster.GetLeveledActorBase()		
		;add darkened area fx to all magic draugr
		FXMagicDraugrDarkeningEffect.Play(selfRef, -1)		
		;If sex is male (only one currently working) play glow eye art
		if myActorBase.GetSex() == 0
			;Play glow art
			DraugrMaleEyeGlowFX.Play(selfRef, -1)
		endif
		;if sex is female (currently not returned) play debug text to say this is now working
		if myActorBase.GetSex() == 1
			DraugrFemaleEyeGlowFX.Play(selfRef, -1)
		endif		
		; apply appropriate streak FX if I have a weapon
		; if selfRef.getItemCount(Sword1H) >= 1
			; caster.equipItem(Sword1H, TRUE, TRUE)
			;FXDraugrMagicSwordStreakEffect.Play(selfRef, -1)
		; elseif selfRef.getItemCount(Axe2H) >= 1
			; caster.equipItem(Axe2H, TRUE, TRUE)
			;FXDraugrMagicAxeStreakEffect.Play(selfRef, -1)
		; elseif selfRef.getItemCount(Bow) >= 1
			; caster.equipItem(Bow, TRUE, TRUE)
			; FXDraugrMagicBowStreakEffect.Play(selfRef, -1)
		; endif	
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		FXMagicDraugrDarkeningEffect.Stop(selfRef)		
		if myActorBase.GetSex() == 0
			;Play glow art
			DraugrMaleEyeGlowFX.Stop(selfRef)
		endif
		if myActorBase.GetSex() == 1
			DraugrFemaleEyeGlowFX.Stop(selfRef)
		endif	
		; if selfRef.getItemCount(Sword1H) >= 1
			; caster.equipItem(Sword1H, TRUE, TRUE)
			; FXDraugrMagicSwordStreakEffect.Stop(selfRef)
		; elseif selfRef.getItemCount(Axe2H) >= 1
			; caster.equipItem(Axe2H, TRUE, TRUE)
			; FXDraugrMagicAxeStreakEffect.Stop(selfRef)
		; elseif selfRef.getItemCount(Bow) >= 1
			; caster.equipItem(Bow, TRUE, TRUE)
			; FXDraugrMagicBowStreakEffect.Stop(selfRef)
		; endif	
	endEvent
	
	EVENT onDying(actor myKiller)

		;DraugrMaleEyeGlowFX.Stop(selfRef)
		;DraugrFemaleEyeGlowFX.Stop(selfRef)
		FXMagicDraugrDarkeningEffect.Stop(selfRef)
		; FXDraugrMagicSwordStreakEffect.Stop(selfRef)

	ENDEVENT
	