Scriptname DA16AlchemyTomeScript  Extends ReferenceAlias Conditional

Quest Property pDA16Quest  Auto  Conditional
DA16QuestScript Property pDA16QS Auto Conditional

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if pDA16Quest.GetStage() == 70
		if akNewContainer == Game.GetPlayer()
			pDA16Quest.SetStage(80)
		endif
	elseif pDA16Quest.GetStage() < 70
		if akNewContainer == Game.GetPlayer()
			if pDA16QS.pDA16IHaveTome == 0
				pDA16QS.pDA16IHaveTome = 1
			endif
		endif
	endif			

endEvent