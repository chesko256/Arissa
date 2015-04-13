Scriptname WIDragonKilled extends Quest  Conditional

WIFunctionsScript Property WI Auto
{Pointer to WIFunctionsScript on WI quest.}


Event OnUpdate()		;registered for single update in stage 1
; 	debug.trace("WIDragonKilled OnUpdate(), will now call stop() on quest ") 
	
	stop()

EndEvent

