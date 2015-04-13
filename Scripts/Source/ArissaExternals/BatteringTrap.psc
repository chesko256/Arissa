scriptName BatteringTrap extends MovingTrap
;
;
;This is the script for the blade trap
;Activating the trap causes it to toggle on and off
;If activated while in the process of stopping, it should be able to handle that.
;================================================================

import debug
import utility
	
;If Loop is true, it swings until activated again.
;If Loop is false, it swings once when activated.
bool restartLooping = false
bool finishedPlaying = false
float property initialDelay = 0.25 auto
bool property resetEventRecieved = False auto hidden


;-----------------------------------

Function fireTrap()
	
	;Basic wind up and fire once checking
; 	;debug.TRACE("fireTrap called")
	WindupSound.play( self as ObjectReference)		;play windup sound
	ResolveLeveledDamage()
	wait( initialDelay )		;wait for windup
; 	;debug.TRACE("Initial Delay complete")
	registerForAnimationEvent(self, "reset")
	if (fireOnlyOnce == True)	;If this can be fired only once then disarm
		trapDisarmed = True
	endif
	
; 	;debug.TRACE("Looping =")
; 	;debug.TRACE(Loop)
	
	;Trap Guts
	while(finishedPlaying == False) && isloaded
		;TRACE("playing anim Trigger")
		hitBase.goToState("CanHit")
		PlayAnimationAndWait("Trigger", "BackSwing")
		hitBase.goToState("CannotHit")
		
		while !resetEventRecieved && isLoaded
; 			;debug.Trace(self + " is waiting for animationEvent")
			utility.wait(0.5)
		endWhile
		finishedPlaying = True
		resetEventRecieved = False
		if (loop == TRUE)			;Reset Limiter
			resetLimiter()
		endif	
; 		debug.Trace(self + " finished main while loop")
	endWhile
	
	unregisterForAnimationEvent(self, "reset")	
	goToState("Reset")
; 	;debug.TRACE("fireTrap has finished")
	PlayAnimationAndWait( "reset", "off" )
	
endFunction

Function ResetLimiter()
	finishedPlaying = False
	;TrapHitBase hitBase = (self as objectReference) as TrapHitBase
	;hitBase.goToState("CanHit")
EndFunction

Event onLoad()
	hitBase = (self as objectReference) as TrapHitBase
endEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	;debug.Trace(self + " has recieved animation event = " + asEventName)
	if akSource == (self as objectReference) && asEventName == "reset"
		resetEventRecieved = TRUE
	endif

endEvent

