Scriptname TG01HaelgaStatueScript extends ReferenceAlias  Conditional

int Property pTG01StatueGrabbed  Auto  
Quest Property pTG01  Auto

event onActivate (objectReference activateRef)

	if activateRef == Game.GetPlayer()

	if pTG01StatueGrabbed == 0
		TG01QuestScript pTG01Script = pTG01 as TG01QuestScript
		pTG01Script.pTG01GotStatue = 1
		if pTG01.IsObjectiveDisplayed(41) == 1
			pTG01.SetObjectiveCompleted(41,1)
		endif
		pTG01StatueGrabbed = 1
	endif

	endif

endevent
