scriptName TrapPoisonGas extends objectReference
;
;
;===================================================================
;;Properties from MQShoutTrigger
;===================================================================

Spell property voicelv01 auto		; level 1 shout
Spell property voicelv02 auto		; and 2
Spell property voicelv03 auto		; and 3, the most powerful

float property timeToClear auto hidden							; this variable is set according to what power of shout hit the fog

float property ClearTimeWeak = 5.0 auto			
{tweak setting for how long fog stays cleared by weakest shout
	default = 5.0}

float property ClearTimeMed = 10.0 auto
{tweak setting for how long fog stays cleared by medium shout
	default = 10.0}

float property ClearTimeStrong = 15.0 auto
{tweak setting for how long fog stays cleared by strongest shout
	default = 15.0}

bool property allowEnableFlag = true auto
{when true, trigger will enable after clear time is up
 when false, trigger will stay disabled}

; return value for IsFogOn function
; hidden property for use in child scripts
bool property bIsFogOn = false auto hidden

explosion property PoisonGasExplosion auto hidden
bool property weaponResolved = false auto hidden
int Property TrapLevel = 1 auto
{Used to determine the difficulty of the trap, currently only tied to damage
	0 = Easy
	1 = Medium (DEFAULT)
	2 = Hard
	3 = VeryHard}

;===================================================================
;;Gas Properties
;===================================================================

keyword property gasKeyword auto
magicEffect property gasMagicEffect01 Auto
float property fDuration = 15.0 auto
bool property isInitiallyActive = True auto
{Set whether the poison gas is initially active
	default == TRUE}

bool property init = FALSE auto hidden
bool property TemporarilyCleared auto hidden
bool property loop = False auto hidden

;===================================================================
;;EVENT BLOCK
;===================================================================

event onCellLoad()
	if !init && isInitiallyActive
		goToState("On")	;onAnim
		bIsFogOn = true
		loop = true
		init = TRUE
	else
		init = TRUE
	endif
	
	if !weaponResolved
		ResolveLeveledExplosion ()
	endif
endEvent

;===================================================================
;;STATE BLOCK
;===================================================================

;/
STATE WaitingForTrigger
	event onBeginState()
		if !weaponResolved
			ResolveLeveledExplosion ()
		endif
	endEvent

	event onTrigger(objectReference triggerRef)
; 		Debug.Trace("Triggered: " + triggerRef + " " + !(triggerRef as actor).HasMagicEffectWithKeyword(gasKeyword))
		if triggerRef as actor
			if !(triggerRef as actor).HasMagicEffectWithKeyword(gasKeyword)
