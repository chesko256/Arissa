Scriptname CartRiderScript extends ReferenceAlias  
{for cart riders to track exiting etc.}


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.trace(self + ": animation event received=" + asEventName)
	if asEventName == "ExitCartEnd"
		; not in cart anymore
		UnRegisterForAnimationEvent(akSource, "ExitCartEnd")
		(GetOwningQuest() as CarriageSystemScript).NotifyOnCartExit( self )
	endif
endEvent
