Scriptname TGDoorCloserTriggerScript extends ObjectReference  

ObjectReference Property pSwitch Auto
ObjectReference Property pCasket Auto

Event OnTriggerLeave(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer() && (pCasket as RiftenCasketDoorScript).IsOpen
		pSwitch.Activate(Game.GetPlayer())
	endif

endEvent