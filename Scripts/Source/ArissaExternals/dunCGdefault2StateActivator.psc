Scriptname dunCGdefault2StateActivator extends ObjectReference Conditional
{for any activator with standard open/close states}

import debug
import utility

bool property isOpen = false	auto conditional
{set to true to start open}

bool property doOnce = false auto
{set to true to open/close on first activation only}

bool property isAnimating = false auto Hidden
{is the activator currently animating from one state to another?}

string property openAnim = "open" auto
{animation to play when opening}

string property closeAnim = "close" auto
{animation to play when closing}

string property openEvent = "opening" auto
{open event name - waits for this event before considering itself "open"}

string property closeEvent = "closing" auto
{close event name - waits for this event before considering itself "closed"}

string property startOpenAnim = "opened" auto
{OnLoad calls this if the object starts in the open state}

bool property bAllowInterrupt = FALSE auto
{Allow interrupts while animation? Default: FALSE}

bool property zInvertCollision = FALSE auto
{Typically this will be False (DEFAULT).  The References LinkRef'd Chained with the TwoStateCollisionKeyword will typically be 
Enabled onOpen, and Disabled on Close.  If you want that functionality inverted set this to TRUE}

int property myState = 1 auto hidden

keyword property TwoStateCollisionKeyword auto

ObjectReference property myOtherBridge auto
{the bridge that gets destroyed by the falling debris}

; true when static or animating
; 0 == open or opening
; 1 == closed or closing

EVENT OnLoad()
	SetDefaultState()
endEVENT

Event OnReset()
	SetDefaultState()
EndEvent

;This has to be handled as a function, since OnLoad and OnReset can fire in either order, and we can't handle competing animation calls.
Function SetDefaultState()
	if (isOpen)
		playAnimationandWait(startOpenAnim, openEvent)

		if (zInvertCollision == FALSE)
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		endif

		myState = 0
	Else
		playAnimationandWait(closeAnim, closeEvent)
		
		if (zInvertCollision == FALSE)
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		endif

		myState = 1
	EndIf
EndFunction

auto STATE waiting	; waiting to be activated
	EVENT onActivate (objectReference triggerRef)
; 		Debug.Trace("d2SA RESETS: " + Self + " " + isOpen)
		; switch open state when activated
		SetOpen(!isOpen)
		if (doOnce)
			gotostate("done")
		endif
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			if bAllowInterrupt == TRUE
				; send the activation\
				SetOpen(!isOpen)
			else
				; block activation
				trace (self + " Busy")
			endif
		endEVENT
endSTATE

STATE done
	EVENT onActivate (objectReference triggerRef)
		;Do nothing
	endEVENT
endSTATE

function SetOpen(bool abOpen = true)
	; if busy, wait to finish
	while getState() == "busy"
		wait(1)
	endWhile
	; open/close if necessary
	isAnimating = true
	if abOpen && !isOpen
		gotoState ("busy")
		trace(self + " Opening")
		if bAllowInterrupt == TRUE || !Is3DLoaded()
			playAnimation(openAnim) ; Animate Open
		else
			playAnimationandWait(openAnim, openEvent) ; Animate Open
			myOtherBridge.enable()
		endif
		trace(self + " Opened")

		if (zInvertCollision == FALSE)
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		endif

		isOpen = true
		gotoState("waiting")
	elseif !abOpen && isOpen
		gotoState ("busy")
		trace(self + " Closing")
		if bAllowInterrupt == TRUE || !Is3DLoaded()
			playAnimation(closeAnim)
		else
			playAnimationandWait(closeAnim, closeEvent) ; Animate Closed
		endif
		trace(self + " Closed")
		
		if (zInvertCollision == FALSE)
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		endif

		isOpen = false
		gotoState("waiting")
	endif
	isAnimating = false
endFunction