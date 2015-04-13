scriptName NightingaleSecDoorScript extends ObjectReference Conditional

import debug
import utility

;****************************

Auto STATE pulledPosition
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		playAnimationandWait("Open","Opened")
	endEVENT
endState

;****************************

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing
		endEVENT
endSTATE
