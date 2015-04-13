scriptName defaultActivateDeleteLinkedRef extends ObjectReference
{
- Deletes the linkedref when this object is activated.
}

ObjectReference myLinkedRef

Event OnActivate(ObjectReference triggerRef)
	myLinkedRef = GetLinkedRef() as ObjectReference
	myLinkedRef.Delete()
EndEvent
