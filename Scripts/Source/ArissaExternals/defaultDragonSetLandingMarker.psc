Scriptname defaultDragonSetLandingMarker extends ObjectReference  
{sets landing marker onLoad to linked ref}

Keyword Property LinkDragonLandingMarker  Auto  

event OnLoad()
	ObjectReference myLandingMarker = GetLinkedRef(LinkDragonLandingMarker)
	if myLandingMarker
		Actor mySelfActor = (self as ObjectReference) as Actor
		mySelfActor.SetForcedLandingMarker(myLandingMarker)
	endif
endEvent