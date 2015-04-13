scriptName defaultActivateOpenLinkedRef extends ObjectReference
{
- Opens the linked ref when the object is activated.
}

ObjectReference myLinkedRef

Auto State PreActivation
	Event OnActivate(ObjectReference triggerRef)
		myLinkedRef = GetLinkedRef() as ObjectReference
		myLinkedRef.SetOpen(true)
		gotoState("PostActivation")
	EndEvent
EndState

STATE PostActivation
	;Do nothing
EndState
