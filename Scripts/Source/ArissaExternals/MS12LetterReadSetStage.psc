Scriptname MS12LetterReadSetStage extends ReferenceAlias  

	
auto State waiting	
	;Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	;	if (Game.GetPlayer() == akNewContainer)
	;		GetOwningQuest().SetStage(10)
	;		GoToState("inactive")
	;	endif
	;EndEvent
	
	Event OnEquipped(Actor akActor)
		if (Game.GetPlayer() == akActor)
			GetOwningQuest().SetStage(10)
			GoToState("inactive")
		endif
	EndEvent
EndState

State inactive
EndState
