scriptName TrapSwingingWall extends MovingTrap
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

string property fireAnim = "90For" auto hidden
{firing animation, should not need to change}
string property fireEvent = "Done" auto hidden
{firing animation event, should not need to change}
string property resetAnim = "90Back" auto hidden
{reset animation, should not need to change}
string property resetEvent = "TransStop" auto hidden
{reset animation event, should not need to change}
string property startSwungAnim = "90End" auto hidden
{anim event to start already swung}
string property rearmAnim = "Rearm" Auto hidden

string property rearmEvent = "TransStart" Auto hidden

string property HalfAnim = "90Half" auto hidden
string property HalfAnimEvent = "TransHalf" Auto hidden

string property NinetyFireAnim = "90For" auto hidden
string property NinetyResetAnim = "90Back" auto hidden
string property NinetyStartSwungAnim = "90End" auto hidden
string property NinetyHalfAnim = "90Half" auto hidden

string property OneEightyFireAnim = "180For" auto hidden
string property OneEightyResetAnim = "180Back" auto hidden
string property OneEightyStartSwungAnim = "180End" auto hidden
string property OneEightyHalfAnim = "180Half" auto hidden

string property TwoSeventyFireAnim = "270For" auto hidden
string property TwoSeventyResetAnim = "270Back" auto hidden
string property TwoSeventyStartSwungAnim = "270End" auto hidden
string property TwoSeventyHalfAnim = "270Half" auto hidden


bool property startSwung = false auto
{set to true to start swung}
bool property animsSetUp = false auto hidden

int property actorsInTrigger = 0 auto hidden
int property rotation = 0 Auto
{This property sets how far to rotate
		0 == 90 degrees
		1 == 180 degrees
		2 == 270 degrees
Anything else will fail and trap will default to 90 degrees}


;-----------------------------------

;This block tracks entering objects to prevent the player
;or other live actor from being trapped behind the wall
Event onTriggerEnter(objectReference TriggerRef)
; 	debug.Trace(self + " has been entered by " + TriggerRef)
	if TriggerRef as Actor ;&& !(TriggerRef as actor).isDead()
		actorsInTrigger += 1
	endif	
; 	debug.Trace(self + ":actorsInTrigger = " + actorsInTrigger)
endEvent

Event onTriggerLeave(objectReference TriggerRef)
; 	debug.Trace(self + " has been entered by " + TriggerRef)
	if TriggerRef as Actor ;&& !(TriggerRef as actor).isDead()
		actorsInTrigger -= 1
		if actorsInTrigger < 0
			actorsInTrigger = 0
		endif
	endif		
; 	debug.Trace(self + ":actorsInTrigger = " + actorsInTrigger)
endEvent

;Load block used for handing state when going from cell to cell
EVENT OnCellAttach()
	isLoaded = TRUE
	if !AnimsSetUp	
		SetUpAnims()
	endif
	while !AnimsSetUp
	endWhile
	hitBase = (self as objectReference) as TrapHitBase
	
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
	if !AnimsSetUp	
		SetUpAnims()
	endif
	while !AnimsSetUp
	endWhile
	ResolveLeveledDamage()
	if !startSwung
		hitBase.goToState("CanHit")
		WindupSound.play( self as ObjectReference)		;play windup sound
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
				hitBase.goToState("CannotHit")
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
; 		;debug.Trace(self + " is playing " + resetAnim + " & waiting for " + resetEvent)
		PlayAnimationAndWait(resetAnim, resetEvent)
; 		;debug.Trace(self + " has recieved anim event " + resetEvent)
		while actorsInTrigger > 0
; 			;debug.Trace(self + ":actorsInTrigger = " + actorsInTrigger)
			utility.wait(1.0)
		EndWhile
		PlayAnimationAndWait(rearmAnim, rearmEvent)
		goToState("Reset")
	endif
	;trace(self + "Reset trap: playanimation(" + resetAnim + ")")
	;trace(self + "Reset trap: waiting for event(" + resetEvent + ")")
	
	
endFunction

Function ResetLimiter()
	finishedPlaying = False
	;TrapHitBase hitBase = (self as objectReference) as TrapHitBase
	;hitBase.goToState("CanHit")
EndFunction

Function SetUpAnims()
	if rotation == 0
		;set anims to 90 degree variants
		fireAnim = NinetyFireAnim
		resetAnim = NinetyResetAnim
		startSwungAnim = NinetyStartSwungAnim
		halfAnim = NinetyHalfAnim
	ElseIf rotation == 1
		;set anims to 180 degree variants
		fireAnim = OneEightyFireAnim
		resetAnim = OneEightyResetAnim
		startSwungAnim = OneEightyStartSwungAnim
		halfAnim = OneEightyHalfAnim
	ElseIf rotation == 2
		;set anims to 270 degree variants
		fireAnim = TwoSeventyFireAnim
		resetAnim = TwoSeventyResetAnim
		startSwungAnim = TwoSeventyStartSwungAnim
		halfAnim = TwoSeventyHalfAnim
	Else
; 		debug.Trace(self + " has been set to an incorrect rotation value of " + rotation)
	endif
	animsSetUp = True
endFunction

Event onReset()
	self.reset()
	goToState("Idle")
endEvent





