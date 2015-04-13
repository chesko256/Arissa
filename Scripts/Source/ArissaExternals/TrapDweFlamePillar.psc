scriptName TrapDweFlamePillar extends MovingTrap
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
float property rotationSpeed = 1.0 auto
Bool property CounterClockwise = FALSE auto
{if true this will turn counter-clockwise
	default == false}

bool property hasPlayedAttackAnimOnce = false auto hidden


event onLoad()
	float CV = (rotationSpeed * getAnimationVariableFloat("CV"))
	float CCV = (rotationSpeed * getAnimationVariableFloat("CCV"))
	SetAnimationVariableFloat("CV", CV)
	SetAnimationVariableFloat("CCV", CCV)
	;hitBase = (self as objectReference) as TrapDweFlamePillarHit

endEvent


;-----------------------------------

Function fireTrap()
	TrapDweFlamePillarHit myHitScript
	myHitScript = (self as objectReference) as TrapDweFlamePillarHit

	isFiring = True
	if myHitScript
		myHitScript.goToState("CanHitLocal")
	else
; 		debug.Trace(self + ": myHitScript = " + myHitScript)
	endif
	objectReference TrapSelf = self as objectReference
	
	if WindupSound
		WindupSound.play( self as ObjectReference)		;play windup sound
	endif
	;ResolveLeveledWeapon()
	hasPlayedAttackAnimOnce = False
	wait( initialDelay )		;wait for windup
	;TRACE("Initial Delay complete")
	
	if (fireOnlyOnce == True)	;If this can be fired only once then disarm
		trapDisarmed = True
	endif
	
	;TRACE("Looping =")
	;TRACE(Loop)
	
	;Trap Guts
	
	while(finishedPlaying == False && isLoaded == true)
		;TRACE("playing anim Single")
		isFiring = True
		if (hasPlayedAttackAnimOnce == FALSE)
			hasPlayedAttackAnimOnce = TRUE
			if CounterClockwise
				PlayAnimationAndWait("Trigger01","Trans01")
			else
				PlayAnimationAndWait("Trigger01","Trans01")
			endif
; 			debug.Trace(self + " has recieved event " + "Trans01")

		Else
			wait(0.5)
		endif
		
		finishedPlaying = True
		
		if (loop == TRUE)			;Reset Limiter
			resetLimiter()
		endif			
	endWhile
	
	;self.InterruptCast()
	myHitScript.goToState("CannotHit")
	
; 	debug.Trace(self + " has exited looping")
	if isLoaded
		isFiring = false
		PlayAnimationAndWait( "Reset01", "Trans02" )
		goToState("Reset")
	endif		
	
	
	
endFunction

Function ResetLimiter()
	finishedPlaying = False
EndFunction



