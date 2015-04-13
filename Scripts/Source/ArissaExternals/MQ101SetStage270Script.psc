ScriptName MQ101SetStage270Script extends ObjectReference

import game
Quest Property MQ101 Auto
ReferenceAlias Property BarracksRoomSoldier01 Auto
ReferenceAlias Property BarracksRoomSoldier02 Auto

auto STATE waitingForNPC
	EVENT onTriggerEnter(objectReference triggerRef)

		If triggerRef == getPlayer() as actor
			If MQ101.GetStageDone(210) == 1
				MQ101.SetStage(270)
				gotoState("hasBeenTriggered")
				Disable()
			EndIf
			
		Elseif triggerRef == BarracksRoomSoldier01.GetActorRef() as Actor || triggerRef == BarracksRoomSoldier02.GetActorRef() as Actor
			If MQ101.GetStageDone(220) == 1
				MQ101.SetStage(272)
				gotoState("hasBeenTriggered")
				Disable()
			EndIf
		EndIf

	EndEvent
	
EndSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE