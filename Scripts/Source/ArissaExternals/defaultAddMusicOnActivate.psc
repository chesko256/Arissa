scriptName defaultAddMusicOnActivate extends ObjectReference
{plays music when player enters trigger}

MusicType property myMusic auto
{Music to play when player enters trigger}

Auto STATE Listening
	EVENT OnActivate (objectReference triggerRef)
		gotoState ("done")
		myMusic.Add()
	endEVENT
endState

STATE done
	; do nothing
endSTATE
