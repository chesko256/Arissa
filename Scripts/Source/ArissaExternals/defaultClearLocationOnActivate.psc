scriptName defaultClearLocationOnActivate extends ObjectReference
{Sets the reference's location 'Cleared' when it is activated. In conjunction with defaultCounter, useful for clearing a location with multiple bosses.}

Event OnActivate(ObjectReference obj)
	Self.GetCurrentLocation().SetCleared()
EndEvent