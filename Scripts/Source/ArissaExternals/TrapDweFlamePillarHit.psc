scriptName TrapDweFlamePillarHit extends trapHitBase
;
;
;
;=========================================

import utility

keyword property flameKeyword auto

explosion property placedExplosion auto hidden
bool property weaponResolved = false auto hidden
int Property TrapLevel = 1 auto
{Used to determine the difficulty of the trap, currently only tied to damage
	0 = Easy
	1 = Medium (DEFAULT)
	2 = Hard
	3 = VeryHard}
	
;================================================================
	
state CanHitLocal	
	event onBeginState()
; 		debug.Trace(self + ": has entered CanHitState")
		if !weaponResolved
			ResolveLeveledExplosion ()
		endif
	endEvent
	
	
	event OnTrapHitStart(ObjectReference triggerRef, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
; 		debug.Trace(self + " has hit " + triggerRef)
		actor myTarget
		myTarget = triggerRef as actor
		
		if !myTarget.hasSpell(ghostAbility)
			;if !myTarget.HasMagicEffectWithKeyword(flameKeyword)
; 				debug.Trace(self + " has applied gas to " + triggerRef)
				;(triggerRef as actor).addSpell(gasSpell01)
				triggerRef.placeAtMe(placedExplosion)
			;endif
			if rumble
				game.ShakeController(rumbleAmount, rumbleAmount, rumbleDuration)
			EndIf
			if cameraShake
				game.ShakeCamera(afStrength = cameraShakeAmount)
			endif	
		endif
	endEvent
	
	;/
	event OnTrapHit(ObjectReference triggerRef, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
; 		debug.Trace(self + " has hit " + triggerRef)
		actor myTarget
		myTarget = triggerRef as actor
		
		if !myTarget.hasSpell(ghostAbility)
			;if !myTarget.HasMagicEffectWithKeyword(flameKeyword)
; 				debug.Trace(self + " has applied gas to " + triggerRef)
				;(triggerRef as actor).addSpell(gasSpell01)
				triggerRef.placeAtMe(placedExplosion)
			;endif
			if rumble
				game.ShakeController(rumbleAmount, rumbleAmount, rumbleDuration)
			EndIf
			if cameraShake
				game.ShakeCamera(afStrength = cameraShakeAmount)
			endif	
		endif
	endEvent
	/;
endState

event onCellAttach()
	if !weaponResolved
		ResolveLeveledExplosion ()
	endif
endEvent


;================================================================

int property LvlThreshold1 auto
int property LvlThreshold2 auto
int property LvlThreshold3 auto
int property LvlThreshold4 auto
int property LvlThreshold5 auto
Explosion property TrapDweFlamePillarExplosion01 auto
Explosion property TrapDweFlamePillarExplosion02 auto
Explosion property TrapDweFlamePillarExplosion03 auto
Explosion property TrapDweFlamePillarExplosion04 auto
Explosion property TrapDweFlamePillarExplosion05 auto
Explosion property TrapDweFlamePillarExplosion06 auto

Function ResolveLeveledExplosion ()
	;Trace("ResolveLeveledWeapon")
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	; weapon lvlWeaponM = LvlWeaponM1
	; weapon lvlWeaponL = LvlWeaponL1
	; weapon lvlWeaponR = LvlWeaponR1
	explosion LvlExplosion = TrapDweFlamePillarExplosion01
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		; lvlWeaponM = LvlWeaponM2
		; lvlWeaponL = LvlWeaponL2
		; lvlWeaponR = LvlWeaponR2
		LvlExplosion = TrapDweFlamePillarExplosion02
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		;lvlWeaponM = LvlWeapon3
		LvlExplosion = TrapDweFlamePillarExplosion03
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		;lvlWeaponM = LvlWeapon4
		LvlExplosion = TrapDweFlamePillarExplosion04
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		;lvlWeaponM = LvlWeapon5
		LvlExplosion = TrapDweFlamePillarExplosion05
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		;lvlWeaponM = LvlWeapon6
		LvlExplosion = TrapDweFlamePillarExplosion06
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	; ballistaWeaponM = lvlWeaponM
	; ballistaWeaponL = lvlWeaponL
	; ballistaWeaponR = lvlWeaponR
	placedExplosion = LvlExplosion
	weaponResolved = True
EndFunction
