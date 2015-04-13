scriptName defaultOnActivateEnableScript extends ObjectReference

import game
import debug
import utility

ObjectReference Property RefToBeEnabled auto

auto State WaitingToBeActivated
	EVENT onActivate(ObjectReference triggerRef)
		if triggerRef == getPlayer() as actor
			RefToBeEnabled.enable()
			gotoState("Activated")
		endif
	endEVENT
EndState

State Activated
	;Do nothing
EndState