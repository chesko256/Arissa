Scriptname T01ChaliceScript extends ReferenceAlias  

Quest Property ParentQuest auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		if (GetOwningQuest().GetStage() == 10)
			GetOwningQuest().SetStage(20)
		endif
		if (ParentQuest.GetStage() < 60)
			(ParentQuest as T01QuestScript).PlayerViolatedInnerSanctum()
		else
			(ParentQuest as T01QuestScript).PlayerJustHadToKeepGoing = True
		endif
	elseif ( akNewContainer == None && akOldContainer == Game.GetPlayer() )
		if ( (ParentQuest as T01QuestScript).PlayerInInnerSanctum )
			(ParentQuest as T01QuestScript).PlayerJustHadToKeepGoing = False
		endif
	endif
EndEvent
