scriptName dunPitAnimationActivationScript extends ObjectReference


import debug
import utility

objectReference property animObject auto
{reference the plays the animations}

MusicType property myMusic auto
{Music to play when activated}

;************************************

auto State Listening

	Event onActivate(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer())
			;player has activated
			gotoState("done")
			disable()
			animObject.playAnimation("Trigger01")
			wait(1)
			myMusic.Add()
			wait(9)
			animObject.playAnimation("Trigger02")
		endif
	endEvent
	
endState

;************************************

State done
	;do nothing
endState

;************************************