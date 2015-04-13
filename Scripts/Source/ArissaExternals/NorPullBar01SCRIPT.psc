scriptName NorPullBar01SCRIPT extends ObjectReference

import debug
import utility

Auto STATE Waiting
	EVENT onActivate (objectReference triggerRef)
		self.BlockActivation(true)
		playAnimationandWait("Pull","Reset")
		self.BlockActivation(false)
	endEVENT
endState