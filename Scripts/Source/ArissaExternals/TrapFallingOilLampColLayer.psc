scriptName TrapFallingOilLampColLayer extends objectReference
;
;
;====================================================

message property DisarmMessage1 auto
sound property FallingSound auto
weapon property FallingOilWeapon auto
ammo property FallingOilAmmo auto

explosion property OilExplosion auto
; bool property weaponResolved = false auto hidden
; int Property TrapLevel = 1 auto
; {Used to determine the difficulty of the trap, currently only tied to damage
	; 0 = Easy
	; 1 = Medium (DEFAULT)
	; 2 = Hard
	; 3 = VeryHard}

auto state waiting
	event onActivate(objectReference triggerRef)
; 		debug.Trace(self + " has been activated by " + triggerRef)
		;goToState("Triggered")
		switchToFalling(triggerRef)
	endEvent

	event onHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 		debug.Trace(self + " has been hit by " + akAggressor)
		;if self.getAV("Health") > 10
			;goToState("Triggered")
			
			switchToFalling(akAggressor)
		;endif
	endEvent
	
	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		;if self.getAV("Health") > 10
			;goToState("Triggered")
			switchToFalling(akCaster)
		;endif
	endEvent
	
	
	event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
; 		debug.Trace(self + " has received destruction event #" + aiCurrentStage)
		if aiCurrentStage == 1
			switchToFalling(self)
			;goToState("triggered")
			;utility.wait(0.0)
			;fallingOilWeapon.Fire(self, FallingOilAmmo)
			;DisableLinkChain()
			;fallingOilWeapon.Fire(self, FallingOilAmmo)
			;self.Disable()
			;self.Delete()
		endif
		
		if aiCurrentStage == 2
			placeAtMe(OilExplosion)
		endif
	endEvent
	
EndState

function switchToFalling(objectReference causeActor)
; 		;debug.Trace(self + " has fired trap, should fall and explode")
		;if (causeActor as actor)
		goToState("Triggered")
		self.setActorCause(causeActor as actor)
		;endif
		FallingSound.play(self)
		self.DamageObject(10.0)	
		DisableLinkChain()
endFunction

state Triggered
	event onBeginState()
; 		debug.trace(self + " should now be falling")
		;if !weaponResolved
		;	ResolveLeveledExplosion()
		;endif
	endEvent

	event onHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;if (causeActor as actor)
			self.setActorCause(akAggressor as actor)
		;endif
		
		;if self.getAV("Health") > 10
			;goToState("Triggered")
			;fireTrap()
			;self.DamageObject(10.0)
		;endif
	endEvent
	
	event onTriggerEnter(objectReference triggerRef)
; 			debug.trace(self + " has been triggered while falling, should explode")
			;if self.getAV("Health") > 10
			;goToState("Triggered")
			;fireTrap()
			self.DamageObject(90.0)
		;endif
	endEvent

	event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)	
		if aiCurrentStage == 2
			placeAtMe(OilExplosion)
		endif
	endEvent
	
EndState

event onReset()
	self.reset()
	self.clearDestruction()
	goToState("waiting")
endEvent

;/
event onCellAttach()
	if !weaponResolved
		ResolveLeveledExplosion()
	endif
endEvent
	
;================================================================

int property LvlThreshold1 auto
int property LvlThreshold2 auto
int property LvlThreshold3 auto
int property LvlThreshold4 auto
int property LvlThreshold5 auto
Explosion property TrapOilLampExplosion01 auto
Explosion property TrapOilLampExplosion02 auto
Explosion property TrapOilLampExplosion03 auto
Explosion property TrapOilLampExplosion04 auto
Explosion property TrapOilLampExplosion05 auto
Explosion property TrapOilLampExplosion06 auto

Function ResolveLeveledExplosion ()
	;Trace("ResolveLeveledWeapon")
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	; weapon lvlWeaponM = LvlWeaponM1
	; weapon lvlWeaponL = LvlWeaponL1
	; weapon lvlWeaponR = LvlWeaponR1
	explosion LvlExplosion = TrapOilLampExplosion01
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		; lvlWeaponM = LvlWeaponM2
		; lvlWeaponL = LvlWeaponL2
		; lvlWeaponR = LvlWeaponR2
		LvlExplosion = TrapOilLampExplosion02
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		;lvlWeaponM = LvlWeapon3
		LvlExplosion = TrapOilLampExplosion03
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		;lvlWeaponM = LvlWeapon4
		LvlExplosion = TrapOilLampExplosion04
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		;lvlWeaponM = LvlWeapon5
		LvlExplosion = TrapOilLampExplosion05
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		;lvlWeaponM = LvlWeapon6
		LvlExplosion = TrapOilLampExplosion06
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	; ballistaWeaponM = lvlWeaponM
	; ballistaWeaponL = lvlWeaponL
	; ballistaWeaponR = lvlWeaponR
	OilExplosion = LvlExplosion
	weaponResolved = True
EndFunction
/;

