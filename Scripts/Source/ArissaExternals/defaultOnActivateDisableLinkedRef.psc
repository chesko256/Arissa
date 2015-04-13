scriptName defaultOnActivateDisableLinkedRef extends ObjectReference

Keyword property LinkedRefKeyword Auto

EVENT onActivate(ObjectReference triggerRef)
	Self.GetLinkedRef(LinkedRefKeyword).Disable()
EndEvent