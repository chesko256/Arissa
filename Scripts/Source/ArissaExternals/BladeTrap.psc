scriptName BladeTrap extends MovingTrap
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


;-----------------------------------

Function fireTrap()
	;PlayAnimationAndWait( "reset", "off" )
	;Basic wind up and fire once checking
	;TRACE("fireTrap called")
	ResolveLeveledDamage()
	hitBase.goToState("CanHit")
	isFiring = True
	WindupSound.play( self as ObjectReference)		;play windup sound
	wait( initialDelay )		;wait for windup
	;TRACE("Initial Delay complete")
	
	if (fireOnlyOnce == True)	;If this can be fired only once then disarm
		trapDisarmed = True
	endif
	
	;TRACE("Looping =")
	;TRACE(Loop)
	
	;Trap Guts
	while(finishedPlaying == False && isLoaded == TRUE)
		;TRACE("playing anim Single")

		PlayAnimationAndWait("Single", "reset")
		finishedPlaying = True
		
		if (loop == TRUE)			;Reset Limiter
			resetLimiter()
		endif
		wait(0.0)
	endWhile
	
	if isLoaded 	
		isFiring = false
		hitBase.goToState("CannotHit")
		;PlayAnimationAndWait( "reset", "off" )
		goToState("Reset")
	endif
	
endFunction

Function ResetLimiter()
	finishedPlaying = False
EndFunction
