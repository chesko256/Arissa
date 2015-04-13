ScriptName ToggleLinkedRefOnOpenClose extends ObjectReference
{Toggles the linked ref when the item is opened or closed. Useful for collision on ImpWallBoxes.}

bool property DoOnce Auto

ObjectReference myLinkedRef
Int lastState

Auto State Default
	Event OnActivate(ObjectReference triggerRef)
		if (self.GetOpenState() != lastState)
			lastState = self.GetOpenState()
			myLinkedRef = GetLinkedRef() as ObjectReference
			if (myLinkedRef.IsEnabled())
				myLinkedRef.Disable()
			Else
				myLinkedRef.Enable()
			EndIf
			if (DoOnce)
				GoToState("DoNothing")
			EndIf
		EndIf
	EndEvent
EndState

State DoNothing
	Event OnActivate(ObjectReference triggerRef)
	;Do Nothing
	EndEvent
EndState