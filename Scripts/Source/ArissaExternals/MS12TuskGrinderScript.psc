Scriptname MS12TuskGrinderScript extends ReferenceAlias  

ObjectReference Property TuskPowder auto

Event OnActivate(ObjectReference akActivator)
	TuskPowder.Enable()
	;GetReference().Disable()
EndEvent
