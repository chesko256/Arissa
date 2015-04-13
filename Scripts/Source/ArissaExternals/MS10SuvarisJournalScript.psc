Scriptname MS10SuvarisJournalScript extends ReferenceAlias  


Function MoveUsAlong(Actor akActor)
	if (akActor == Game.GetPlayer())
		if (GetOwningQuest().GetStage() == 10)
			GetOwningQuest().SetStage(20)
		endif
	endif
EndFunction

Event OnEquipped(Actor akActor)
	;MoveUsAlong(akActor)
EndEvent

Event OnActivate(ObjectReference akActivator)
	;MoveUsAlong(akActivator as Actor)
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	MoveUsAlong(akNewContainer as Actor)
EndEvent
