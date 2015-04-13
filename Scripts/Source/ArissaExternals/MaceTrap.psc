scriptName MaceTrap extends PhysicsTrap
;
;
;This is the script for the swinging mace trap
;It's like a regular moving trap, but activating it causes a push force to be applied to the trap.
;This breaks the havok constraint, causing it to swing.
;================================================================

import utility
import debug

int doOnce
float property initialDelay = 0.2 auto
float property hitTime = 3.0 auto
{this controls how long the trap has to hit before it sets itself to not do damage
	default = 3.0
	if set to a negative value, this is ignored}

Function fireTrap()	
	if doOnce == 0
		doOnce = 1
		hitBase.goToState("CanHit")
		SetMotionType(1)
		WindupSound.play( self as ObjectReference)		;play windup sound
		ResolveLeveledDamage()
		wait( initialDelay )		;wait for windup
		ApplyHavokImpulse(0.0, 0.0, -1.0, 15.0)
		ApplyHavokImpulse(0.0, 0.0, -1.0, 50.0)
		if hitTime > 0
			wait(hitTime)
			hitBase.goToState("CannotHit")
		endif
	endif
endFunction

Event OnCellAttach()
	if doOnce == 0
		SetMotionType(4)
		hitBase = (self as objectReference) as TrapHitBase
	endif
EndEvent

Event OnCellDetach()
	if doOnce == 0
		SetMotionType(1)
	endif
EndEvent

