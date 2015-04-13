scriptName defaultBiPressurePlate extends TrapTriggerBase

bool busy
float property TargetDelay Auto

Event onLoad()
	if objectsInTrigger > 0
		GoToState("Down")
	endif
endevent

auto State Up
	Event onBeginState()
		busy = True
		PlayAnimation("Up")
		activate(self)
		Utility.Wait(TargetDelay)
; 		;Debug.Trace("TargetDelay " + TargetDelay + " is up.")
; 		;Debug.Trace("BiPressurePlate UpBeginState: " + objectsInTrigger)
		if objectsInTrigger > 0
			GoToState("Down")
		EndIf
		busy = False
	EndEvent
	
	Event OnTriggerEnter(objectReference triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
; 		;Debug.Trace("BiPressurePlate TriggerEnter: " + objectsInTrigger)
		if (!busy)
			GoToState("Down")
		EndIf
	EndEvent
	
	Event OnTriggerLeave(objectReference triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	EndEvent
EndState

State Down
	Event onBeginState()
		busy = True
		PlayAnimation("Down")
		activate(self)
		Utility.Wait(TargetDelay)
; 		;Debug.Trace("TargetDelay " + TargetDelay + " is up.")
; 		;Debug.Trace("BiPressurePlate DownBeginState: " + objectsInTrigger)
		if objectsInTrigger == 0
			GoToState("Up")
		EndIf
		busy = False
	EndEvent
	
	Event OnTriggerEnter(objectReference triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
; 		;Debug.Trace("BiPressurePlate: " + objectsInTrigger)
	EndEvent
	
	Event OnTriggerLeave(objectReference triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
; 		;Debug.Trace("BiPressurePlate TriggerLeave: " + objectsInTrigger)
		While (busy && objectsInTrigger == 0)
; 			Debug.Trace("While loop")
			Utility.Wait(0.25)
		EndWhile
		if (!busy && objectsInTrigger == 0)
			GoToState("Up")
		EndIf
	EndEvent
EndState