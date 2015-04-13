Scriptname TG09BlackPoolTriggerScript extends ObjectReference  Conditional

Quest Property pTG09Quest  Auto  Conditional

event onTriggerEnter (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG09Quest.getstage() == 30
			pTG09Quest.setstage(40)
		endif
	endif

endevent