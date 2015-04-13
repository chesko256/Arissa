scriptName dunDA14PortalScript extends ObjectReference
{
- Script that handles the portal that's created for DA14
}

import debug
import utility

ObjectReference property myDoor auto
ObjectReference property myFX auto
ObjectReference property myFXLight auto

;*************************************

auto State Waiting

	Event onTriggerEnter(ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer())
			gotoState("done")
			myFX.enable()
			wait(2.0)
			myFX.playAnimation("playAnim02")
			wait(1.0)
			myFXLight.enable(1)
			wait(1.0)
			myDoor.enable()
		endif
	endEvent

endState

;*************************************

State done
	Event onActivate (ObjectReference triggerRef)
		;do nothing
	endEvent
endState

;*************************************



	