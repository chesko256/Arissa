Scriptname MQ201CarriageMarker extends ReferenceAlias  
{ watch for player to sit in carriage}

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer() && GetOwningQuest().GetStage() == 90
; 		debug.trace(self + " OnActivate " + akActionRef)
		GetOwningQuest().SetStage(95)
	endif
endEvent
