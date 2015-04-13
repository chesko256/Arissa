scriptname e3ArvelTrapScript extends Actor
{when Arvel is dead and is activated, enable trigger that triggers the draugr to get out}

ObjectReference property myTrigger auto

;*******************************

Auto State Listening
	Event onActivate(objectReference actorRef)
		{if I'm dead and the player activates me, enable the trigger}
		if(self.isDead() == 1 && actorRef == game.GetPlayer())
			gotoState("Done")
			myTrigger.enable()
		endif

	endEvent

	Event onDeath(Actor akKiller)
		utility.wait(10.0)
		myTrigger.enable()
		gotoState("Done")
	endEvent

endState

;*******************************

State Done
	;do nothing
endState

;*******************************
	