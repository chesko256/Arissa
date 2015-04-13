scriptName TrapBase extends objectReference
;
;This is the base trap script and handles what the trap is told by the trigger
;Any Trap should be usable with any trigger
;Trap params are on the trap (damage, timing, etc)
;Activation params are on the trigger, toggle, number of times it can be triggered, etc.
;Individual traps will be extended from this framework

						;Trigger Types for quick reference
						;0 = Single - fire the trap once do one time
						;1 = Hold - on entry turn on, on exit turn off
						;2 = Toggle - on entry or use toggle trap state
						;3 = Turn On - on entry or use turn on trap
						;4 = Turn Off - on entry or use turn off trap
						
;================================================================



bool property init auto hidden				; This should not be set by the user
bool property trapDisarmed auto	hidden	; This should not be set by the user
bool property loop auto hidden				; This should not be set by the user
objectReference property lastActivateRef auto hidden

bool Property fireOnlyOnce auto	;This should be set by the user
sound property WindupSound auto ;Played when winding up or releasing trap
;sound Property TrapHitSound auto ;Played when the trap hits something
;int property trapPushBack auto 		;push back impulse provided by the trap

bool property overrideLoop = False auto hidden

int Property TrapLevel = 1 auto
{Used to determine the difficulty of the trap, currently only tied to damage
	0 = Easy
	1 = Medium (DEFAULT)
	2 = Hard
	3 = VeryHard}
	
int Property damage auto hidden

TrapHitBase property hitBase auto hidden

Function initialize() 	; Placeholder - replaced with trap specific function
endFunction

Function fireTrap() 		; Placeholder - replaced with trap specific function
	ResolveLeveledDamage()
endFunction

Function resetLimiter()	; Placeholder - replaced with trap specific function
endFunction

;================================================================


auto State Idle
	
	event onActivate (objectReference activateRef)
; 		;debug.TRACE("Idle trigger")
		lastActivateRef = activateRef
		if (trapDisarmed == False)
			if init == False	;determine if we should initialize
				initialize()
				init = True
			endif
			
			TrapTriggerBase TriggerRef					;TriggerRef will always be a TrapTriggerBase
			TriggerRef = activateRef as TrapTriggerBase		;Set TriggerRef to our activateRef
; 			;debug.Trace("Type = " + TriggerRef.Type)
			
			if TriggerRef
				;TRACE("Type =")
				;TRACE(TriggerRef.Type)
				if (TriggerRef.Type == 0)						;if Type = 0 Single activate
					GoToState ( "DoOnce" )								;DoOnce Trigger Type
					ResetLimiter()
					FireTrap()
				elseif (TriggerRef.Type == 1) 				;Hold Trigger Type
					GoToState ( "Hold" )
					ResetLimiter()
					Loop = TRUE
					FireTrap()
				elseif (TriggerRef.Type >1 && TriggerRef.Type < 4) ;Most Trigger Types use On
					GoToState ( "On" )
					ResetLimiter()
					Loop = TRUE
					FireTrap()
				endif
			else
				GoToState ( "DoOnce" )								;DoOnce Trigger Type
				ResetLimiter()
				FireTrap()
			endif
		endif
	endevent
	
endstate

State DoOnce															;Type Do Once
	
	Event OnActivate( objectReference activateRef )
; 		;debug.TRACE(self + "Do Once trigger")
		lastActivateRef = activateRef
		if (trapDisarmed == FALSE)
			TrapTriggerBase TriggerRef							;TriggerRef will always be a TrapTriggerBase
			TriggerRef = activateRef as TrapTriggerBase		;Set TriggerRef to our activateRef			
			
; 			;debug.Trace("Type = " + TriggerRef.Type)
			
			If TriggerRef
				if (TriggerRef.Type == 0)					;Type Do Once
					resetLimiter()
				endif
				
				if (TriggerRef.Type == 1)					;Type Hold
					GoToState("Hold")
					resetLimiter()
					Loop = TRUE
				endif
				
				if (TriggerRef.Type >1 && TriggerRef.Type < 4) ;Most Trigger Types use On
					GoToState ( "On" )
					ResetLimiter()
					Loop = TRUE
				endif
				
				if (TriggerRef.Type == 4)					;Type Hold
					Loop = FALSE
					GoToState("Reset")
				endif
			else
			
			endif
		endif
		
	EndEvent

endstate

State Reset

	Event OnBeginState()
		overrideLoop = True
		GoToState ( "Idle" )
		hitBase = (self as objectReference) as TrapHitBase
		if hitbase
			hitBase.goToState("CannotHit")
		endif
	endEvent
	
	Event OnActivate( objectReference activateRef )
		lastActivateRef = activateRef
	EndEvent
	
endState

State On
	
	event onActivate (objectReference activateRef)
; 		;debug.TRACE(self + "On trigger")
		lastActivateRef = activateRef
		if (trapDisarmed == FALSE)
			TrapTriggerBase TriggerRef							;TriggerRef will always be a TrapTriggerBase
			TriggerRef = activateRef as TrapTriggerBase		;Set TriggerRef to our activateRef
			
; 			;debug.Trace("Type = " + TriggerRef.Type)
			
			if TriggerRef
				;/
				if (TriggerRef.Type == 1)					;Type Hold
					GoToState("Hold")
					resetLimiter()
					Loop = TRUE
				endif
				/;
				
				if (TriggerRef.Type == 4)					;if Type = 4 Turn Off
					GoToState ( "Reset" )
					Loop = FALSE
					overrideLoop = True
				endif
				
				if (TriggerRef.Type == 2)					;if Type = 2 Toggle
					GoToState ( "Reset" )
					Loop = FALSE
					overrideLoop = True
				endif
			endif
		endif
		
	endevent

endstate

State Hold			;Hold overrides all other states ***This is kind of a depricated state ***
	
	event onActivate (objectReference activateRef)
; 		;debug.TRACE(self + "Hold trigger")
		lastActivateRef = activateRef
		if (trapDisarmed == FALSE)
			TrapTriggerBase TriggerRef							;TriggerRef will always be a TrapTriggerBase
			TriggerRef = activateRef as TrapTriggerBase		;Set TriggerRef to our activateRef
			
; 			;debug.Trace("Type = " + TriggerRef.Type)
			
			if TriggerRef
				if (TriggerRef.Type == 1)						;if Type = 1 Turn Off
					GoToState ( "On" )
					Loop = FALSE
				endif
				
				if (TriggerRef.Type == 2)					;Type Hold
					Loop = FALSE
					GoToState("Reset")
				endif
				
				if (TriggerRef.Type == 3)						;if Type = 1 Turn Off
					GoToState ( "On" )
					Loop = FALSE
				endif
				
				if (TriggerRef.Type == 4)					;Type Hold
					Loop = FALSE
					GoToState("Reset")
				endif
			endif
		endif
	endEvent

endstate

State Disarmed

endState

;--------------------------------------
Function ResolveLeveledDamage () 	;placeholder function, declared in children
	hitBase = (self as objectReference) as TrapHitBase
	hitBase.damage = 0					;In child functions this will be defined
EndFunction






