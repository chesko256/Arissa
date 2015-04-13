scriptname critterBird extends critter
{behavior script for basic fish}
;======================================================================================;
;	IMPORTS     /
;=============/
; include scripts for brevity
import utility
import form
import math
import debug
;======================================================================================;
;	PROPERTIES  /
;=============/
FormList property perchTypeList auto
{formlist of perches I look for}
float property fMinScale = 0.5 auto
{how small can this thing get? Default=0.5}
float property fMaxScale = 1.5 auto
{how big can it get? Default = 1.5}
float property fMinHop = 8.0 auto
{minimum distance to hop.  Default: 8}
float property fMaxHop = 32.0 auto
{max distance to hop.  Default:32}
float property leashLength = 256.0 auto
{how far from home can I roam?  Treat like a radius. Default = 256.0}
float property fSpeed = 150.0 auto
{Speed of base movement. Default= 150}
string property sState auto hidden
{current behavior state of the bird.  NOT a papyrus state}
; Valid State Values:
; 		inFlight
; 		onPerch	; perch basically anywhere I've landed but cannot hop along.
;		onGround
int property iEnergy = 50 auto hidden
{internal energy value 1-100.  Default at spawn: 50}
objectReference property goalPerch auto hidden
{Internally track reserved perch reference}

;======================================================================================;
;	VARIABLES   /
;=============/
objectReference player
; save player reference for later brevity.
int iDice
; integer we'll use and re-use for quick random decision rolls

;======================================================================================;
;	EVENTS	    /
;=============/
EVENT onStart()  	; critter event called when spawned
	trace("startup bird: " + self)
	; use keyframed motion
	setMotionType(Motion_Keyframed, false)
	
	; scale a little bit for visual variance
	setScale((randomFloat(fMinScale, fMaxScale)))
	
	;check for Spawner override of leash length
	if spawner.fLeashOverride != 0
		leashLength = spawner.fLeashOverride
	endif
	
	;save off the player reference for brevity
	player = game.getPlayer()
	
	; go to idle swim state and poll
	sState = "onGround"
	if sState == ""
		trace(self + " has sState of " + sState + ", something is wrong")
	endif
	gotoState("idling")
	registerForSingleUpdate(0.0)
endEVENT

STATE idling
	EVENT onUpdate()		
	; begin main loop of fish behavior
	if (player.getDistance(self) > fMaxPlayerDistance)
		trace(self + "too far from player - get rid of it")
		disableAndDelete()
	else
		if (spawner.isActiveTime())
			; spawner is active this time of day
			; first things first - call home if too far away.
			if getDistance(spawner) > leashLength
				trace(self + " is too far from spawner.  Fly Home")
				if sState == "inFlight"
					gotoState("Flying")
					flyAwayHome()
				else
					takeFlight()
				endif
			endif
			
			; if we were trying to reach a perch point, land at it now
			if goalPerch != NONE
				trace(self + " has a goal perch: " + goalPerch)
				if getDistance(goalPerch) < 32
					gotoState("Flying")
					landAtPerch(goalPerch)
				endif
			endif
			
			; if nothing higher priority, then proceed with regular behavior decision
			if sState == "inFlight"
				trace(self + " is in flight, choosing relevant behavior")
				; choose from in-flight behaviors
				iDice == randomInt(1,2)
				if iDice == 1
					; look for a perch object/node
					ObjectReference goal = findPerch()
					if goal != NONE
						flyToPerch(goal)
					endif
				elseif iDice == 2
					trace(self + " is in flight and wants to fly more")
					; fly some more
					flyTo(player)
				endif
			elseif sState == "perched"
			trace(self + " is perched, choosing relevant behavior")
				; choose from perch behaviors
				iDice = randomInt(1,3)
				if iDice == 1
					playIdle()
				elseif iDice == 2
					takeFlight()
				elseif iDice == 3
					groundHop()
				endif
			elseif sState == "onGround"
				trace(self + " is on the ground, choosing relevant behavior")
				; choose from ground behaviors
				iDice = randomInt(1,3)
				if iDice == 1
					playIdle()
				elseif iDice == 2
					takeFlight()
				elseif iDice == 3
					groundHop()
				endif
			endif
		endif
	endif
	endEVENT
endSTATE

STATE Flying
	EVENT onTranslationComplete()
		trace(self + " done with translation.  Idle now.")
		gotoState("idling")
		registerForSingleUpdate(0.0)
	endEVENT
