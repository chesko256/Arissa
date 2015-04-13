Scriptname DefaultDisableOnLoadAfterTrig extends ObjectReference  
{This trigger will disable itself on the next load, after it's been triggered.}


bool property beenTriggered auto hidden
{If true the player has walked into this trigger}

EVENT OnLoad()
	if beenTriggered
		self.disable()
		;utility.trace("DARYL - " + self + " Disabling myself since I've previously been triggered")
	else
		;utility.trace("DARYL - " + self + " Not disabling myself since I wasn't previously triggered")
	endif
EndEVENT

EVENT OnTriggerEnter(objectReference triggerRef)
	if triggerRef == Game.GetPlayer()
		beenTriggered = TRUE
		;utility.trace("DARYL - " + self + " Setting beenTriggered to TRUE since the player walked in the trigger")
	else
		;Do nothing since triggerRef wasn't the player
	endif
EndEVENT
	
	