Scriptname DA16TorporScript Extends ReferenceAlias Conditional

Quest Property pDA16Quest  Auto  Conditional
DA16QuestScript Property pDA16QS Auto Conditional

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)


	if pDA16Quest.GetStage() == 110
		if akNewContainer == Game.GetPlayer()
			pDA16Quest.SetStage(120)
		endif
	elseif pDA16Quest.GetStage() < 110
		if akNewContainer == Game.GetPlayer()
			if pDA16QS.pDA16IHaveTorpor == 0
				pDA16QS.pDA16IHaveTorpor = 1
			endif
		endif
	endif			

endEvent
