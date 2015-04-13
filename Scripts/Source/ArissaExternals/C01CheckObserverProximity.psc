Scriptname C01CheckObserverProximity extends ObjectReference  

ReferenceAlias property C01Observer auto
CompanionsStoryQuest property C01 auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == C01Observer.GetReference())
		(C01 as C01QuestScript).ObserverCloseBy = True
	endif
EndEvent
