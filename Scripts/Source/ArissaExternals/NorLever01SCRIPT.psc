scriptName NorLever01SCRIPT extends ObjectReference Conditional

import debug
import utility

bool property isInPullPosition = True Auto

EVENT OnLoad()
	SetDefaultState()
endEVENT

Event OnReset()
	SetDefaultState()
EndEvent

;This has to be handled as a function, since OnLoad and OnReset can fire in either order, and we can't handle competing animation calls.
Function SetDefaultState()
	if (isInPullPosition)
		playAnimation("FullPull")
		gotoState("pulledPosition")
	Else
		playAnimation("FullPush")
		gotoState("pushedPosition")
	EndIf
EndFunction


Auto STATE pulledPosition
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		isInPullPosition = False
		playAnimationandWait("FullPush","FullPushedUp")
		gotoState("pushedPosition")
	endEVENT
endState

STATE pushedPosition
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		isInPullPosition = True
		playAnimationandWait("FullPull","FullPulledDown")
		gotoState("pulledPosition")
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing
		endEVENT
endSTATE
