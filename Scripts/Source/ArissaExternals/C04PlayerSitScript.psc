Scriptname C04PlayerSitScript extends ReferenceAlias  


ReferenceAlias Property Chair auto
ReferenceAlias Property Kodlak auto

Event OnSit(ObjectReference akFurniture)
	if (akFurniture == Chair.GetReference())
		(GetOwningQuest() as C04QuestScript).PlayerSittingDown = True
		Kodlak.GetActorReference().EvaluatePackage()
	endif
EndEvent

Event OnGetUp(ObjectReference akFurniture)
	if (akFurniture == Chair.GetReference())
		(GetOwningQuest() as C04QuestScript).PlayerSittingDown = False
	endif
EndEvent
