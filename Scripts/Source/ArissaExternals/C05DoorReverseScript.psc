Scriptname C05DoorReverseScript extends ReferenceAlias  

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		(GetOwningQuest() as C05QuestScript).PlayerOnCorrectSideOfDoor = false
	endif
EndEvent
