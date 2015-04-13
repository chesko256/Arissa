ScriptName MS01ReadBookScript extends ReferenceAlias

Int Property StageToSet Auto
Int Property MinStagetoCheck Auto

auto State waiting

	Event OnRead()
		If GetOwningQuest().GetStageDone(MinStagetoCheck) == 1
			GetOwningQuest().SetStage(StageToSet)
			GoToState("allDone")
		EndIf
	EndEvent

;	Event OnActivate(ObjectReference akActionRef)
;		If akActionRef == Game.GetPlayer()
;			GetOwningQuest().SetStage(StageToSet)
;			GoToState("allDone")
;		Endif
;	EndEvent
;
;	Event OnEquipped(Actor akActor)
;		If akActor == Game.GetPlayer()
;			GetOwningQuest().SetStage(StageToSet)
;			GoToState("allDone")
;		Endif
;	EndEvent
endState

State allDone
	;do nothing
endState