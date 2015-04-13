scriptName TrapNorPlatform extends MovingTrap
;
;
;==========================================


;===================================================================
;;GENERAL PROPERTIES BLOCK
;===================================================================

float property FireSpeed = 1.0 Auto
{Time (in seconds) to move from the starting position to the ending position}

float property ReturnSpeed = 5.0 Auto
{Time (in seconds) to return from the ending position to the starting position}

float property ReturnDelay = 2.5 Auto
{Time (in seconds) to delay before resetting}

string midAnim = "Mid"

string up01Anim = "128Up"
string up02Anim = "256Up"
string up03Anim = "384Up"
string up04Anim = "512Up"
string up05Anim = "640Up"
string up06Anim = "768Up"

string down01Anim = "128Dn"
string down02Anim = "256Dn"
string down03Anim = "384Dn"
string down04Anim = "512Dn"
string down05Anim = "640Dn"
string down06Anim = "768Dn"


;;;;;;;;;;;;;;

bool restartLooping = false
bool finishedPlaying = false
bool hasPlayedAttackAnimOnce = FALSE
float property initialDelay = 0.25 auto

string property fireAnim  auto hidden
{firing animation, should not need to change}
string property fireSpeedString  auto hidden
{firing speed string, name set in script}
string property fireEvent = "Done" auto hidden
{firing animation event, should not need to change}
string property resetAnim auto hidden
{reset animation, should not need to change}
string property resetSpeedString  auto hidden
{reset speed string, name set in script}
string property resetEvent = "Done" auto hidden
{reset animation event, should not need to change}
string property startSwungAnim auto hidden
{anim event to start already swung}

bool property startSwung = false auto
{set to true to start swung}

hazardBase property myHazardBase auto hidden

;;;OLD SCRIPT
int property StartingHeight = 0 auto
{The starting height of the platform, -6 to 6
		heights are in increments of 128
		defaults == 0}
;/	{The starting height of the platform, -6 to 6, defaults to 0}
	int Function Get()
		return StartingHeight
	endFunction
	
	Function Set (int value)
		if (value >= 6 && value <= 6)
			StartingHeight = Value
		else
			StartingHeight = 0
		endif
	endFunction
endProperty/;

int property EndingHeight = 3 auto
	{The ending height of the platform, -6 to 6
		heights are in increments of 128
		defaults == 3}
;/	int Function Get()
		return EndingHeight
	endFunction
	
	Function Set (int value)
		if (value >= 6 && value <= 6)
			EndingHeight = Value
		else
			EndingHeight = 3
		endif
	endFunction
endProperty/;

;===================================================================
;;EVENT BLOCK
;===================================================================


EVENT OnLoad()
	;/if (startSwung == true )
		;trace(self + "OnLoad: playanimation(" + startSwungAnim + ")")
		playAnimation(startSwungAnim)		;activator starts opened
	endif/;
	
; 	debug.Trace(self + " has called onLoad")
	SetResetAnim()
	SetFireAnim()
	myHazardBase = (self as objectReference) as hazardBase
	isLoaded = TRUE
	if isFiring == True || startSwung == True
		startSwung = False
		if startSwung
			loop == True
		endif
		fireTrap()
	endif
endEVENT


;===================================================================
;;FIRE TRAP BLOCK
;===================================================================

Function fireTrap()
	
	;Basic wind up and fire once checking
; 	debug.TRACE(self + " has called fireTrap")
; 	debug.TRACE(self + ": lastActivateRef = " + lastActivateRef)
	isFiring = True
	myHazardBase.goToState("CanHit")
	WindupSound.play( self as ObjectReference)		;play windup sound
	ResolveLeveledDamage()
	SetResetAnim()
	SetFireAnim()
	utility.wait( initialDelay )		;wait for windup
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
			fireSpeedString = FireAnim
			fireSpeedString + "s"
			SetAnimationVariableFloat(fireSpeedString, FireSpeed)
			PlayAnimationAndWait(fireAnim, fireEvent)
; 			;debug.Trace(self + "has finished anim once")
			hasPlayedAttackAnimOnce = TRUE
			
		Else
			utility.wait(0.5)
		endif
		finishedPlaying = True
		
		if (loop == TRUE)			;Reset Limiter
; 			;debug.Trace(self + "is looping because loop = " + loop)
			resetLimiter()
		endif			
	endWhile
	myHazardBase.goToState("CannotHit")
	resetSpeedString = resetAnim
	resetSpeedString + "s"
	SetAnimationVariableFloat(resetSpeedString, ReturnSpeed)
	utility.wait(ReturnDelay)	
	
	if isLoaded
		isFiring = false
		PlayAnimationAndWait(resetAnim, resetEvent)
		goToState("Reset")
	endif
	;trace(self + "Reset trap: playanimation(" + resetAnim + ")")
	;trace(self + "Reset trap: waiting for event(" + resetEvent + ")")
	
	
endFunction

State Reset

	Event OnBeginState()
		GoToState ( "Idle" )
		myHazardBase = (self as objectReference) as hazardBase
		if myHazardBase
			myHazardBase.goToState("CannotHit")
		endif
	endEvent
	
	Event OnActivate( objectReference activateRef )
		lastActivateRef = activateRef
	EndEvent
	
endState

;===================================================================
;;FUNCTION BLOCK
;===================================================================

Function ResetLimiter()
	finishedPlaying = False
	;hazardBase myHazardBase = (self as objectReference) as hazardBase
	;myHazardBase.goToState("CanHit")
EndFunction


Function SetResetAnim()
	if startingHeight == -6
		ResetAnim = down06Anim
	ElseIf startingHeight == -5
		ResetAnim = down05Anim
	ElseIf startingHeight == -4
		ResetAnim = down04Anim
	ElseIf startingHeight == -3
		ResetAnim = down03Anim
	ElseIf startingHeight == -2
		ResetAnim = down02Anim
	ElseIf startingHeight == -1
		ResetAnim = down01Anim
	ElseIf startingHeight == 0
		ResetAnim = midAnim
	ElseIf startingHeight == 1
		ResetAnim = up01Anim
	ElseIf startingHeight == 2
		ResetAnim = up02Anim
	ElseIf startingHeight == 3
		ResetAnim = up03Anim
	ElseIf startingHeight == 4
		ResetAnim = up04Anim
	ElseIf startingHeight == 5
		ResetAnim = up05Anim
	ElseIf startingHeight == 6
		ResetAnim = up06Anim
	Endif
EndFunction

Function SetFireAnim()
	if EndingHeight == -6
		FireAnim = down06Anim
	ElseIf EndingHeight == -5
		FireAnim = down05Anim
	ElseIf EndingHeight == -4
		FireAnim = down04Anim
	ElseIf EndingHeight == -3
		FireAnim = down03Anim
	ElseIf EndingHeight == -2
		FireAnim = down02Anim
	ElseIf EndingHeight == -1
		FireAnim = down01Anim
	ElseIf EndingHeight == 0
		FireAnim = midAnim
	ElseIf EndingHeight == 1
		FireAnim = up01Anim
	ElseIf EndingHeight == 2
		FireAnim = up02Anim
	ElseIf EndingHeight == 3
		FireAnim = up03Anim
	ElseIf EndingHeight == 4
		FireAnim = up04Anim
	ElseIf EndingHeight == 5
		FireAnim = up05Anim
	ElseIf EndingHeight == 6
		FireAnim = up06Anim
	Endif
	
	startSwungAnim = FireAnim
EndFunction


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
	myHazardBase = (self as objectReference) as hazardBase
	if myHazardBase
		myHazardBase.damage = damage
	endif
EndFunction





