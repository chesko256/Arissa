scriptName defaultActivateLinkedRefOnceOnDeath extends Actor
{
- Activate the specified linked ref when this actor dies.
}

ObjectReference myLinkedRef
Keyword Property linkedRefKeyword Auto

Auto State PreActivation
	Event OnDeath(Actor killer)
		Self.GetLinkedRef(LinkedRefKeyword).Activate(Self)
		gotoState("PostActivation")
	EndEvent
EndState

STATE PostActivation
	;Do nothing
EndState
