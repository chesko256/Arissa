scriptName DA16EnableActivateTrigger extends objectReference


event onTriggerEnter (objectReference akTrigger)
	if akTrigger == game.getPlayer()
		game.EnablePlayerControls(true, false, false, true, true, false, true, false)
	endif
endEvent


event onTriggerLeave (objectReference akTrigger)
	if akTrigger == game.getPlayer()
		game.DisablePlayerControls(false, true, true, false, false, true, true, true)
	endif
endEvent
