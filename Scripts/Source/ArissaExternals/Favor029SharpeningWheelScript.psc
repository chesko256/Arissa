Scriptname Favor029SharpeningWheelScript extends ReferenceAlias

Event OnActivate(ObjectReference akActionRef)

	If (akActionRef == Game.GetPlayer()) && (GetOwningQuest().GetStage() == 12)
		Self.GetReference().Activate(Game.GetPlayer())
		GetOwningQuest().SetStage(15)
	EndIf
	
EndEvent