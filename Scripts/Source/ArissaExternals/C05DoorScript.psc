Scriptname C05DoorScript extends ReferenceAlias  

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		(GetOwningQuest() as C05QuestScript).PlayerOnCorrectSideOfDoor = true
	endif
EndEvent
