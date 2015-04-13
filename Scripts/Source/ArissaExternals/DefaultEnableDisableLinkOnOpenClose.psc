Scriptname DefaultEnableDisableLinkOnOpenClose extends ObjectReference  
{Script, when placed on a door, will enable it's linked ref on close, and disable it on open.}

Event OnOpen(ObjectReference akActionRef)
  self.GetLinkedRef().Disable()
endEvent

Event OnClose(ObjectReference akActionRef)
  self.GetLinkedRef().Enable()
endEvent