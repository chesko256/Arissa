ScriptName MS02MadanachNoteScript extends ReferenceAlias

Int Property StageToSet Auto

auto State waiting

	Event OnRead()
		GetOwningQuest().SetStage(StageToSet)
		GoToState("allDone")
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			GetOwningQuest().SetStage(StageToSet)
			GoToState("allDone")
		Endif
	EndEvent

	Event OnEquipped(Actor akActor)
		If akActor == Game.GetPlayer()
			GetOwningQuest().SetStage(StageToSet)
			GoToState("allDone")
		Endif
	EndEvent
endState

State allDone
	;do nothing
endState

