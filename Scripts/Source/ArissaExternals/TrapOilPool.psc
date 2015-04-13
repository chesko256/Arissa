scriptName TrapOilPool extends TrapExplosiveGas
;
;
;==============================================

; form fireHazard
;objectReference myHazardRef

float property burnDuration = 30.0 auto
{duration that the pool burns for}
string oilAnim = "stopeffect"
string oilDisappearEvent ="end"
objectReference myLinkedRef
bool lightIsOn = False
bool property lightStaysOn = False auto
{if set to 'TRUE' the enabled linked ref will not get disabled when the oil pool is destroyed}
;used to track if we have turned on our linkedRef light yet

bool property deleteSelfAfterIgnition = True auto
{whether or not the oil pool is used up after burning
	default == true}

;bool hazardAssigned = False
explosion property OilExplosion auto ;hidden
bool property weaponResolved = false auto hidden
int Property TrapLevel = 1 auto
{Used to determine the difficulty of the trap, currently only tied to damage
	0 = Easy
	1 = Medium (DEFAULT)
	2 = Hard
	3 = VeryHard}

; event onLoad()
	; fireHazard = game.getForm(0X0005A1A3)
	; hazardAssigned = True
; endEvent

;/
event onCellAttach()
	if !weaponResolved
		ResolveLeveledExplosion()
	endif
endEvent
/;

Function gasExplode(objectReference causeActor)
	;if (causeActor as actor)
		self.setActorCause(causeActor as actor)
	;endif
	goToState("DoNothing")
	;if hazardAssigned == False
	;	AssignHazard()
	;endif
	;myHazardRef = PlaceAtMe(fireHazard, 1)
	(self as objectReference).damageObject(5.0)
	myLinkedRef = getLinkedRef()
	if myLinkedRef && !lightIsOn
		lightIsOn = True
		myLinkedRef.enable()
	endif
	
	
	
endFunction

state doNothing

	event onHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	endEvent

	event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	endEvent
	
	event onTriggerEnter(objectReference triggerRef)
	endEvent
	
endState

; function AssignHazard()
	; fireHazard = game.getForm(0X0005A1A3)
	; hazardAssigned = True
; endFunction

event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	myLinkedRef = getLinkedRef()
	;if !weaponResolved
	;	ResolveLeveledExplosion()
	;endif
	
	if aiCurrentStage == 2
		placeAtMe(OilExplosion)
	endif
	if aiCurrentStage < 3 && !lightIsOn && myLinkedRef
		lightIsOn = True
		myLinkedRef.enable()
	endif
; 	debug.Trace(self + " has received destruction event #" + aiCurrentStage)
	if aiCurrentStage == 3
		if deleteSelfAfterIgnition
			playanimationandwait(oilAnim, oilDisappearEvent)
		endif
		
		if !lightStaysOn && myLinkedRef
			myLinkedRef.disable()
		endif
		
		if deleteSelfAfterIgnition
			self.Disable()
		else
			self.reset()
			self.clearDestruction()
			goToState("Waiting")
		endif
	endif
endEvent

;/

;================================================================

int property LvlThreshold1 auto
int property LvlThreshold2 auto
int property LvlThreshold3 auto
int property LvlThreshold4 auto
int property LvlThreshold5 auto
Explosion property TrapOilExplosion01 auto
Explosion property TrapOilExplosion02 auto
Explosion property TrapOilExplosion03 auto
Explosion property TrapOilExplosion04 auto
Explosion property TrapOilExplosion05 auto
Explosion property TrapOilExplosion06 auto

Function ResolveLeveledExplosion ()
	;Trace("ResolveLeveledWeapon")
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	; weapon lvlWeaponM = LvlWeaponM1
	; weapon lvlWeaponL = LvlWeaponL1
	; weapon lvlWeaponR = LvlWeaponR1
	explosion LvlExplosion = TrapOilExplosion01
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		; lvlWeaponM = LvlWeaponM2
		; lvlWeaponL = LvlWeaponL2
		; lvlWeaponR = LvlWeaponR2
		LvlExplosion = TrapOilExplosion02
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		;lvlWeaponM = LvlWeapon3
		LvlExplosion = TrapOilExplosion03
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		;lvlWeaponM = LvlWeapon4
		LvlExplosion = TrapOilExplosion04
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		;lvlWeaponM = LvlWeapon5
		LvlExplosion = TrapOilExplosion05
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		;lvlWeaponM = LvlWeapon6
		LvlExplosion = TrapOilExplosion06
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
