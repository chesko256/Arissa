scriptName DwePipeValve01SCRIPT extends ObjectReference

bool property bidirectional = False Auto
{Should the valve alternate directions with each activation? Default: False}

bool flip = False

Auto STATE Waiting
	EVENT onActivate (objectReference triggerRef)
		self.BlockActivation(true)
		if (flip)
			playAnimationandWait("trigger02","Trans02")
		Else
			playAnimationandWait("trigger01","Trans01")
		EndIf
		flip = !flip
		self.BlockActivation(false)
	endEVENT
endState