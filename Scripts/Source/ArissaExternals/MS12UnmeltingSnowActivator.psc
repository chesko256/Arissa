Scriptname MS12UnmeltingSnowActivator extends ObjectReference  

ReferenceAlias property Snow auto


Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		Snow.GetReference().Enable()
		Game.GetPlayer().AddItem(Snow.GetReference())
		GoToState("Done")
		Disable()
	endif
EndEvent
