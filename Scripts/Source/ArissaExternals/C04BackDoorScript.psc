Scriptname C04BackDoorScript extends ReferenceAlias

ReferenceAlias Property Vilkas auto
ReferenceAlias Property VilkasSpot auto
ObjectReference Property VilkasFG2 auto


Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer() && GetOwningQuest().GetStage() == 30)
; 		Debug.Trace("C04: Player entering back door of Jorrvaskr; moving Vilkas.")
		VilkasSpot.ForceRefto(VilkasFG2)
		Vilkas.GetReference().MoveTo(VilkasFG2)
		; Vilkas.GetActorReference().EvaluatePackage()
	endif
EndEvent
