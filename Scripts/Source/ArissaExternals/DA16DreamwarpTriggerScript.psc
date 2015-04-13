Scriptname DA16DreamwarpTriggerScript extends ObjectReference  Conditional

ObjectReference Property pDA16DreamwarpReturnMarker  Auto
Message Property pDA16DreamwarpMessage Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		Game.GetPlayer().MoveTo(pDA16DreamwarpReturnMarker)
		pDA16DreamwarpMessage.Show()
	endif

endEvent