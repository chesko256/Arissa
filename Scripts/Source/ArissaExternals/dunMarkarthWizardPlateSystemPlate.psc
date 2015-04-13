scriptName dunMarkarthWizardPlateSystemPlate Extends PressurePlate
{Bi-directional pressure managed by a dunMarkarthWizardPlateSystemManager}

Message property failMessage Auto
ObjectReference property SystemManager Auto

Function OnEnter(objectReference triggerRef)
	if ((triggerRef as Actor) != None)
; 		;Debug.Trace("Trigger Enter Detected")
		objectsInTrigger = self.GetTriggerObjectCount()
		(SystemManager as dunMarkarthWizardPlateSystemManager).StateChange()
	Else
		failMessage.Show()
	EndIf
EndFunction

Function OnLeave(objectReference triggerRef)
	if ((triggerRef as Actor) != None)
; 		;Debug.Trace("Trigger Leave Detected")
		objectsInTrigger = self.GetTriggerObjectCount()
		(SystemManager as dunMarkarthWizardPlateSystemManager).StateChange()
	EndIf
EndFunction

bool Function GetInTrigger()
; 	;Debug.Trace(Self + " has " + objectsInTrigger + " objects in trigger.")
	return (objectsInTrigger > 0)
EndFunction

Function PlayUp()
; 	;Debug.Trace(Self + " Playing Up")
	TriggerSound.Play(Self)
	PlayAnimation("Up")
EndFunction

Function PlayDown()
; 	;Debug.Trace(Self + " Playing Down")
	TriggerSound.Play(Self)
	PlayAnimation("Down")
EndFunction




Auto State Inactive
	Event onBeginState()
	EndEvent
	
	Event OnTriggerEnter(objectReference triggerRef)
		OnEnter(triggerRef)
	EndEvent

	Event OnTriggerLeave(objectReference triggerRef)
		OnLeave(triggerRef)
	EndEvent
EndState

State Active
	Event onBeginState()
	EndEvent
	
	Event OnTriggerEnter(objectReference triggerRef)
		OnEnter(triggerRef)
	EndEvent

	Event OnTriggerLeave(objectReference triggerRef)
		OnLeave(triggerRef)
	EndEvent
EndState

