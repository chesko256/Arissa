ScriptName MQ101AlduinScript extends ReferenceAlias

Idle Property PerchTowerAttackSmashBite Auto

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	if (akSource == self.GetRef()) && (asEventName == "End_Tower_Smash")
		(GetOwningQuest() as MQ101DragonAttackQuestScript).AlduinSmashDone = 1
		UnregisterForAnimationEvent(self.GetRef(), "End_Tower_Smash")
	EndIf

EndEvent

Event OnUpdate()

	;Fail safe if Alduin doesn't load in the Tower in time
; 	debug.trace(self + "Alduin Tower failsafe running")
	If GetOwningQuest().GetStageDone(103) == 0
; 		debug.trace(self + "Tower hole isn't open, play smash animation again")
		If (Self.GetActorRef().PlayIdle(PerchTowerAttackSmashBite))
; 			debug.trace(self + "Alduin smashes tower")
		Else
; 			debug.trace(self + "Alduin does NOT smash tower")
		EndIf
		RegisterForSingleUpdate(1)
	EndIf

EndEvent