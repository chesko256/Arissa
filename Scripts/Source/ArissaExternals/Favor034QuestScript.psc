Scriptname Favor034QuestScript extends Quest

ReferenceAlias Property pFavor034Chest  Auto  
Quest Property pFavor034 Auto

Event OnUpdate()

	if pFavor034Chest.GetRef().IsLocked() == 0
		if pFavor034.GetStage() < 15
			pFavor034.Setstage(15)
		endif
	endif

endEvent