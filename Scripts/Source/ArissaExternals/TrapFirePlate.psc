scriptName TrapFirePlate extends TrapTriggerBase
;
;
;
;================================================================

int Count				;if Finite = 1, Determines how many times this trigger can be used
int CountUsed		;Used to compare times triggered to max triggers allowed
int Type

;weapon property pressEffect auto
ammo property pressEffectAmmo auto
hazard property fireHazard auto hidden
objectReference property myHazardRef auto hidden
bool property weaponResolved = false auto hidden
int Property TrapLevel = 1 auto
{Used to determine the difficulty of the trap, currently only tied to damage
	0 = Easy
	1 = Medium (DEFAULT)
	2 = Hard
	3 = VeryHard}

;event onLoad()
	;objectReference selfRef = self
	;fireHazard = game.getForm(0X0005A1A3)
;endEvent

State Active
	Event onBeginState()
		goToState( "DoNothing" )
		if !weaponResolved
			ResolveLeveledHazard ()
		endif
		;pressEffect.fire(selfRef, pressEffectAmmo)
		; EFFECT IS HERE ^^^^^ UNCOMMENT ONCE PROJECTILES OR PARTICLES CAN LEAVE A TRIGGER BOX CORRECTLY
		activate(self as objectReference)
		;playAnimationAndWait( "trigger", "reset" )
		TriggerSound.play(self)
		playAnimation("Down")
		myHazardRef = PlaceAtMe(fireHazard, 1)
		if objectsInTrigger == 0
			goToState( "Inactive" )
			playAnimation("Up")
			removeMyHazard()
		endif
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
		if acceptableTrigger(triggerRef)
; 			;debug.TRACE(self + " has been entered by " + triggerRef)
			objectsInTrigger = self.GetTriggerObjectCount()
		endif
	endEvent
	
	event OnTrigger( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
		;if acceptableTrigger(triggerRef)
; 			;debug.TRACE(self + " has been exited by " + triggerRef)
			objectsInTrigger = self.GetTriggerObjectCount()
			if objectsInTrigger == 0
				goToState ("Inactive")
				playAnimation("Up")
				removeMyHazard()
			endif
		;endif
	endEvent
endState

State DoNothing			;Dummy state, don't do anything if animating
	event OnTriggerEnter( objectReference triggerRef )
		if acceptableTrigger(triggerRef)
; 			;debug.TRACE(self + " has been entered by " + triggerRef)
			objectsInTrigger = self.GetTriggerObjectCount()
		endif
	endEvent
	
	event OnTrigger( objectReference triggerRef )	
		if (triggerRef == game.getPlayer()) && !checkPerks(triggerRef)
			objectsInTrigger = self.GetTriggerObjectCount()
			if objectsInTrigger == 1
				goToState ("Inactive")
				playAnimation("Up")
				removeMyHazard()
			endif
		endif
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
		;if acceptableTrigger(triggerRef)
; 			;debug.TRACE(self + " has been exited by " + triggerRef)
			objectsInTrigger = self.GetTriggerObjectCount()
			if objectsInTrigger == 0
				goToState ("Inactive")
				playAnimation("Up")
				removeMyHazard()
			endif
		;endif
	endEvent
EndState

;Single point of change for removal of hazard
function removeMyHazard()
	objectReference refToRemove = myHazardRef
	utility.wait(1.0)
	if refToRemove
		refToRemove.Disable()
		refToRemove.Delete()
	endif
endFunction

auto State Inactive

	event onBeginState()
		objectsInTrigger = self.GetTriggerObjectCount()
		if (Type == 1 && objectsInTrigger == 0)								;type 1 = hold, so deprecate here if necessary
			if (FiniteUse == TRUE && CountUsed < Count);if finite use and count > count used
				CountUsed += 1						;increase count for hold type triggers
			endif
			
			
		endif
		if objectsInTrigger == 0
			removeMyHazard()
		endif
	endEvent
	
	event OnTriggerEnter (objectReference triggerRef)
		if acceptableTrigger(triggerRef)
; 			;debug.TRACE(self + " has been entered by " + triggerRef)
			lastTriggerRef = triggerRef
			objectsInTrigger = self.GetTriggerObjectCount()
			if (FiniteUse == TRUE	&& CountUsed < Count)	;if finite use and count > count used
				;TRACE("Finite Use")
				if (Type != 1)							;type 1 = hold so only increase on leave
					CountUsed += 1						;increase count used
					;TRACE("Increasing Count on enter")
				endif
				goToState( "Active" )
			endif
			
			if (FiniteUse == FALSE)
				;TRACE("Infinite Use")
				goToState( "Active" )
			endif		
		endif
	endevent

	event OnTriggerLeave (objectReference triggerRef)
		;if acceptableTrigger(triggerRef)
; 			;debug.TRACE(self + " has been exited by " + triggerRef)
			lastTriggerRef = triggerRef
			objectsInTrigger = self.GetTriggerObjectCount()
			if (Type == 1 && objectsInTrigger == 0)								;type 1 = hold, so deprecate here if necessary
				if (FiniteUse == TRUE && CountUsed < Count);if finite use and count > count used
					CountUsed += 1						;increase count for hold type triggers
				endif
				
				activate(self as objectReference)
				
			endif
		;endif
	endevent
	
endstate

event onCellAttach()
	objectsInTrigger = self.GetTriggerObjectCount()
	if !weaponResolved
		ResolveLeveledHazard ()
	endif
	if myHazardRef
		removeMyHazard()
	endif
	
	if objectsInTrigger == 0
		goToState ("Inactive")
		playAnimation("Up")
	else
		goToState ("Active")
	endif
endEvent

;================================================================

int property LvlThreshold1 auto
int property LvlThreshold2 auto
int property LvlThreshold3 auto
int property LvlThreshold4 auto
int property LvlThreshold5 auto
hazard property TrapFirePlateFXHaz01 auto
hazard property TrapFirePlateFXHaz02 auto
hazard property TrapFirePlateFXHaz03 auto
hazard property TrapFirePlateFXHaz04 auto
hazard property TrapFirePlateFXHaz05 auto
hazard property TrapFirePlateFXHaz06 auto

Function ResolveLeveledHazard ()
	;Trace("ResolveLeveledWeapon")
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	; weapon lvlWeaponM = LvlWeaponM1
	; weapon lvlWeaponL = LvlWeaponL1
	; weapon lvlWeaponR = LvlWeaponR1
	hazard LvlHazard = TrapFirePlateFXHaz01
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		; lvlWeaponM = LvlWeaponM2
		; lvlWeaponL = LvlWeaponL2
		; lvlWeaponR = LvlWeaponR2
		LvlHazard = TrapFirePlateFXHaz02
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		;lvlWeaponM = LvlWeapon3
		LvlHazard = TrapFirePlateFXHaz03
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		;lvlWeaponM = LvlWeapon4
		LvlHazard = TrapFirePlateFXHaz04
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		;lvlWeaponM = LvlWeapon5
		LvlHazard = TrapFirePlateFXHaz05
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		;lvlWeaponM = LvlWeapon6
		LvlHazard = TrapFirePlateFXHaz06
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	; ballistaWeaponM = lvlWeaponM
	; ballistaWeaponL = lvlWeaponL
	; ballistaWeaponR = lvlWeaponR
	fireHazard = LvlHazard
	weaponResolved = True
EndFunction
