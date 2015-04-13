scriptName dunFortSnowhawkActivateIfUnlocked extends ObjectReference

Event OnActivate(ObjectReference obj)
	if (!Self.IsLocked())
		GetLinkedRef().Activate(Self)
	EndIf
	
EndEvent