scriptName defaultOnActivateBlockActivation extends ObjectReference
{ When this object is activated, block and ignore all further activations. Useful for a portcullis you don't want to close later, etc. }

Event OnActivate(ObjectReference obj)
	Self.BlockActivation(True)
EndEvent