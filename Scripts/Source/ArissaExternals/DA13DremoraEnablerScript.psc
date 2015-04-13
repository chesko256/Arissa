scriptname DA13DremoraEnablerScript extends objectReference

quest property myQuest auto
{set to DA13 only}

int property myStage auto
{set which stage script should be listening for}

objectReference property myLink auto hidden

;************************************

Event onLoad()
	myLink = (self.getLinkedRef())
endEvent

auto State Listening
	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == game.getPlayer())
			if(myQuest.getStage() >= myStage && myQuest.getStage() < 100)
				gotoState ("done")
				myLink.enable()
			endif
		endif
	endEvent
endState

;************************************

State done
	;do nothing
endState

;************************************