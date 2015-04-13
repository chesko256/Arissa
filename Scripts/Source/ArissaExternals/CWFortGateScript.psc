Scriptname CWFortGateScript Extends ObjectReference  


bool Property OpenMe auto Hidden
bool Property CloseMe auto Hidden


bool Property isOpen = false auto
{Override on REFERENCE - Default False.}

int Property UpdateFrequency = 5 Auto
{Override on REFERENCE - Default 5.}

;## Globals ##
GlobalVariable Property DebugOn auto
{Set on BASEOBJECT, don't override on reference: Pointer to CWDebugOn global}





Event OnInit()

; 	debug.trace(self + "OnInit()")

	RegisterForUpdate(UpdateFrequency)

	If (isOpen == false)
		gotoState("upPosition")	;Portcullis Starts Closed
	Else
		gotoState("downPosition")
		playAnimation("Opened")		;Portcullis Starts Opened

	EndIf
EndEvent

Event OnUpdate()
	;Note: State 'busy' overrides this event
	
; ; 	debug.TraceConditional(Self + "OnUpdate()", DebugOn.value)

	;Preference is given to calls to open
	if openMe
		gotoState("busy")
		openMe = false
		open()
		
	elseif closeMe
		gotoState("busy")
		closeMe = False
		close()
	
	EndIf

EndEvent


State busy
	; This is the State when I'm busy animating
	Event onActivate(objectReference triggerRef)
; ; 			debug.TraceConditional(Self + "State busy OnActivate(), doing nothing.", DebugOn.value)
	EndEvent
	
	Event OnUpdate()
; ; 		debug.TraceConditional(Self + "State busy OnUpdate(), doing nothing.", DebugOn.value)
	EndEvent
	
	Function open()
		;Note: see the normal function below
		openMe = True
	
	EndFunction
	
	Function close()
		;Note: see the normal function below
		closeMe = True
	
	EndFunction
	
EndState


State upPosition	; This is the State I'm in when open and at rest
	Event onActivate(objectReference triggerRef)
; ; 		debug.TraceConditional(Self + "State upPosition OnActivate(): calling open()", DebugOn.value)
		close()
		

	EndEvent
EndState

State downPosition	; This is the State I'm in when i'm closed and at rest
	Event onActivate(objectReference triggerRef)
; ; 		debug.TraceConditional(Self + "State downPosition OnActivate(): calling close()", DebugOn.value)
		open()
		
	EndEvent
EndState



Function open()
	;Note: state 'busy' overrides this function	with one of its own
	GoToState("busy")
	
; ; 	debug.TraceConditional(self + "open(): playAnimationandWait('open','opening')", DebugOn.value)
	playAnimationandWait("open","opening") ; Animate Open
	
; ; 	debug.TraceConditional(self + "open(): Done playing open animations, going to State 'upPosition'", DebugOn.value)
	
	gotoState("upPosition")
	
EndFunction


Function close()
	;Note: state 'busy' overrides this function	with one of its own
	GoToState("busy")
	
; ; 	debug.TraceConditional(self + "open(): playAnimationandWait('close','closing')", DebugOn.value)
	
	playAnimationandWait("close","closing") ; Animate Closed
	
; ; 	debug.TraceConditional(self + "open(): Done playing close animations, going to State 'downPosition'", DebugOn.value)
	
	gotoState("downPosition")
	
EndFunction

