scriptName dunShaftTrapScript extends ObjectReference
{
- This script handles enabling/disabling of fx and sound
}

import debug
import utility
import activator

;Activator property myFXAct auto
ObjectReference property myFX auto
ObjectReference property mySoundLoop auto
ObjectReference property myFXLight auto
ObjectReference property myFXStartMarker01 auto
ObjectReference property myFXActivator auto
ObjectReference property mySoundDoppler auto
ObjectReference property mySoundSpin auto
bool property inTrigger = false auto hidden
bool property inProgress = false auto hidden

bool myScaleShrink
float myFXScale


;*************************************

Event onLoad()
	;myFX = (myFXAct as Form) as ObjectReference
	myFXScale = myFX.getScale()
endEvent

;*************************************

Event onUpdate()
	while(inTrigger)
		;notification("in while")
		if (myFXScale >= 10.0)
			myScaleShrink = true
		else
			if (myFXScale <= 4.0)
				myScaleShrink = false
			endif
		endif
		
		if (myScaleShrink)
			myFX.setScale(myFXScale - 0.1)
		else
			myFX.setScale(myFXScale + 0.1)
		endif
		
		myFXScale = myFX.getScale()
		
		wait(0)
	endWhile

endEvent
;*************************************

auto State Waiting
	Event onTriggerEnter(ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer() && inTrigger == false && inProgress == false)
			gotoState("done")
			inTrigger = true
			myFXActivator.enable()
			myFXLight.moveto(myFXStartMarker01)
			myFXLight.enable()
			myFX.moveto(myFXStartMarker01)
			myFX.enable()
			mySoundLoop.enable()
			registerForSingleUpdate(0)
			gotoState("Waiting")
		endif
	endEvent
	
	Event onTriggerLeave(ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer() && inTrigger == true && inProgress == false)
			gotoState("done")
			inTrigger = false
			mySoundLoop.disable()
			myFX.disable()
			myFXLight.disable()
			gotoState("Waiting")
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

	