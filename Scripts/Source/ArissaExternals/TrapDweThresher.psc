scriptName TrapDweThresher extends MovingTrap
;
;
;This is the script for the blade trap
;Activating the trap causes it to toggle on and off
;If activated while in the process of stopping, it should be able to handle that.
;================================================================


bool property startSpinning = false auto hidden
string property startSpinningAnim = "End" auto
{anim event to start already swung}

import debug
import utility
	
;If Loop is true, it swings until activated again.
;If Loop is false, it swings once when activated.
bool restartLooping = false
bool finishedPlaying = false
float property initialDelay = 0.25 auto
int property MovementType = 0 auto
{This sets if the blade moves while spinning
0 = Static
1 = Short
2 = Long
3 = Start Up}
bool property loadedOnce = false auto hidden



;-----------------------------------

Function fireTrap()
	
	;Basic wind up and fire once checking
	;TRACE("fireTrap called")
	isFiring = True
	ResolveLeveledDamage()
	hitBase.goToState("CanHit")
	WindupSound.play( self as ObjectReference)		;play windup sound
	wait( initialDelay )		;wait for windup
	;TRACE("Initial Delay complete")
	
	if (fireOnlyOnce == True)	;If this can be fired only once then disarm
		trapDisarmed = True
	endif
	
	;TRACE("Looping =")
	;TRACE(Loop)
	
	;Trap Guts
	If MovementType != 3
		PlayAnimationAndWait("TriggerUp01","BeginAnim")
	endif
	while(finishedPlaying == False && isLoaded == true)
		;TRACE("playing anim Single")
		if MovementType == 0
			PlayAnimation("LoopStatic")
; 			debug.Trace(self + " has recieved event " + "EndLoop")
		ElseIf MovementType == 1
			PlayAnimation("Loop")
; 			debug.Trace(self + " has recieved event " + "EndLoop")
		ElseIf MovementType == 2
			PlayAnimation("LoopLong")
; 			debug.Trace(self + " has recieved event " + "EndLoop")
		ElseIf MovementType == 3
			PlayAnimation("TriggerUpLoop")
		endif
		
		waitForAnimationEvent("EndLoop")
		finishedPlaying = True
		
		if (loop == TRUE)			;Reset Limiter
			resetLimiter()
		endif			
	endWhile
	
	hitBase.goToState("CannotHit")
	
	if isLoaded
		isFiring = false
		if movementType < 3 && movementType >=0
			PlayAnimationAndWait( "TriggerDown01", "reset" )
		elseif movementType == 3
			PlayAnimationAndWait( "TriggerEndUp", "TransStartUp" )
		Else
; 			debug.Trace(self + " has invalid movementType value = " + movementType)
		endif
		goToState("Reset")
	endif	
	;TRACE("fireTrap has finished")
	
	
endFunction

Function ResetLimiter()
	finishedPlaying = False
EndFunction

event onCellLoad()
	if !loadedOnce
		if movementType == 3
			playAnimation("StartUp")
		endif
	EndIf
endevent

