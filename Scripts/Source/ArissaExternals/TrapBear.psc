scriptName TrapBear extends objectReference
;
;
;==========================================

TrapHitBase hitBase
bool property StartOpen = True Auto
perk property LightFoot auto
bool property checkForLightFootPerk = true Auto
{default == true}
globalVariable property LightFootTriggerPercent auto

Event onReset()
	goToState("Closed")
	self.reset()
endEvent


event onLoad()
	hitBase = (self as objectReference) as TrapHitBase
	ResolveLeveledDamage()
	if StartOpen
		playAnimation("StartOpen")
		goToState("Open")
	endif
endEvent

auto state Closed
	Event OnBeginState()
; 		debug.Trace(self + " has entered state Closed")
	endEvent
	
	event OnTriggerEnter(objectReference TriggerRef)
; 		debug.Trace(self + " has been entered by " + TriggerRef)
; 		debug.Trace(self + " is in state Closed")
	endEvent
	
	event OnActivate(objectReference TriggerRef)
; 		debug.Trace(self + " has been activated by " + TriggerRef)
; 		debug.Trace(self + " is in state Closed")
		playAnimationAndWait("Reset01","Trans02")
		goToState("Open")
	endEvent
	
endState

state Open
	Event OnBeginState()
; 		debug.Trace(self + " has entered state Open")
	endEvent

	event OnTriggerEnter(objectReference TriggerRef)
		if checkPerks(TriggerRef)
; 			debug.Trace(self + " has been entered by " + TriggerRef)
; 			debug.Trace(self + " is in state Open")
			playAnimation("Trigger01")
			hitBase.goToState("CanHit")
			GoToState("Busy")
			WaitForAnimationEvent("Trans01")
			hitBase.goToState("CannotHit")
			GoToState("Closed")
		endif
	endEvent
	
	event OnActivate(objectReference TriggerRef)
; 		debug.Trace(self + " has been activated by " + TriggerRef)
; 		debug.Trace(self + " is in state Open")
		GoToState("Busy")
		hitBase.goToState("CannotHit")
		playAnimationAndWait("Trigger01","Trans01")
		goToState("Closed")
	endEvent
endState

State Busy	;Dummy state to prevent interaction while animating
	Event OnBeginState()
; 		debug.Trace(self + " has entered state Open")
	endEvent
EndState

event OnTriggerEnter(objectReference TriggerRef)
; 	debug.Trace(self + " has been entered by " + TriggerRef)
; 	debug.Trace(self + " default onEnter")
endEvent
	
event OnActivate(objectReference TriggerRef)
; 	debug.Trace(self + " has been activated by " + TriggerRef)
; 	debug.Trace(self + " default onTrigger")
endEvent

Bool function checkPerks(objectReference triggerRef)
	if checkForLightFootPerk
; 		;debug.Trace(self + " is checking if " + triggerRef + " has LightFoot Perk")
		if  (triggerRef as actor).hasPerk(LightFoot)
; 			;debug.Trace(self + " has found that " + triggerRef + " has LightFoot Perk")
			if utility.randomFloat(0.0,100.00) <= LightFootTriggerPercent.getValue()
; 				;debug.Trace(self + " is returning false due to failed lightfoot roll")
				return False
			else
; 				;debug.Trace(self + " is returning true due to successful lightfoot roll")
				return True
			endif
		Else
; 			debug.Trace(self + " has found that " + triggerRef + " doesn't have the LightFoot Perk")
			Return True
		EndIf
	else
		return True
	endif
endFunction

;==========================================================
int property LvlThreshold1 auto
int property LvlDamage1 auto
int property LvlThreshold2 auto
int property LvlDamage2 auto
int property LvlThreshold3 auto
int property LvlDamage3 auto
int property LvlThreshold4 auto
int property LvlDamage4 auto
int property LvlThreshold5 auto
int property LvlDamage5 auto
int property LvlDamage6 auto
int property TrapLevel = 2 auto

Function ResolveLeveledDamage()
	int damageLevel
	int damage
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	damage = LvlDamage1
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		damage = LvlDamage2
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		damage = LvlDamage3
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		damage = LvlDamage4
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		damage = LvlDamage5
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		damage = LvlDamage6
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	;Trace("damage =")
	;Trace(damage)
	
	;return damage
	hitBase.damage = damage
EndFunction