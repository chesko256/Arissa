Scriptname C03GallowsRockEntranceScript extends ObjectReference  


Quest Property C03 auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (Game.GetPlayer() == akActivator)
		(C03 as C03QuestScript).TransformedRecently = false
		if (C03.GetStage() < 30)
			C03.SetStage(30)
		endif
		Delete()
	endif
EndEvent
