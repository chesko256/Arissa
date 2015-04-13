scriptName TrapDweBallista extends TrapBase
;
;Dart Trap extending TrapBase
;integrated with the TrapTriggerBase
;
;================================================================

import debug	
import utility
import custom

int property shotCount = 3 auto
{This property track the ammo that the ballista has, and starts with}
;int numShots = 20			;might want to make this a property
float fireRate = 0.1
float property initialDelay = 0.0 auto
weapon property ballistaWeaponM auto
weapon property ballistaWeaponL auto
weapon property ballistaWeaponR auto
bool property fireAllShots = True auto
{if this is true all three shots will be fired at once}

bool property isFiring auto hidden
bool property isLoaded auto hidden
bool property shotFired = false auto hidden
bool property weaponResolved = false auto hidden

Function initialize()
	
endFunction


Function ResetLimiter()
	shotFired = false		;shotCount is scoped outside of the OnActivate blocks. This will reset scopecount to 0, extending the firing time.
EndFunction


Function fireTrap()
	if !TrapDisarmed
		isFiring = True
		objectReference TrapSelf = self as objectReference
		if !weaponResolved
			ResolveLeveledWeapon()
		endif
		while !weaponResolved		;Do not fire till weapon is resolved
		endWhile
		;TRACE("fireTrap called")
		WindupSound.play( self as ObjectReference)		;play windup sound
		wait( initialDelay )		;wait for windup
		; if (fireOnlyOnce == True)	;If this can be fired only once then disarm
			; trapDisarmed = True
		; endif
		
		while(shotcount > 0) && !shotfired && isLoaded
			if fireAllShots
				playAnimation("TriggerAll") 			;fire all
				ballistaWeaponM.fire( TrapSelf, ballistaAmmo )		;fire 01
				ballistaWeaponL.fire( TrapSelf, ballistaAmmo )		;fire 02
				ballistaWeaponR.fire( TrapSelf, ballistaAmmo )		;fire 03
				
				shotcount -= 3
				WaitForAnimationEvent("FTransAll")
				;playAnimationAndWait("ResetAll","RTransAll") 				;reset anim all
			else
				if shotCount == 3
					playAnimation("Trigger01")		;fire anim 01
					ballistaWeaponM.fire( TrapSelf, ballistaAmmo )	;fire 01
					shotcount -= 1
					WaitForAnimationEvent("FTrans01")
					playAnimationAndWait("Reset01","RTrans01")			;reset anim 01
				elseIf ShotCount == 2
					playAnimation("Trigger02")		;fire anim 02
					ballistaWeaponL.fire( TrapSelf, ballistaAmmo )	;fire 02
					shotcount -= 1
					WaitForAnimationEvent("FTrans02")
					playAnimationAndWait("Reset02","RTrans02")			;reset anim 02
				elseIf ShotCount == 1
					playAnimation("Trigger03")		;fire anim 03
					ballistaWeaponR.fire( TrapSelf, ballistaAmmo )	;fire 03
					shotcount -= 1
					WaitForAnimationEvent("FTrans03")
					;playAnimationAndWait("Reset03","RTrans03") 			;reset anim 03
				endIf
			endIf
			shotFired = True	
			if (loop == TRUE)			;Reset Limiter
				resetLimiter()
			endif			
		endWhile
		
		if isLoaded 	
			isFiring = false
			;playAnimation("idle")
			goToState("Reset")
		endif
		
	endif
	
endFunction

State Reset

	Event OnBeginState()
		;TRACE("State Reset")
		if shotcount > 0
			;shotCount = 3
			GoToState ( "Idle" )
		Else
			TrapDisarmed = True
			GoToState ("Disabled")
		endif
		
	endEvent
	
	Event OnActivate( objectReference activateRef )
	;TRACE("Reset trigger")
	EndEvent
	
endState

;-----------------------------------------------

int property LvlThreshold1 auto
int property LvlThreshold2 auto
int property LvlThreshold3 auto
int property LvlThreshold4 auto
int property LvlThreshold5 auto
ammo property ballistaAmmo auto
ammo property TrapDweBallistaBoltAmmo01 auto
ammo property TrapDweBallistaBoltAmmo02 auto
ammo property TrapDweBallistaBoltAmmo03 auto
ammo property TrapDweBallistaBoltAmmo04 auto
ammo property TrapDweBallistaBoltAmmo05 auto
ammo property TrapDweBallistaBoltAmmo06 auto

Function ResolveLeveledWeapon ()
	;Trace("ResolveLeveledWeapon")
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	; weapon lvlWeaponM = LvlWeaponM1
	; weapon lvlWeaponL = LvlWeaponL1
	; weapon lvlWeaponR = LvlWeaponR1
	Ammo LvlAmmo = TrapDweBallistaBoltAmmo01
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		; lvlWeaponM = LvlWeaponM2
		; lvlWeaponL = LvlWeaponL2
		; lvlWeaponR = LvlWeaponR2
		LvlAmmo = TrapDweBallistaBoltAmmo02
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		;lvlWeaponM = LvlWeapon3
		LvlAmmo = TrapDweBallistaBoltAmmo03
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		;lvlWeaponM = LvlWeapon4
		LvlAmmo = TrapDweBallistaBoltAmmo04
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		;lvlWeaponM = LvlWeapon5
		LvlAmmo = TrapDweBallistaBoltAmmo05
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		;lvlWeaponM = LvlWeapon6
		LvlAmmo = TrapDweBallistaBoltAmmo06
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	; ballistaWeaponM = lvlWeaponM
	; ballistaWeaponL = lvlWeaponL
	; ballistaWeaponR = lvlWeaponR
	BallistaAmmo = LvlAmmo
	weaponResolved = True
EndFunction

event onLoad()
	isLoaded = TRUE
	if isFiring == True
		fireTrap()
	endif
	if shotCount == 3
		playAnimationAndWait("Reset03","RTrans03")			;reset anim 01
	elseIf ShotCount == 2
		playAnimationAndWait("Reset01","RTrans01")			;reset anim 02
	elseIf ShotCount == 1
		playAnimationAndWait("Reset02","RTrans02")			;reset anim 02
	endIf
EndEvent

event onUnload()
; 	debug.Trace(self + " has recieved onUnload event")
	isLoaded = FALSE
endEvent

