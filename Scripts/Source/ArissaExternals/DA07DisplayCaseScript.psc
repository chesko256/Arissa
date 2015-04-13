ScriptName DA07DisplayCaseScript extends ReferenceAlias

Auto STATE WaitingForTrigger
	Event OnActivate(ObjectReference akActionRef)
		If (akActionRef == Game.GetPlayer()) && (GetOwningQuest().GetStage() == 50)
			GetOwningQuest().SetStage(60)
			GoToState("HasBeenTriggered")
		EndIF
EndEvent
endSTATE

STATE HasBeenTriggered
	;do nothing
endSTATE