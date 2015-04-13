scriptName SpearTrap extends MovingTrap
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
float property initialDelay = 0.05 auto

string property fireAnim = "Trigger01" auto
{firing animation, should not need to change}
string property fireEvent = "TrapStart" auto
{firing animation event, should not need to change}
string property resetAnim = "Open" auto
{reset animation, should not need to change}
string property resetEvent = "Opening" auto
{reset animation event, should not need to change}
string property startResetAnim = "Opened" auto
{reset animation event, should not need to change}



;-----------------------------------



Function fireTrap()
	isFiring = True
	;Basic wind up and fire once checking
	;TRACE("fireTrap called")
	ResolveLeveledDamage()
	hitBase.goToState("CanHit")
	if WindupSound
		WindupSound.play( self as ObjectReference)		;play windup sound
	endif
	wait( initialDelay )		;wait for windup
	;TRACE("Initial Delay complete")
	
	if (fireOnlyOnce == True)	;If this can be fired only once then disarm
		trapDisarmed = True
	endif
	
	;TRACE("Looping =")
	;TRACE(Loop)
	
	;Trap Guts
	finishedPlaying = False
	while !finishedPlaying && isLoaded
		;trace(self + "Firing trap: playanimation(" + fireAnim + ")")
		;trace(self + "Firing trap: waiting for event(" + fireEvent + ")")
		PlayAnimationAndWait(fireAnim, fireEvent)
		finishedPlaying = True
		
		if loop			;Reset Limiter
			resetLimiter()
		endif
		wait(0.0)
	endWhile
	
	if isLoaded	
		isFiring = False
		hitBase.goToState("CannotHit")
		goToState("Reset")
	endif
	;trace(self + "Reset trap: playanimation(" + resetAnim + ")")
	;trace(self + "Reset trap: waiting for event(" + resetEvent + ")")
	;PlayAnimationAndWait(resetAnim, resetEvent)
	
endFunction

Function ResetLimiter()
	finishedPlaying = False
	;TrapHitBase hitBase = (self as objectReference) as TrapHitBase
	;hitBase.goToState("CanHit")
EndFunction

Event onReset()
	self.reset()
	goToState("Idle")
endEvent

event onCellAttach()
	isLoaded = TRUE
	if isFiring == True
		fireTrap()
	endif
EndEvent

event onCellDetach()
; 	debug.Trace(self + " has recieved onUnload event")
	isLoaded = FALSE
endEvent



