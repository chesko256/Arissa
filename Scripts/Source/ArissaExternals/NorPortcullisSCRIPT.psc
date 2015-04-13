scriptName NorPortcullisSCRIPT extends ObjectReference

import debug
import utility

bool isOpen = false						;Is the portcullis already open


bool property isOpening
{
True if the door is currently in the process of opening
}
	bool Function Get()
		if ( (GetState() == "busy") && (!isOpen) )
			return true
		else
			return false
		endif
	endFunction
EndProperty

bool property isClosing
{
True if the door is currently in the process of opening
}
	bool Function Get()
		if ( (GetState() == "busy") && (isOpen) )
			return true
		else
			return false
		endif
	endFunction
EndProperty

bool property isAlreadyOpen	;Set "isOpen" to same as property "isAlreadyOpen"
{
True = Portcullis is already open
False = Portcullis is closed (default)
}
	bool Function Get ()
		return isOpen
	endFunction
	
	Function Set(bool value)
		isOpen = value
	endFunction
endProperty

EVENT OnLoad()
	SetDefaultState()
endEVENT

Event OnReset()
	SetDefaultState()
EndEvent

;This has to be handled as a function, since OnLoad and OnReset can fire in either order, and we can't handle competing animation calls.
Function SetDefaultState()
	if (isOpen == false)
			playAnimation("close") ; Animate Closed
			gotostate ("upPosition")	;Portcullis Start Closed
		else
			playAnimation("open")		;Portcullis Starts Opened
			gotostate ("downPosition")
	endif
EndFunction



STATE upPosition	; This is the state I'm in when open and at rest
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		;trace("Portcullis Opening")
		playAnimationandWait("open","opening") ; Animate Open
		;trace("Portcullis Opened")
		isOpen = true
		gotoState("downPosition")
	endEVENT
endState

STATE downPosition	; This is the state I'm in when i'm closed and at rest
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		;trace("Portcullis Closing")
		playAnimationandWait("close","closing") ; Animate Closed
		;trace("Portcullis Closed")
		isOpen = false
		gotoState("upPosition")
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;trace ("Portcullis Busy")
		endEVENT
endSTATE

