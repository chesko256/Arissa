Scriptname C05FragmentScript extends ReferenceAlias  


Event OnActivate(ObjectReference akActivator)
; 	Debug.Trace("C05: Activating fragment trigger")
	GetOwningQuest().SetStage(20)
EndEvent

