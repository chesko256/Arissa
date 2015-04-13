Scriptname TG09CircleTrigger extends ObjectReference  Conditional

Quest Property pTG09Quest  Auto  Conditional

event onTriggerEnter (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG09Quest.getstage() == 60
			pTG09Quest.setstage(200)
		endif
	endif

endevent