scriptName dunShroudHearthCloseAndDisableRefs extends ObjectReference
{ Closes, then swaps each of two doors with a partner in the same location. Allows the originally open and unlocked doors to be swapped for locked versions.}

ObjectReference Property Door1a Auto
ObjectReference Property Door2a Auto
ObjectReference Property Door1b Auto
ObjectReference Property Door2b Auto

Function CloseAndDisable(ObjectReference DoorX, ObjectReference DoorY)
	DoorX.SetOpen(False)
	While(DoorX.GetOpenState() != 3)
		Utility.Wait(0.5)
	EndWhile
	DoorY.Enable(False)
	Utility.Wait(0.1)
	DoorX.Disable(False)
EndFunction	
	
Auto State PreActivation
	Event OnActivate(ObjectReference triggerRef)
		CloseAndDisable(Door1a, Door1b)
		CloseAndDisable(Door2a, Door2b)
		gotoState("PostActivation")
	EndEvent
EndState

STATE PostActivation
	;Do nothing
EndState