; 				debug.Trace(self + " has applied gas to " + triggerRef)
				;(triggerRef as actor).addSpell(gasSpell01)
				triggerRef.placeAtMe(PoisonGasExplosion)
			endif
		endif
	endEvent
	
	; event OnTriggerEnter (objectReference TriggerRef)
			; resolveTriggerLogic(triggerRef)
	; endEvent
	
	Event OnHit(ObjectReference Aggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if Aggressor == Game.GetPlayer()
			resolveTriggerLogic(None, (akSource as spell))
		endif
	endEvent
	
	event onActivate(objectReference activateRef)
		ResolveGasActivation(activateRef)
	endEvent
endState


STATE	HasBeenTriggered
	; Nothing happens - this is a holding state
	EVENT OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 		debug.Trace("Hit but inactive: "+self)
	endEVENT 
endSTATE

STATE Inactive
	event onActivate(objectReference activateRef)
		ResolveGasActivation(activateRef)
	endEvent
endSTATE
/;

;;;;;;;;;;;;;;;;;;;;New stuff;;;;;;;;;;;;;;;;;;;;;;;;;

State On
	event onBeginState()
		bIsFogOn = True
		playAnimation("playAnim02")	;onAnim
	endEvent
	
	;Currently has an actor inside
	event onTrigger(objectReference triggerRef)
		if triggerRef as actor && !(triggerRef as actor).isDead()
		
			;If the actor does not already have a poison effect on them
			if !(triggerRef as actor).HasMagicEffectWithKeyword(gasKeyword)
; 				debug.Trace(self + " has applied gas to " + triggerRef)
				;(triggerRef as actor).addSpell(gasSpell01)
				triggerRef.placeAtMe(PoisonGasExplosion)
			endif
		endif
	endEvent
	
	;Activated by a trap trigger object
	event onActivate(objectReference activateRef)
		ResolveGasActivation(activateRef)
	endEvent
	
	;This occurs when hit by a shout
	Event OnHit(ObjectReference Aggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if Aggressor == Game.GetPlayer() && (akSource as spell)
			resolveShoutLogic(akSource as spell)
		endif
	endEvent
endState

auto State Off
	event onBeginState()
		bIsFogOn = False
		playAnimation("playAnim01")	;offAnim
	endEvent
	
	event onActivate(objectReference activateRef)
		ResolveGasActivation(activateRef)
	endEvent
endState

State TempCleared
	event onBeginState()
		bIsFogOn = False
		playAnimation("playAnim01")	;offAnim
		utility.wait(timeToClear)
		if TemporarilyCleared
			TemporarilyCleared = False
			goToState("On")
		else
			goToState("Off")
		endif
		
	endEvent
	
	event onActivate(objectReference activateRef)
		ResolveGasActivation(activateRef)
	endEvent
endState
;===================================================================
;;FUNCTION BLOCK
;===================================================================

Function ResolveShoutLogic(Spell akSpell)
; 	debug.Trace(self + "MQShoutTrigger: fireTriggerEvent from " + akSpell)
	TemporarilyCleared = True
	; set the time that this fog portion will stay cleared based on strength of the shout
	if akSpell == voicelv01
		timeToClear = clearTimeWeak
	elseif akSpell == voicelv02
		timeToClear = clearTimeMed
	elseif akSpell == voicelv03
		timeToClear = clearTimeStrong
	endif
	goToState("TempCleared")
	;setFogState(false)
; 	;debug.Trace(self + "Waiting " + timeToClear)
	;utility.wait(timeToClear)
	; if allowEnableFlag
		;self.enable()
		; setFogState(true)
	; endif
	; goToState("WaitingForTrigger")
endFunction

; Function resolveTriggerLogic(ObjectReference TriggerRef = None, Spell SpellRef = None)

	;respond if struck by one of the shout projectiles
; 	; debug.Trace( self + "MQShoutTrigger: resolveTriggerLogic ObjectRef=" + TriggerRef + ",  SpellRef=" + spellRef)
	
	; if spellRef;&& (spellRef == voicelv01 || spellRef == voicelv02 || spellRef == voicelv03)
		; goToState("HasBeenTriggered")
		; fireTriggerEvent(spellRef)
	; endif

; endFunction

;Handle turning on or off
function ResolveGasActivation(objectReference activateRef)
	TrapTriggerBase TriggerRef					;TriggerRef will always be a TrapTriggerBase
	TriggerRef = activateRef as TrapTriggerBase		;Set TriggerRef to our activateRef

	if TriggerRef
		if TriggerRef.TriggerType == 0			;single
			loop = False
			if bIsFogOn
				;do nothing
				
			Else
				;turn on
				unregisterForUpdate()
				registerForSingleUpdate(fDuration)
				goToState("On")	;onAnim
			endif
		elseif TriggerRef.TriggerType == 1		;hold
		
			if loop
				loop = False
			else
				loop = True
			endif
			
			if bIsFogOn
				;turn off
				if TemporarilyCleared
					TemporarilyCleared = False
				else
					goToState("Off")	;offAnim
				endif
			Else
				;turn on
				goToState("On")	;onAnim
			endif
		elseif TriggerRef.TriggerType == 2		;toggle
			if bIsFogOn
				loop = False
				;turn off
				if TemporarilyCleared
					TemporarilyCleared = False
				else
					goToState("Off")	;offAnim
				endif
			Else
				loop = True
				;turn on
				goToState("On")	;onAnim
			endif
		elseif TriggerRef.TriggerType == 3		;turn on
			loop = True
			if bIsFogOn
				;do nothing
			else
				;turn on
				goToState("On")	;onAnim
			endif
		elseif TriggerRef.TriggerType == 4		;turn off
			loop = False
			if bIsFogOn
				;turn off
				if TemporarilyCleared
					TemporarilyCleared = False
				else
					goToState("Off")	;offAnim
				endif
			Else
				;do nothing
			endif
		endif
	Else
		
	endif
endFunction

event onUpdate()
	unregisterForUpdate()
	if getState() == "On"
		if !loop
			goToState("Off")
		endif
	elseif getState() == "TempCleared"
		TemporarilyCleared = False
	else
	endif
endEvent
; Function setFogState(bool bTurnOnFog)
	; bIsFogOn = bTurnOnFog
	; if bTurnOnFog
; 		; debug.Trace("Re-fogging: "+self)
		; self.enable()
	; else
; 		; debug.Trace("unfogging: "+self)
		; self.disable()
	; endif
; endFunction

;================================================================

int property LvlThreshold1 auto
int property LvlThreshold2 auto
int property LvlThreshold3 auto
int property LvlThreshold4 auto
int property LvlThreshold5 auto
Explosion property TrapPoisonGasExplosion01 auto
Explosion property TrapPoisonGasExplosion02 auto
Explosion property TrapPoisonGasExplosion03 auto
Explosion property TrapPoisonGasExplosion04 auto
Explosion property TrapPoisonGasExplosion05 auto
Explosion property TrapPoisonGasExplosion06 auto

Function ResolveLeveledExplosion ()
	;Trace("ResolveLeveledWeapon")
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	; weapon lvlWeaponM = LvlWeaponM1
	; weapon lvlWeaponL = LvlWeaponL1
	; weapon lvlWeaponR = LvlWeaponR1
	explosion LvlExplosion = TrapPoisonGasExplosion01
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		; lvlWeaponM = LvlWeaponM2
		; lvlWeaponL = LvlWeaponL2
		; lvlWeaponR = LvlWeaponR2
		LvlExplosion = TrapPoisonGasExplosion02
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		;lvlWeaponM = LvlWeapon3
		LvlExplosion = TrapPoisonGasExplosion03
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		;lvlWeaponM = LvlWeapon4
		LvlExplosion = TrapPoisonGasExplosion04
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		;lvlWeaponM = LvlWeapon5
		LvlExplosion = TrapPoisonGasExplosion05
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		;lvlWeaponM = LvlWeapon6
		LvlExplosion = TrapPoisonGasExplosion06
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	; ballistaWeaponM = lvlWeaponM
	; ballistaWeaponL = lvlWeaponL
	; ballistaWeaponR = lvlWeaponR
	PoisonGasExplosion = LvlExplosion
	weaponResolved = True
EndFunction

	