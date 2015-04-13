scriptName defaultClearLocationOnDeath extends Actor
{Sets the actor's location 'Cleared' when they are killed.}

Event OnDeath(Actor killer)
; 	;Debug.Trace("Clearing Location: " + Self.GetCurrentLocation())
	Self.GetCurrentLocation().SetCleared()
EndEvent