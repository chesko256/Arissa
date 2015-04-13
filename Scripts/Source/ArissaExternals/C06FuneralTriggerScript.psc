Scriptname C06FuneralTriggerScript extends ObjectReference  

Quest Property OwnerQuest auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (OwnerQuest.IsRunning())
		if (Game.GetPlayer() == akActivator)
			(OwnerQuest as C06QuestScript).PlayerPresentAtFuneral = true
			Delete()
		endif
	endif
EndEvent
