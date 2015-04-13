Scriptname DefaultNoFastTravelTriggerScript extends ObjectReference  
{block fast travel while the player is in this trigger}

import game

EVENT onTriggerEnter(objectReference triggerRef)
	if triggerRef == GetPlayer()
		Game.EnableFastTravel(false)
	endif
endEvent

EVENT OnTriggerLeave(objectReference triggerRef)
	if triggerRef == GetPlayer()
		Game.EnableFastTravel(true)
	endif
endEvent