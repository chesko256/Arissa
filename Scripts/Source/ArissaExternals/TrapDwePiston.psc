scriptName TrapDwePiston extends MovingTrap
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
bool hasPlayedAttackAnimOnce = FALSE
float property initialDelay = 0.25 auto

string property fireAnim = "Up" auto
{firing animation, should not need to change}
string property fireEvent = "TransUp" auto
{firing animation event, should not need to change}
string property resetAnim = "Down" auto
{reset animation, should not need to change}
string property resetEvent = "TransDown" auto
{reset animation event, should not need to change}
string property startSwungAnim = "StartUp" auto
{anim event to start already swung}

bool property startSwung = false auto hidden
{set to true to start swung}


;-----------------------------------



EVENT OnCellAttach()
	isLoaded = TRUE
	
	if isFiring || startSwung
		if startSwung
			;isFiring == True
			loop = True
			goToState("On")
		endif
		fireTrap()
	endif
endEVENT

Function fireTrap()
	
	;Basic wind up and fire once checking
	;TRACE("fireTrap called")
	isFiring = True

	if !startSwung
		if WindupSound
			WindupSound.play( self as ObjectReference)		;play windup sound
		endif
		wait( initialDelay )		;wait for windup
	endif
	hasPlayedAttackAnimOnce = FALSE
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
		if !hasPlayedAttackAnimOnce
			if !startSwung
				PlayAnimationAndWait(fireAnim, fireEvent)
; 				;debug.Trace(self + "has finished anim once")
				hasPlayedAttackAnimOnce = TRUE
			else 
				startSwung = False
				playAnimation(startSwungAnim)
				hasPlayedAttackAnimOnce = TRUE
			endif
		Else
			wait(0.5)
		endif
		finishedPlaying = True
		
		if loop			;Reset Limiter
; 			;debug.Trace(self + "is looping because loop = " + loop)
			resetLimiter()
		endif			
	endWhile
	
	if isLoaded
		isFiring = false
		PlayAnimationAndWait(resetAnim, resetEvent)
		goToState("Reset")
	endif
	;trace(self + "Reset trap: playanimation(" + resetAnim + ")")
	;trace(self + "Reset trap: waiting for event(" + resetEvent + ")")
	
	
endFunction


;/
Function fireTrap()
	

	isFiring = True
	if hitbase
		hitBase.goToState("CanHit")
	endif
	if windupSound
		WindupSound.play( self as ObjectReference)		;play windup sound
	endif
	ResolveLeveledDamage()
	wait( initialDelay )		;wait for windup
	hasPlayedAttackAnimOnce = FALSE
	;TRACE("Initial Delay complete")
	
	if (fireOnlyOnce == True)	;If this can be fired only once then disarm
		trapDisarmed = True
	endif
	
	;TRACE("Looping =")
	;TRACE(Loop)
	
	;Trap Guts
	while(finishedPlaying == False && isLoaded == true)
		;trace(self + "Firing trap: playanimation(" + fireAnim + ")")
		;trace(self + "Firing trap: waiting for event(" + fireEvent + ")")
		if (hasPlayedAttackAnimOnce == FALSE)
			PlayAnimationAndWait(fireAnim, fireEvent)
; 			;debug.Trace(self + "has finished anim once")
			hasPlayedAttackAnimOnce = TRUE
		Else
			wait(0.5)
		endif
		finishedPlaying = True
		
		if (loop == TRUE)			;Reset Limiter
; 			;debug.Trace(self + "is looping because loop = " + loop)
			resetLimiter()
		endif			
	endWhile
	
	if isLoaded
		isFiring = false
		hitBase.goToState("CannotHit")
		PlayAnimationAndWait(resetAnim, resetEvent)
		goToState("Reset")
	endif
	;trace(self + "Reset trap: playanimation(" + resetAnim + ")")
	;trace(self + "Reset trap: waiting for event(" + resetEvent + ")")
	
	
endFunction
/;


Function ResetLimiter()
	finishedPlaying = False
	;TrapHitBase hitBase = (self as objectReference) as TrapHitBase
	;hitBase.goToState("CanHit")
EndFunction

Event onReset()
	self.reset()
	goToState("Idle")
endEvent


