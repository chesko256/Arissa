scriptName NorSarcophagusTopAnim01SCRIPT extends ObjectReference
{This script causes the sarcophagus lid to animate when activated}


import debug
import utility

;bool onLoadDone
;bool onResetDone
bool isOpened = false

;*******************************************

Event onReset()
	onLoad()
endEvent

;*******************************************

Event onLoad()
	if(!isOpened)
		playAnimation("SnapClosed")
	endif
endEvent

;*******************************************

Auto State waiting
	Event onActivate (objectReference triggerRef)
		gotoState ("busy")
		isOpened = true
		playAnimation("OpenStart")	
	endEvent
endState

;*******************************************

State busy
	Event onActivate (objectReference triggerRef)
		;do nothing
	endEvent
endState

;*******************************************