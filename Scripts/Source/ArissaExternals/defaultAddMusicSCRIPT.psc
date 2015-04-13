scriptName defaultAddMusicSCRIPT extends ObjectReference
{plays music when player enters trigger}

MusicType property myMusic auto
{Music to play when player enters trigger}

Auto STATE Listening
	EVENT onTriggerEnter (objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == game.GetPlayer())
			gotoState ("done")
			myMusic.Add()
		endif
	endEVENT
endState

STATE done
	; do nothing
endSTATE
