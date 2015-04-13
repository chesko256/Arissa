ScriptName DefaultDisableLinkedRefOnLoad extends ObjectReference  
{If this object is enabled, when the cell loads, it disables its linkedref. Useful for enable-state swapping on cell loads.}

bool disableOnLoad = False

Event OnCellLoad()
	if (disableOnLoad)
		Self.GetLinkedRef().Disable()
	EndIf
EndEvent

Event OnActivate(ObjectReference obj)
	disableOnLoad = True
EndEvent

Event OnReset()
EndEvent