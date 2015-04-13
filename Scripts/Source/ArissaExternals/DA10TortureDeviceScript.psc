scriptName DA10TortureDeviceScript extends ReferenceAlias

import game
import debug
import utility

MiscObject Property PainExtensor auto

auto State WaitingToBeActivated
	EVENT onActivate(ObjectReference triggerRef)
		if triggerRef == getPlayer() as actor
			GetPlayer().AddItem(PainExtensor, 1)
			gotoState("Activated")
		endif
	endEVENT
EndState

State Activated
	;Do nothing
EndState