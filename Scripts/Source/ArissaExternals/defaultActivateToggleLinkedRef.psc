scriptName defaultActivateToggleLinkedRef extends ObjectReference
{
- Toggles the state of the linked ref when this object is activated.
}

ObjectReference myLinkedRef

bool property fade = False Auto

Event OnActivate(ObjectReference triggerRef)
	myLinkedRef = GetLinkedRef() as ObjectReference
	if (myLinkedRef.IsEnabled())
		myLinkedRef.Disable(fade)
	Else
		myLinkedRef.Enable(fade)
	EndIf
EndEvent
