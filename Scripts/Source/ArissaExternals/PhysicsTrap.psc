scriptName PhysicsTrap extends TrapBase
;
;
;This is the base class for a physics trap. 
;When a moving trap collides with an actor, it should damage that actor.
;This sets up the mechanics, but behavior will have to be set up on the inherited object.
;================================================================

import debug
import utility

;================================================================

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

;PhysicsTrapHit property hitBase auto hidden

Function ResolveLeveledDamage ()
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
	PhysicsTrapHit hitbase
	hitbase = (self as objectReference) as PhysicsTrapHit
	hitBase.damage = damage
EndFunction

;----------------------------------


float initialDelay = 0.2

Function fireTrap()	
; 	debug.Trace(self + ": is running FireTrap")
	goToState("Done")
	;hitBase.goToState("CanHit")
	ResolveLeveledDamage()
	SetMotionType(1)
	if WindupSound
		WindupSound.play( self as ObjectReference)		;play windup sound
	endif

	wait( initialDelay )		;wait for windup
	ApplyHavokImpulse(0.0, 0.0, -1.0, 15.0)
endFunction

state Done
	Event OnCellAttach()
	endEvent
endState

Event OnCellAttach()
; 	debug.Trace(self + ": is running onCellAttach")
	SetMotionType(4)
	ResolveLeveledDamage()
	;hitbase = (self as objectReference) as PhysicsTrapHit
EndEvent

; Event OnUnLoad()
	; if doOnce == 0
		; SetMotionType(1)
	; endif
; EndEvent

Event onReset()
	self.reset()
	goToState("Idle")
	SetMotionType(4)
endEvent	

Event onCellLoad()
; 	debug.Trace(self + ": has called onCellLoad")

endEvent



