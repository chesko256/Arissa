scriptName dweSpiderCenturionPipeScript extends ObjectReference

import debug
import utility

;****************************************

auto State Listening

	Event onActivate(objectReference triggerRef)
		Actor myActor = triggerRef as Actor
		if (myActor.getState() != "Waiting")
			gotoState("done")
			playAnimation("exit")
		endif
	endEvent

endState

;****************************************

State done
	;do nothing
endState

;****************************************