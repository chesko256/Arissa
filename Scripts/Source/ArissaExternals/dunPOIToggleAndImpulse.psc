scriptName dunPOIToggleAndImpulse extends ObjectReference
{Toggles the state on a chain of linked refs, applying a havok impulse to each.}

ObjectReference property ObjectToToggle auto

auto State waiting	
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		ToggleAndImpulse(ObjectToToggle)
		GoToState("inactive")
	EndEvent
EndState

State inactive
EndState

Function ToggleAndImpulse(ObjectReference obj)
	if (obj != None)
		if (obj.IsDisabled())
			obj.Enable()
			ToggleAndImpulse(obj.GetLinkedRef())
			Utility.Wait(0.01)
			obj.ApplyHavokImpulse(0, 0, 1, 1)
		Else
			obj.Disable()
			ToggleAndImpulse(obj.GetLinkedRef())
		EndIf
	EndIf
EndFunction
