ScriptName MQ101InsideHelgenSetStageScript extends ObjectReference

import game
int property iFactionStage Auto
Quest Property MQ101 Auto

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)

		If triggerRef == getPlayer() as actor
			If MQ101.GetStage() < 200
				MQ101.SetStage(iFactionStage)
				gotoState("hasBeenTriggered")
				Disable()
			EndIf
		EndIf

	EndEvent
	
EndSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE