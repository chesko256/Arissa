scriptname dunRebelsCairnActivator extends ObjectReference
{Just activates its linkedref, passing itself as the activator.}

Event OnActivate(ObjectReference obj)
	if (obj == Game.GetPlayer())
		Self.GetLinkedRef().Activate(Self)
	EndIf
EndEvent



