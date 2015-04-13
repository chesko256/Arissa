Scriptname defaultBloodPoolScript extends ObjectReference  

import debug
import utility

bool property startFull = false	auto conditional
{set to true to start filled}

string property fillAnim = "play" auto
{OnLoad calls this if the object starts in the open state}

EVENT OnLoad()
	if (startFull)
		playAnimation(fillAnim)		;activator starts filled
	endif
endEVENT

auto STATE waiting	; waiting to be activated
	EVENT onActivate (objectReference triggerRef)
		; fill when activated
		playAnimation(fillAnim)
	endEVENT
endState

