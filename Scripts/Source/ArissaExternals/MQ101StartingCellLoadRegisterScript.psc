Scriptname MQ101StartingCellLoadRegisterScript extends ReferenceAlias  
{one in each starting cell to notify quest when cells are loaded}

auto state waiting
Event OnCellLoad()
; 	debug.trace(self + ": OnCellLoad")
	MQ101QuestScript myQuest = GetOwningQuest() as MQ101QuestScript
	if myQuest.GetStage() < 15
		gotoState("done")
		myQuest.RegisterStartingCellLoad()
	endif
endEvent
endState

state done
endState
