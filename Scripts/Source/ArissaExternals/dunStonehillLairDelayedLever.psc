scriptName dunStonehillLairDelayedLever extends ObjectReference Conditional

import debug
import utility

float property delay Auto

Auto STATE pulledPosition
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		playAnimation("FullPush")
		Self.GetLinkedRef().Activate(triggerRef)
		Utility.Wait(delay)
		gotoState("pushedPosition")
	endEVENT
endState

STATE pushedPosition
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		playAnimation("FullPull")
		Self.GetLinkedRef().Activate(triggerRef)
		Utility.Wait(delay)
		gotoState("pulledPosition")
	endEVENT
endState


STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing
		endEVENT
endSTATE
