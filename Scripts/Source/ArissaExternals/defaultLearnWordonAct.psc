scriptName defaultLearnWordonAct extends ObjectReference

WordofPower Property myWord auto

auto State LearnShout
	EVENT onActivate(ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == game.GetPlayer())
			gotoState("Done")
			game.teachWord(myWord)
			debug.messagebox("You just learned the word: " + myWord)
			endif
	endEVENT
EndState


State Done
	Event onActivate (ObjectReference triggerRef)
	Actor actorRef = triggerRef as Actor
		if (actorRef == game.GetPlayer())
			debug.notification("You've already learned the word: " + myWord)
		endif
	endEVENT
EndState