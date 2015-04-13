scriptName PressureReleasePlate extends TrapTriggerBase
;
;
;======================================================

import debug

int Count                       ;if Finite = 1, Determines how many times this trigger can be used
int CountUsed                   ;Used to compare times triggered to max triggers allowed
int Type                        ;This is to determine trigger to send to the trap
bool bdownVar = true

weapon property pressEffect auto
ammo property pressEffectAmmo auto
bool property DoNotAllowActors = FALSE auto hidden
objectReference property selfRef auto hidden

; Property to represent the animation state of the pressure plate.  If true the plate is down.
;  Setting this property will also ansure the object is animated to the right state.
bool property bDown
	bool Function Get()
		return bdownVar
	endFunction

	; Set the down state and send playAnimation event if state changed.
	Function Set(bool bValue)
		;if (bdownVar != bValue)

			if (bValue == true)
				;TraceStack("Playing Down") 
				playAnimation("Down")
				goToState("Inactive")
			else
				;TraceStack("Playing Up") 
				playAnimation("Up")
				goToState("Active")
			endif

			bdownVar = bValue
		;endif
	endFunction
endProperty

Event onCellAttach()
; 	debug.Trace(self + ": onCellAttach called")
	selfRef = self as objectReference
	objectsInTrigger = self.GetTriggerObjectCount()
	if (objectsInTrigger > 0)
		bDown = true
		;goToState("Inactive")
	else
		bDown = false
		;goToState("Active")
	endif
endevent

; We are in the inactive state when something is in the trigger and the pressure plate is in the down position.
;  This is the default state.
auto State Inactive
	event OnTriggerEnter (objectReference triggerRef)

; 		debug.TRACE(self + " in state Inactive has been entered by " + triggerRef)
			
		;lastTriggerRef = triggerRef
		objectsInTrigger = self.GetTriggerObjectCount()

		;Something has entered so we are going to push down.
		if (objectsInTrigger > 0)
			;/
			if (bDown == false)
				;if (FiniteUse == TRUE && CountUsed < Count);if finite use and count > count used
				;	CountUsed += 1						;increase count for hold type triggers
				;endif
				
; 				;debug.Trace(self + ": has activated in Inactive onTriggerEnter")
				;activate(selfRef)
				bDown = true
			endif
			/;
		endif
	endevent

	event OnTriggerLeave (objectReference triggerRef)
; 		debug.TRACE(self + " in state Inactive has been exited by " + triggerRef)
			
		;lastTriggerRef = triggerRef
		objectsInTrigger = self.GetTriggerObjectCount()

		; If no objects left in the trigger then set to the active state.
		if (objectsInTrigger == 0)
			bDown = false
			;goToState( "Active" )
			
			;if (FiniteUse == FALSE)
				;TRACE("Infinite Use")
			;	goToState( "Active" )
			;endif
		endif
	endevent
endstate

; We are in the active state when nothing is in the trigger and the pressure plate is in the up position.
State Active
	Event onBeginState()
		if !selfRef
			selfRef = self as objectReference
		endif
		;pressEffect.fire(selfRef, pressEffectAmmo)
		; EFFECT IS HERE ^^^^^ UNCOMMENT ONCE PROJECTILES OR PARTICLES CAN LEAVE A TRIGGER BOX CORRECTLY
; 		debug.Trace(self + ": has activated in Active onBeginState")
		activate(selfRef)

		; If used as many times as we wished then set inactive.
		if (Type != 1)							;type 1 = hold so only increase on leave
			CountUsed += 1						;increase count used
		endif

		if (FiniteUse == TRUE && CountUsed >= Count)
			;TRACE("Finite use amount reached, going inactive.")
			goToState( "DoNothing" )
		endif
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
; 		debug.TRACE(self + " in state Active has been entered by " + triggerRef)

		objectsInTrigger = self.GetTriggerObjectCount()

		;This will always be true.
		if (objectsInTrigger > 0)
			bDown = true
			;goToState ("Inactive")
		endif
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
; 		debug.TRACE(self + " in state Active has been exited by " + triggerRef)

		objectsInTrigger = self.GetTriggerObjectCount()

		;This is just to make sure but bDowns should already be false if we are still in the active state.
		if (objectsInTrigger == 0)
			bDown = false
		endif
	endEvent
endState

State DoNothing			;Dummy state, don't do anything if animating
	event OnTriggerEnter( objectReference triggerRef )	
; 		debug.TRACE(self + " in state DoNothing has been entered by " + triggerRef)
		;Put this in to make the trigger animate even when doing nothing.
		;bDown = true
	endEvent
			
	event OnTriggerLeave( objectReference triggerRef )
; 		debug.TRACE(self + " in state DoNothing has been exited by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
		;Put this in to make the trigger animate even when doing nothing.
		;if (objectsInTrigger == 0)
		;	bDown = false
		;endif
	endEvent
EndState

event onReset()
	CountUsed = 0
	self.Reset()
	goToState("Inactive")
endEvent
