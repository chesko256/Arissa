Scriptname dunCGfakeExplosionTriggerScript extends ObjectReference  

import debug
import utility

Actor property myDragon auto
ObjectReference property myExplosionMarker auto
Explosion property myExplosion auto

;************************************

auto State Waiting
	
	Event onTriggerEnter (objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == myDragon)
			gotoState("done")
			myExplosionMarker.placeAtMe(myExplosion)
		endif
	endEvent

endState

;************************************

State done
	;do nothing
endState

;************************************
