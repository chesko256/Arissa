Scriptname MS10ShipDestructorScript extends ReferenceAlias  

Message Property MS10ShipDestructionMessage Auto

Event OnActivate(ObjectReference akActionRef)
	Utility.Wait(1)
	MS10ShipDestructionMessage.Show()
	GetOwningQuest().SetStage(55)
	GetReference().Disable()
endEvent