Scriptname BlackreachDoorScript extends ObjectReference Conditional
{Script to open the door to blackreach when activated by the lock.}

import game
import debug
import utility

bool property isOpen = false	auto Conditional
{set to true to start open}

bool property isAnimating = false auto Hidden
{is the activator currently animating from one state to another?}

string property openAnim = "Down" auto Hidden
{animation to play when opening}

string property openEvent = "TransDown" auto Hidden
{open event name - waits for this event before considering itself "open"}

int myState = 1
; true when static or animating
; 0 == open or opening
; 1 == closed or closing

EVENT OnLoad()
	if (isOpen )
		myState = 0
	endif
endEVENT

auto STATE waiting	; waiting to be activated
	EVENT onActivate (objectReference triggerRef)
		; switch open state when activated
		SetOpen(!isOpen)
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
				trace (self + " Busy")
		endEVENT
endSTATE

function SetOpen(bool abOpen = true)
	; if busy, wait to finish
	while getState() == "busy"
		wait(1)
	endWhile
	; open
	isAnimating = true
		if  !isOpen
			gotoState ("busy")
			trace(self + " Opening")
			playAnimationandWait(openAnim, openEvent) ; Animate Open
		endif
		trace(self + " Opened")
		isOpen = true
		gotoState("done")
	isAnimating = false
endFunction

STATE done
	; This is the end state, player should not be able to reactivate
endSTATE