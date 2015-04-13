scriptName defaultPlayerEnableDisableLinkedRef extends ObjectReference
{
- This script enables or disables linked ref based on which type user defines in properties.  On Activator, or OnTriggerEnter, whichever is first.
- This script is for player trigger/activator only
- This script only fires once
}

int property TriggerType auto
{
0 (default) - enables linked ref
1 - disables linked ref
}

ObjectReference myLinkedRef

auto STATE Waiting

	Event onTriggerEnter(ObjectReference triggerRef)
; 	       Debug.Trace("Toggling: " + myLinkedRef)
		myLinkedRef = GetLinkedRef() as ObjectReference
		if (triggerRef == (Game.GetPlayer() as ObjectReference))
			if (TriggerType == 0)
				myLinkedRef.enable()
			elseif (TriggerType == 1)
				myLinkedRef.disable()
			endif
			GoToState("Done")
		endif
	endEvent

	Event onActivate(ObjectReference triggerRef)
; 	       Debug.Trace("Toggling: " + myLinkedRef)
		myLinkedRef = GetLinkedRef() as ObjectReference
		if (triggerRef == (Game.GetPlayer() as ObjectReference))
			if (TriggerType == 0)
				myLinkedRef.enable()
			elseif (TriggerType == 1)
				myLinkedRef.disable()
			endif
			GoToState("Done")
		endif
	endEvent

endSTATE

STATE Done
	;Do Nothing
endSTATE
