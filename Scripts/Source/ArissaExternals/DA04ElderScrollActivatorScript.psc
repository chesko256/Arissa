Scriptname DA04ElderScrollActivatorScript extends ObjectReference  

ReferenceAlias Property ElderScroll auto
ObjectReference Property Contraption auto

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		Contraption.PlayAnimation("Take")
		ElderScroll.GetReference().Enable()
		Game.GetPlayer().AddItem(ElderScroll.GetReference(), 1)
		Disable()
		Delete()
	endif
EndEvent
