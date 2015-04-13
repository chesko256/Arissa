scriptName defaultOpenLinkedRefTrigger extends ObjectReference
{
- Opens the linked ref (eg. a door) when the player enters the trigger. This action is only performed once.
}

Auto State PreActivation
	Event onTriggerEnter(objectReference triggerRef)
		if (triggerRef == Game.getPlayer())
			(GetLinkedRef() as ObjectReference).SetOpen(True)
			gotoState("PostActivation")
		endif
	endEvent
EndState

STATE PostActivation
	;Do nothing
EndState
