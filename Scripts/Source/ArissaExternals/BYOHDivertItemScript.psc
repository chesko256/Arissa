Scriptname BYOHDivertItemScript extends ObjectReference
{If this object is disabled, and its linkedref is enabled, move its contents into the linkedref.}
;Used for houses (Whiterun, Riften, Markarth) that have dual-state rooms with containers that can be disabled, to prevent loss of items.

Event OnCellAttach()
	if (Self.IsDisabled() && !Self.GetLinkedRef().IsDisabled())
		Self.RemoveAllItems(Self.GetLinkedRef(), True)
	EndIf
EndEvent