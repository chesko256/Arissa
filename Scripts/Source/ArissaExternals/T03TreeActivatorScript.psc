Scriptname T03TreeActivatorScript extends ObjectReference  

ReferenceAlias Property Sap Auto
Quest Property T03 Auto

Event OnActivate(ObjectReference akActivator)
	Game.GetPlayer().AddItem(Sap.GetReference(), 1)
	
	T03.SetStage(70)
	Disable()
EndEvent
