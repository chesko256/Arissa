scriptName dunDA14PortalDisableScript extends ObjectReference
{
- Script that handles disabling the portal that's created for DA14
}

import debug
import utility

Quest property myQuest auto
ObjectReference property myDoor auto
ObjectReference property myFX auto
ObjectReference property myFXLight auto
ObjectReference property myEnabler auto

;*************************************

auto State Waiting

	Event onTriggerEnter(ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer())
			if(myQuest.getStageDone(200))
				gotoState("done")
				myDoor.disable()
				myEnabler.disable()
				myFX.disable()
				myFXLight.disable()
			endif
		endif
	endEvent

endState

;*************************************

State done
	;do nothing
	
endState

;*************************************