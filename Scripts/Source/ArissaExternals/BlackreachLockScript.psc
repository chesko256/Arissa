Scriptname BlackreachLockScript extends ObjectReference
{Checks for Dwarven Key in inventory, animates, and activates the Blackreach door.}

import game
import debug
import utility

MiscObject Property DwarvenKey Auto
Message Property LackTheItem Auto
ObjectReference Property DweBREntranceStair Auto Hidden

bool property isAnimating = false auto Hidden
{is the activator currently animating from one state to another?}

string property openAnim = "Unlock" auto Hidden
{animation to play when opening}

;string property openEvent = "Unlock" auto
;{open event name - waits for this event before considering itself "open"}

auto STATE waiting	; waiting to be activated
	EVENT onActivate (objectReference triggerRef)
		; if player has the dwarven key in inventory, the stairway will open
		if (getPlayer().getItemCount(DwarvenKey)>=1)
			SetOpen()
		else
		LackTheItem.show()
		endif
		
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
				; block activation
				trace (self + " Busy")
		endEVENT
endSTATE

function SetOpen(bool abOpen = true)
	; if busy, wait to finish
	while getState() == "busy"
		wait(1)
	endWhile
	isAnimating = true
	DweBREntranceStair=GetLinkedRef()
	gotoState ("busy")
	trace(self + " Unlocking")
	playAnimation(openAnim) ; Animate Open
	Wait(2)
	DweBREntranceStair.Activate(DweBREntranceStair)
	gotoState("done")
	isAnimating = false
	AlftandBlackreachLockScript abls = (self as AlftandBlackreachLockScript)
	if (abls != None)
		abls.isOpen = true
	endif
endFunction

STATE done
	; This is the end state, player should not be able to reactivate
endSTATE