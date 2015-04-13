ScriptName MS02MadanachDoorScript extends ReferenceAlias

auto STATE waitingForPlayer
	Event OnOpen(ObjectReference akActionRef)

		If (akActionRef == Game.GetPlayer())
			GetOwningQuest().SetStage(25)
			gotoState("hasBeenTriggered")
		EndIf
		
	EndEvent
EndState
	
STATE hasBeenTriggered
	; this is an empty state.
endSTATE