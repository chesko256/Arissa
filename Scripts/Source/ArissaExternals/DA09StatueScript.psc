Scriptname DA09StatueScript extends ReferenceAlias  

MiscObject Property DA09Gem auto


Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer() && Game.GetPlayer().GetItemCount(DA09Gem) >= 1
		GetOwningQuest().setStage(200)
	EndIf
	
EndEvent

