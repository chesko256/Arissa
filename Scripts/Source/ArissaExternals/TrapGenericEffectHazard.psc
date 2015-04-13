scriptName TrapGenericEffectHazard extends TrapBase
;This script is for steam, fire, geysers etc.
;
;================================================================

int Count				;if Finite = 1, Determines how many times this trigger can be used
int CountUsed		;Used to compare times triggered to max triggers allowed
int Type

weapon property pressEffect auto
ammo property pressEffectAmmo auto
hazard property myHazard auto
objectReference myHazardRef
bool property HazardIsPlaced auto hidden
bool property finishedPlaying auto hidden
bool property isFiring auto hidden
bool property isLoaded auto hidden
float property initialDelay = 0.0 auto
float property minimumFiringTime = 3.0 auto
float firingTime

event onLoad()
	objectReference selfRef = self
	isLoaded = TRUE
	if isFiring == True
		fireTrap()
	endif
EndEvent

event onUnload()
	isLoaded = FALSE
endEvent

Function fireTrap()

	;TRACE("fireTrap called")
	isFiring = True
	finishedPlaying = False
	firingTime = (utility.getCurrentRealTime() + minimumFiringTime)
	if WindupSound
		WindupSound.play( self as ObjectReference)		;play windup sound
	endif
	utility.wait( initialDelay )		;wait for windup
	;TRACE("Initial Delay complete")
	trapDisarmed = fireOnlyOnce	;If this can be fired only once then disarm
		
	if (fireOnlyOnce == True)	;If this can be fired only once then disarm
		trapDisarmed = True
	endif

	
	;Trap Guts
	while(finishedPlaying == False && isLoaded == true)
		if (HazardIsPlaced == FALSE)
			myHazardRef = PlaceAtMe(myHazard, 1)
; 			;debug.Trace(self + "has finished anim once")
			HazardIsPlaced = TRUE
		Else
			utility.wait(0.5)
		endif
		finishedPlaying = True
; 		debug.Trace(self + " firingTime == " + firingTime)
; 		debug.Trace(self + " currentRealTime == " + utility.getCurrentRealTime())
		
		if (loop == TRUE || utility.getCurrentRealTime() > firingTime)			;Reset Limiter
; 			;debug.Trace(self + "is looping because loop = " + loop)
			resetLimiter()
		endif			
	endWhile
	
	if isLoaded
		isFiring = false
		myHazardRef.Disable()
		myHazardRef.Delete()
		goToState("Reset")
	endif
		
	goToState("Reset")
	;TRACE("fireTrap has finished")
	
endFunction

State Reset
	Event OnBeginState()
		GoToState ( "Idle" )
	endEvent
	
	Event OnActivate( objectReference activateRef )
	EndEvent
endState

Function ResetLimiter()
	finishedPlaying = False
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;


;/
State Active
	Event onBeginState()
		goToState( "DoNothing" )
		;pressEffect.fire(selfRef, pressEffectAmmo)
		; EFFECT IS HERE ^^^^^ UNCOMMENT ONCE PROJECTILES OR PARTICLES CAN LEAVE A TRIGGER BOX CORRECTLY
		activate(self as objectReference)
		;playAnimationAndWait( "trigger", "reset" )
		playAnimation("Down")
		myHazardRef = PlaceAtMe(myHazard, 1)
		if objectsInTrigger == 0
			goToState( "Inactive" )
			playAnimation("Up")
			myHazardRef.Disable()
			myHazardRef.Delete()
		endif
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
; 		;debug.TRACE(self + " has been entered by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	endEvent
	
	event OnTrigger( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
; 		;debug.TRACE(self + " has been exited by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
		if objectsInTrigger == 0
			goToState ("Inactive")
			playAnimation("Up")
			myHazardRef.Disable()
			myHazardRef.Delete()
		endif
	endEvent
endState

State DoNothing			;Dummy state, don't do anything if animating
	event OnTriggerEnter( objectReference triggerRef )	
; 		;debug.TRACE(self + " has been entered by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	endEvent
	
	event OnTrigger( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
; 		;debug.TRACE(self + " has been exited by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
		if objectsInTrigger == 0
			goToState ("Inactive")
			playAnimation("Up")
			myHazardRef.Disable()
			myHazardRef.Delete()
		endif
	endEvent
EndState

auto State Inactive

	event onBeginState()
		if (Type == 1 && objectsInTrigger == 0)								;type 1 = hold, so deprecate here if necessary
			if (FiniteUse == TRUE && CountUsed < Count);if finite use and count > count used
				CountUsed += 1						;increase count for hold type triggers
			endif
			
			activate(self as objectReference)
			
		endif
	endEvent
	
	event OnTriggerEnter (objectReference triggerRef)
; 		;debug.TRACE(self + " has been entered by " + triggerRef)
		lastTriggerRef = triggerRef
		objectsInTrigger = self.GetTriggerObjectCount()
		if (FiniteUse == TRUE	&& CountUsed < Count)	;if finite use and count > count used
			;TRACE("Finite Use")
			if (Type != 1)							;type 1 = hold so only increase on leave
				CountUsed += 1						;increase count used
				;TRACE("Increasing Count on enter")
			endif
			goToState( "Active" )
		endif
		
		if (FiniteUse == FALSE)
			;TRACE("Infinite Use")
			goToState( "Active" )
		endif		
	endevent

	event OnTriggerLeave (objectReference triggerRef)
; 		;debug.TRACE(self + " has been exited by " + triggerRef)
		lastTriggerRef = triggerRef
		objectsInTrigger = self.GetTriggerObjectCount()
		if (Type == 1 && objectsInTrigger == 0)								;type 1 = hold, so deprecate here if necessary
			if (FiniteUse == TRUE && CountUsed < Count);if finite use and count > count used
				CountUsed += 1						;increase count for hold type triggers
			endif
			
			activate(self as objectReference)
			
		endif
		
	endevent
	
endstate

/;
