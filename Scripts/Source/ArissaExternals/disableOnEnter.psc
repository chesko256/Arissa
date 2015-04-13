Scriptname disableOnEnter extends ObjectReference  

EVENT onTriggerEnter(objectReference ref)
	IF ( ref as ACTOR == game.getPlayer() )
		Disable()
	ENDIF

ENDEVENT
