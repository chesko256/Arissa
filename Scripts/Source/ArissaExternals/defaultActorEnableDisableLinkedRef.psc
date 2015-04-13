scriptName defaultActorEnableDisableLinkedRef extends ObjectReference
{
- This script enables or disables linked ref based on which type user defines in properties.
- This script is for specified actor
- This script only fires once
}

int property TriggerType auto
{
0 (default) - enables linked ref
1 - disables linked ref
}

Actor property myActor auto
{this is the actor who triggers}

ObjectReference myLinkedRef

Event onTriggerEnter(ObjectReference triggerRef)
	myLinkedRef = GetLinkedRef() as ObjectReference
	Actor actorRef = triggerRef as Actor
	if (triggerRef == myActor)
		if (TriggerType == 0)
			myLinkedRef.enable()
		elseif (TriggerType == 1)
			myLinkedRef.disable()
		endif
		self.disable()
	endif
endEvent
