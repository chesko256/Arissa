Scriptname ActivateAgainAfterDelay extends objectReference  
{for levers that reset. CAUTION - if dual-switches control one gate, don't put them close enough for the player to beat the delay}

import debug
import utility

float property fDelay auto
keyword property linkSisterSwitch auto
bool waiting

objectReference property blocker auto
{Optional - enable a blocking object when the way is shut.}

EVENT onLoad()
	blockActivation()
endEVENT

Auto STATE pulledPosition
	EVENT onActivate (objectReference triggerRef)
		if getLinkedRef(linkSisterSwitch).getState() == "busy"
			; if my other switch is busy, act like I am, too.
		else
			activate(self, true)
			if blocker
				blocker.disable()
			endif
			gotoState ("busy")
			playAnimationandWait("FullPush","FullPushedUp")
			wait(fDelay)
			;activate(triggerRef)
			activate(self, true)
			playAnimationandWait("FullPull","FullPulledDown")
			if blocker
				utility.wait(0.5)
				blocker.enable()
			endif
			gotoState("pulledPosition")
		endif
	endEVENT
endState

; STATE pushedPosition
	; EVENT onActivate (objectReference triggerRef)
		; gotoState ("busy")
		; wait(fDelay)
		; gotoState("pulledPosition")
		; activate(triggerRef)
	; endEVENT
; endState


STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing
		endEVENT
endSTATE


; EVENT onActivate(objectReference actronaut)
	; if waiting == FALSE
		; self.activate(actronaut)
		; waiting = TRUE
		; utility.wait(fDelay)
		; self.activate(actronaut)
		; waiting = FALSE
	; endif
; endEVENT