scriptName defaultActivateActivateLinkedRefOnce extends ObjectReference
{
- Activate the specified linked ref when this object is activated.
}

ObjectReference myLinkedRef
Keyword Property linkedRefKeyword Auto

Auto State PreActivation
	Event OnActivate(ObjectReference triggerRef)
; 		Debug.Trace("Received:" + LinkedRefKeyword + " " + Self.GetLinkedRef(LinkedRefKeyword) + triggerRef)
		Self.GetLinkedRef(LinkedRefKeyword).Activate(triggerRef)
		gotoState("PostActivation")
	EndEvent
EndState

STATE PostActivation
	;Do nothing
EndState
