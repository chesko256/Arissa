Scriptname JailQuestEvidenceChestScript extends ReferenceAlias  
{shut down quest if player leaves prior to getting the objective}

event OnCellDetach()
	if GetOwningQuest().GetStage() < 20
		GetOwningQuest().SetStage(100)
	endif
endEvent
