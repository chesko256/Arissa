scriptName dunKagrenzelAnimationResetScript extends ObjectReference


import debug
import utility

objectReference property animObject auto
{reference the plays the animations}

;************************************

Event onTriggerEnter(objectReference triggerRef)
	Actor actorRef = triggerRef as Actor
	if(actorRef == game.getPlayer())
		animObject.playAnimation("Reset")
	endif
endEvent
	
;************************************