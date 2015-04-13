Scriptname CR13SconceScript extends ReferenceAlias  

ReferenceAlias Property Questgiver auto
ReferenceAlias Property Head auto
MiscObject Property HeadObj auto

ReferenceAlias Property Farkas auto
ReferenceAlias Property Vilkas auto

ReferenceAlias Property TargetSpirit auto
ReferenceAlias Property FarkasSpirit auto
ReferenceAlias Property VilkasSpirit auto

auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			if (GetOwningQuest().GetStage() == 15)
				if (Game.GetPlayer().GetItemCount(HeadObj) >= 1)
					GoToState("Done")
					Game.GetPlayer().RemoveItem(Head.GetReference(), 1)
					if     (Questgiver.GetReference() == Farkas.GetReference())
						TargetSpirit.ForceRefTo(FarkasSpirit.GetReference())
					elseif (Questgiver.GetReference() == Vilkas.GetReference())
						TargetSpirit.ForceRefTo(VilkasSpirit.GetReference())
					endif

					TargetSpirit.GetReference().Enable()
					GetOwningQuest().SetStage(17)
				endif
			endif
		endif
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
	EndEvent
EndState

; to allow existing saves to work before the Waiting/Done states were added
Event OnActivate(ObjectReference akActivator)
	GoToState("Waiting")
	GetReference().Activate(akActivator)
EndEvent
