scriptName defaultClearLocationOnDeathRefAlias extends ReferenceAlias
{Sets the alias' location 'Cleared' when it is killed.}

Event OnDeath(Actor killer)
	Self.GetReference().GetCurrentLocation().SetCleared()
EndEvent