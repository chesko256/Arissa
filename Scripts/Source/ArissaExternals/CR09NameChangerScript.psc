Scriptname CR09NameChangerScript extends Quest  

LocationAlias Property TargetLocation auto
LocationAlias Property Camp auto

Function CheckLocation()
	if (Camp.GetLocation() != TargetLocation.GetLocation())
		Stop()
	endif
EndFunction
