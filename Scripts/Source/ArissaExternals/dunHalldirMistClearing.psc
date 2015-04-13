scriptName dunHalldirMistClearing extends ObjectReference
{Each mist object, when activated, fades out.}

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto
Keyword property LinkCustom03 Auto
Keyword property LinkCustom04 Auto
Keyword property LinkCustom05 Auto

Event OnActivate(ObjectReference obj)
	Self.GetLinkedRef().DisableNoWait(True)
	Self.GetLinkedRef(LinkCustom01).DisableNoWait(True)
	Self.GetLinkedRef(LinkCustom02).DisableNoWait(True)
	Self.GetLinkedRef(LinkCustom03).DisableNoWait(True)
	Self.GetLinkedRef(LinkCustom04).DisableNoWait(True)
	Self.GetLinkedRef(LinkCustom05).DisableNoWait(True)
EndEvent

Event OnReset()
	Self.GetLinkedRef().Enable()
	Self.GetLinkedRef(LinkCustom01).Enable()
	Self.GetLinkedRef(LinkCustom02).Enable()
	Self.GetLinkedRef(LinkCustom03).Enable()
	Self.GetLinkedRef(LinkCustom04).Enable()
	Self.GetLinkedRef(LinkCustom05).Enable()
EndEvent
