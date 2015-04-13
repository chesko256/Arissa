Scriptname DA09PedestalScript extends ReferenceAlias  

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer() && GetOwningQuest().GetStage() == 410
		GetOwningQuest().SetStage(450)
	
	EndIf


EndEvent
