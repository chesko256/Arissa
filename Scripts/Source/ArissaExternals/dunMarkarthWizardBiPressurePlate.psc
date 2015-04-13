scriptName dunMarkarthWizardBiPressurePlate extends TrapTriggerBase
{Bi-directional pressure plate that activates both on press and release.}

bool busy
Message property failMessage Auto

Event onLoad()
	if objectsInTrigger > 0
		GoToState("Down")
	endif
endevent

auto State Up
	Event onBeginState()
		busy = True
		PlayAnimation("Up")
		Utility.Wait(1.25)
		activate(self)
; 		Debug.Trace("Plate " + Self + " Up")
		if objectsInTrigger > 0
			GoToState("Down")
		EndIf
		busy = False
	EndEvent
	
	Event OnTriggerEnter(objectReference triggerRef)
		if ((triggerRef as Actor) != None)
			objectsInTrigger = self.GetTriggerObjectCount()
			if (!busy)
				GoToState("Down")
			EndIf
		Else
			failMessage.Show()
		EndIf
	EndEvent
	
	Event OnTriggerLeave(objectReference triggerRef)
		if (triggerRef == Game.GetPlayer())
			objectsInTrigger = self.GetTriggerObjectCount()
		EndIf
	EndEvent
EndState

State Down
	Event onBeginState()
		busy = True
		PlayAnimation("Down")
		Utility.Wait(1.25)
; 		Debug.Trace("Plate " + Self + " Down")
		activate(self)
		if objectsInTrigger == 0
			GoToState("Up")
		EndIf
		busy = False
	EndEvent
	
	Event OnTriggerEnter(objectReference triggerRef)
		if (triggerRef == Game.GetPlayer())
			objectsInTrigger = self.GetTriggerObjectCount()
		EndIf
	EndEvent
	
	Event OnTriggerLeave(objectReference triggerRef)
		if (triggerRef == Game.GetPlayer())
			objectsInTrigger = self.GetTriggerObjectCount()
			if (!busy && objectsInTrigger == 0)
				GoToState("Up")
			EndIf
		EndIf
	EndEvent
EndState