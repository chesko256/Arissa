Scriptname RiftenCasketDoorScript extends ObjectReference  

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

string property snapcloseAnim = "snapclose" auto
{animation to play when closing}

string property openEvent = "done" auto
{open event name - waits for this event before considering itself "open"}

string property closeEvent = "done" auto
{close event name - waits for this event before considering itself "closed"}

string property startOpenAnim = "opened" auto
{OnLoad calls this if the object starts in the open state}

bool property bAllowInterrupt = FALSE auto
{Allow interrupts while animation? Default: FALSE}

;int property myState = 1 auto hidden

; true when static or animating
; 0 == open or opening
; 1 == closed or closing

EVENT OnLoad()
;	if (isOpen )
;		trace(self + "OnLoad: playanimation(" + startOpenAnim + ")")
		playAnimation(snapcloseAnim)		;activator starts closed
		isOpen = false
		isAnimating = false
		gotoState("waiting")	
		;myState = 0
;	endif
endEVENT

auto STATE waiting	; waiting to be activated
	EVENT onActivate (objectReference triggerRef)
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
		if getlinkedref()
			getlinkedref().disable()
		endif
		trace(self + " Opening")
		if bAllowInterrupt == TRUE || !Is3DLoaded()
			playAnimation(openAnim) ; Animate Open
		else
			playAnimationandWait(openAnim, openEvent) ; Animate Open
		endif
		trace(self + " Opened")
		isOpen = true
		gotoState("waiting")
	elseif !abOpen && isOpen
		gotoState ("busy")
		if getlinkedref()
			getlinkedref().enable()
		endif
		trace(self + " Closing")
		if bAllowInterrupt == TRUE || !Is3DLoaded()
			playAnimation(closeAnim)
		else
			playAnimationandWait(closeAnim, closeEvent) ; Animate Closed
		endif
		trace(self + " Closed")
		isOpen = false
		gotoState("waiting")
	endif
	isAnimating = false
endFunction