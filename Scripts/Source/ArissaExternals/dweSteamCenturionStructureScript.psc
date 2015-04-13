scriptName dweSteamCenturionStructureScript extends ObjectReference

import debug
import utility

;****************************************

auto State Listening

	Event onActivate(objectReference triggerRef)
		Actor myActor = triggerRef as Actor
		if (myActor.getState() != "Waiting")
			gotoState("done")
			playAnimation("Trigger01")
			;wait(2)
			;playAnimation("close")
		endif
	endEvent

endState

;****************************************

State done
	;do nothing
endState

;****************************************