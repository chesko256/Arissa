Scriptname RiftenJailDoorScript extends ReferenceAlias  Conditional

GlobalVariable Property	pJailPass Auto Conditional
ObjectReference Property pDoor Auto Conditional

Event OnLoad()

	if pJailPass.Value == 0
		if pDoor.GetOpenState() >= 1 && pDoor.GetOpenState() < 3
			pDoor.SetOpen(false)
			pDoor.Lock()
		endif
	elseif pJailPass.Value == 1
		if pDoor.GetOpenState() >= 1 && pDoor.GetOpenState() < 3
			pDoor.SetOpen(false)
		endif
	endif
	
endEvent