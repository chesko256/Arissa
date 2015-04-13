Scriptname CWMapFlagScript extends ObjectReference  

ObjectReference Property MapMarker Auto

EVENT OnActivate(ObjectReference akActionRef)
	if (Game.GetPlayer())
		MapMarker.AddToMap()
	endif
endEVENT
