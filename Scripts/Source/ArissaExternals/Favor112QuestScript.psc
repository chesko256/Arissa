ScriptName Favor112QuestScript Extends Quest

ReferenceAlias property pDoor auto
Quest property pQuest auto

Event OnUpdate()

	if pDoor.GetRef().IsLocked() == 0
		if pQuest.GetStage() == 10
			pQuest.Setstage(15)
		endif
	endif

endEvent