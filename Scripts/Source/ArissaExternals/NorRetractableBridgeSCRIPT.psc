scriptName NorRetractableBridgeSCRIPT extends ObjectReference

import debug
import utility

bool isOpen = false						;Is the portcullis already open


bool property isAlreadyLowered	;Set "isOpen" to same as property "isAlreadyOpen"
{
True = Bridge is already lowered
False = Bridge is raised (default)
}
	bool Function Get ()
		return isOpen
	endFunction
	
	Function Set(bool value)
		isOpen = value
	endFunction
endProperty

EVENT OnInit()
	if (isOpen == false)
			gotostate ("LoweredPosition")	;Portcullis Start Closed
		else
			playAnimation("Raised")		;Portcullis Starts Opened
			gotostate ("RaisedPosition")
	endif
endEVENT

STATE LoweredPosition	; This is the state I'm in when open and at rest
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		;trace("Portcullis Opening")
		playAnimationandWait("lower","trans02") ; Animate Open
		;trace("Portcullis Opened")
		isOpen = true
		gotoState("RaisedPosition")
	endEVENT
endState

STATE RaisedPosition	; This is the state I'm in when i'm closed and at rest
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		;trace("Portcullis Closing")
		playAnimationandWait("raise","trans01") ; Animate Closed
		;trace("Portcullis Closed")
		isOpen = false
		gotoState("LoweredPosition")
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;trace ("Portcullis Busy")
		endEVENT
endSTATE

