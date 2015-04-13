Scriptname DragonHearscaleScript extends ObjectReference  Conditional

Quest Property MGRitual05  Auto  


Event OnContainerChanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		if MGRitual05.GetStage() == 10
			MGRitual05.SetStage(20)
		endif
	endif


EndEvent