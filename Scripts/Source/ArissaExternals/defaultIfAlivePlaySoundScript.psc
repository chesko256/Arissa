Scriptname defaultIfAlivePlaySoundScript extends ObjectReference  
{If actor is alive, play this sound at this marker on trigger enter}

import debug

Actor property myActor auto
{the actor to check whether dead or alive}

Sound property mySound auto
{the sound to play}

ObjectReference property mySoundOrigin auto
{the reference to play the sound from}

;************************************

auto State waiting
	EVENT onTriggerEnter(ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.GetPlayer())
			gotoState("done")
			if(myActor.isDead()==false)
				mySound.play(mySoundOrigin)
			endif
		endif
	ENDEVENT
endState

;************************************

State done
	;do nothing
endState

;************************************