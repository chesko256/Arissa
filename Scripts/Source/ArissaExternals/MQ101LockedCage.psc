ScriptName MQ101LockedCage extends ReferenceAlias


auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			If GetOwningQuest().IsObjectiveDisplayed(75) == True
				GetOwningQuest().SetObjectiveDisplayed(75, abDisplayed = false)
				gotoState("hasBeenTriggered")
			EndIf
		EndIf
	EndEvent
endSTATE

STATE hasBeenTriggered
	; this state doesn't do anything
	EVENT onActivate(objectReference triggerRef)
	endEvent	
endSTATE