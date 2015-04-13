Scriptname CWSiegeDisableFastTravelTriggerScript extends ObjectReference  

Event OnTriggerEnter(ObjectReference akActionRef)
	
	if akActionRef == Game.GetPlayer()
; 		debug.trace(self + "OnTriggerEnter() DISABLING FAST TRAVEL!!!")
		Game.EnableFastTravel(False)
	EndIf

EndEvent

