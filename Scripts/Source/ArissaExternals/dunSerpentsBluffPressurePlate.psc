scriptName dunSerpentsBluffPressurePlate extends TrapTriggerBase
{Pressure plate variant for the Serpent's Bluff altar plate.}

ObjectReference property portcullis Auto
bool busy
bool active
bool isOpen

Event onLoad()
	if objectsInTrigger > 0
		GoToState("Down")
	endif
	active = True
	UpdateLoop()
endevent

Event onUnload()
	active = False
EndEvent

Function UpdateLoop()
	While(active)
; 		;Debug.Trace("Serpent Plate: " + (portcullis As NorPortcullisSCRIPT).GetState() + " " + objectsInTrigger)
		if ((portcullis As NorPortcullisSCRIPT).GetState() == "downPosition" && objectsInTrigger == 0)
			PlayAnimation("Up")
			portcullis.Activate(Self)
		ElseIf ((portcullis As NorPortcullisSCRIPT).GetState() == "upPosition" && objectsInTrigger > 0)
			PlayAnimation("Down")
			portcullis.Activate(Self)
		EndIf
		Utility.Wait(1)
	EndWhile
EndFunction

auto State Up
	Event OnTriggerEnter(objectReference triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	EndEvent
	
	Event OnTriggerLeave(objectReference triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	EndEvent
EndState

State Down

	Event OnTriggerEnter(objectReference triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	EndEvent
	
	Event OnTriggerLeave(objectReference triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	EndEvent
EndState