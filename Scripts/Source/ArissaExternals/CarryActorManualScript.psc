Scriptname CarryActorManualScript extends CarryActorScript  
{for carrying things controlled entirely by the package
(no pickup/put down furniture)
}

Idle Property StartCarryingEvent  Auto  
{animation event to send when starting to carry}


function ChangeCarryState(bool bBeginCarrying, bool bDropItem = false)
; 	debug.trace(self + " ChangeCarryState")
	if bBeginCarrying
; 		debug.trace(self + " ChangeCarryState BEGIN")
		Actor selfActor = (self as ObjectReference) as Actor
		; add item to inventory (in the parent script, this is assumed to come from the "pick up" furniture)
		AddCarriedItems()
		; send animation event
		selfActor.PlayIdle(StartCarryingEvent)
	endif
	parent.ChangeCarryState(bBeginCarrying, bDropItem)
endFunction