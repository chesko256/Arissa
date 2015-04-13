Scriptname PlayerRiderScript extends ReferenceAlias  
{ watch for player to sit in carriage}

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
; 		debug.trace(self + " OnActivate " + akActionRef)
		CarriageSystemScript CarriageScript = GetowningQuest() as CarriageSystemScript
		Clear()
		carriageScript.PlayerIsSitting()
	endif
endEvent

event OnUnload()
; 	debug.trace(self + " current carriage unloading - clear waiting state")
	CarriageSystemScript CarriageScript = GetowningQuest() as CarriageSystemScript
	CarriageScript.ClearWaitingState()
endEvent
