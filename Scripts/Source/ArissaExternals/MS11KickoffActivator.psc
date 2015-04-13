Scriptname MS11KickoffActivator extends ObjectReference  

Quest Property ms11 Auto

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		ms11.Start()
		Disable()
	endif
endEvent