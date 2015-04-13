scriptName DartTrap extends TrapBase
;
;Dart Trap extending TrapBase
;integrated with the TrapTriggerBase
;
;================================================================

import debug	
import utility
import custom

int numPorts
objectReference currentLink
int portIndex = 1
int shotCount
;int numShots = 20			;might want to make this a property
float fireRate = 0.1
float property initialDelay = 0.2 auto
weapon dartWeapon
float property firingDelay = 0.03 auto
float currentTime

int property NumShots =1 auto

bool property isFiring auto hidden
bool property isLoaded auto hidden

Function initialize()
	currentLink = self as objectReference
	numPorts = countLinks(currentLink)			;counts how many in a chain of linked refs. Don't loop linked refs.
	;trace( "numPorts" )
	;trace( numPorts as string )
	
endFunction

function ResetLimiter()
	shotcount = 0	;shotCount is scoped outside of the OnActivateBlocks. This will reset scopecount to 0, extending the firing time.
endFunction

Function fireTrap()
	isFiring = True
	ResolveLeveledWeapon()
	;TRACE("fireTrap called")
	WindupSound.play( self as ObjectReference)		;play windup sound
	wait( initialDelay )		;wait for windup
	;TRACE("Initial Delay complete")
	trapDisarmed = fireOnlyOnce	;If this can be fired only once then disarm
	
	;TRACE("Looping =")
	;TRACE(Loop)
		
	shotcount = 0
	currentTime = getCurrentRealTime()
	while(shotcount <= numShots ) && isLoaded == TRUE
		wait(0.01)
		if ((currentTime + firingDelay) < getCurrentRealTime())
			
			int firePort = RandomInt( 0, numPorts )	;set fireport
			
			if fireport > 0
				currentLink = GetNthLinkedRef (firePort)
			Else
				currentLink = self as objectReference
			endif
			dartWeapon.fire( currentLink, dartAmmo )		;fire
			shotcount = shotCount + 1		;increment number of shotswait( fireRate )	;- timeDelay)		;wait for the fire rate time delay, minus processing time
				
			
				
			if (loop == TRUE)			;Reset Limiter
				ResetLimiter()
			endif
			currentTime = getCurrentRealTime()
		endif
	endWhile
		
	if isLoaded 	
		isFiring = false
		;playAnimation("idle")
		goToState("Reset")
	endif
	
endFunction

State Reset

	Event OnBeginState()
		;TRACE("State Reset")
		GoToState ( "Idle" )
		;TrapHitBase hitBase = (self as objectReference) as TrapHitBase
		;hitBase.goToState("CanHit")
	endEvent
	
	Event OnActivate( objectReference activateRef )
	;TRACE("Reset trigger")
	EndEvent
	
endState

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

;-----------------------------------------------

int property LvlThreshold1 auto
weapon property LvlWeapon1 auto
int property LvlThreshold2 auto
weapon property LvlWeapon2 auto
int property LvlThreshold3 auto
weapon property LvlWeapon3 auto
int property LvlThreshold4 auto
weapon property LvlWeapon4 auto
int property LvlThreshold5 auto
weapon property LvlWeapon5 auto
weapon property LvlWeapon6 auto
ammo property dartAmmo auto

Function ResolveLeveledWeapon ()
	;Trace("ResolveLeveledWeapon")
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	weapon lvlWeapon = LvlWeapon1
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		lvlWeapon = LvlWeapon2
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		lvlWeapon = LvlWeapon3
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		lvlWeapon = LvlWeapon4
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		lvlWeapon = LvlWeapon5
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		lvlWeapon = LvlWeapon6
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	dartWeapon = lvlWeapon
EndFunction

;Event OnTrapHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
;	if (hitOnce == FALSE)
;		hitOnce = TRUE
;	endif
;endEvent

