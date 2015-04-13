scriptName defaultButtonSCRIPT extends objectReference
{quick script for a button object.}

bool property useOnce = FALSE auto
{Can be used only once? Default: FALSE}

auto STATE active
	EVENT onActivate(objectReference actronaut)
		;playAnimationandWait("down")
		playAnimation("down")
		gotoState("inactive")
		activate(self as ObjectReference)
		playAnimation("up")
		gotoState("active")
	endEVENT
endSTATE

STATE inactive
	; do nothing in this state
endSTATE

int Property TriggerType  Auto  