endSTATE

;======================================================================================;
;	FUNCTIONS   /
;=============/
FUNCTION groundHop()	
	trace(self + " beginning groundHop()")
	; Set up variables to solve for right triangle ABC
	; c is the hypotenuse - think of it as the path along which the bird hops
	; the a and c values are going to be added to current XY to determine goal XY
	float aA = getAngleZ()		;        B
	float aB						;      /|
	float aC = 90				;   c/  |b			; we know angle C is 90 because it's a right triangleukhj/p-
	float a						; A/____|C
	float b						;    a	
	float c = randomFloat(fMinHop, fMaxHop)

	; use an int to track the quadrant into which we're hopping (global)
	; I:(+,+)   II:(-,+)   III:(-,-)   IV:(+,-)
	int quadrant
	if (aA > 0 && aA <= 90) || aA > 360			
		quadrant = 1
	elseif aA > 90 && aA <= 180
		quadrant = 4
	elseif aA > 180 && aA <= 270
		quadrant = 3
	elseif aA > 270 && aA <= 360
		quadrant = 2
	endif

	a = c*(cos(aB))
	b = c*(cos(aA))

	float newX
	float newY

	if quadrant == 1
		newX = (self.x + a)
		newY = (self.y + b)
	elseif quadrant == 2
		newX = (self.x - a)
		newY = (self.y + b)
	elseif quadrant == 3
		newX = (self.x - a)
		newY = (self.y - b)
	elseif quadrant == 4
		newX = (self.x + a)
		newY = (self.y - b)
	endif
	; now use a spline to "hop" there quicky.
	SplineTranslateTo(newX, newY, self.z, 0, 0, self.getAngleZ(), 300, fSpeed)
	trace(self + "performing a short hop to: " + newX + ", " + newY + ".")
	; test, but a little pause between each seems proper.
	wait(randomFloat(0.1, 2.0))
endFUNCTION

FUNCTION takeFlight()
	trace(self + " is taking flight")
	playAnimationAndWait("takeOff","end")
	sState = "inFlight"
	SplinetranslateTo(self.X, self.Y, self.Z + 64, 0, 0, self.getAngleZ(), 50, fSpeed/2)
endFUNCTION

FUNCTION FlyTo(objectReference goal)
	trace(self + " is flying to point: " + goal)
	; quick and dirty - just go right to the point.
	SplinetranslateTo(goal.X, goal.Y, goal.Z + 64, 0, 0, self.getAngleZ(), 200, fSpeed)
endFUNCTION

FUNCTION playIdle()
	; just have to be aware of the valid behaviors we can choose from. 
	; long-term may want to use an array/list and be able to choose dynamically
	iDice = randomInt(1,2)
	if iDice == 1
		playAnimationAndWait("StartGrndPeck","StartGrndLook")
	elseif iDice == 2
		playAnimationAndWait("startGrndFlap","StartGrndLook")
	endif
endFUNCTION

bool FUNCTION landAtPerch(objectReference goal)
	SplineTranslateTo(goal.x, goal.y, goal.z, 0, 0, randomFloat(0.0, 360.0), 300, fSpeed/2)
	playAnimationAndWait("startGrndFlap","StartGrndLook")
endFUNCTION

objectReference FUNCTION findPerch()
	int size = perchTypeList.getSize()
	int i = 0
	bool checking = true
	while i < size && checking == true
	form perchType = perchTypeList.getAt(i)
	i += 1
	objectReference goal = game.FindRandomReferenceOfTypeFromRef(perchType, spawner, leashLength)
	if goal != NONE
			checking = false
			trace(self + "found a perch: " + goal)
			critterPerch perchScript = goal as critterPerch
			if perchScript.reserved != true
				perchScript.reserved = true
				perchScript.incoming = self
				return goal
			else
				trace(self + " found a perch, but it was reserved!")
				return NONE
			endif
			trace(self + " couldn't find a perch")
			return NONE
		endif
	endWhile
endFUNCTION

bool FUNCTION flyToPerch(objectReference goal)
	; quick and dirty
	flyTo(goal)
endFUNCTION

FUNCTION flyAwayHome()
	flyTo(spawner)
endFUNCTION

EVENT onCellDetach()
	; Safety measure - when my cell is detached, for whatever reason, kill me.
; 	debug.trace("Killing self due to onCellDetach() - "+self)
	DisableAndDelete()
endEVENT
