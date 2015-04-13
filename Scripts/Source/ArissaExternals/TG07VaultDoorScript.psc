Scriptname TG07VaultDoorScript extends ObjectReference  Conditional

int Property pTG07Open  Auto  Conditional
ObjectReference Property pTG07TempVaultDoor  Auto  Conditional
ObjectReference Property pTG07Lock  Auto  Conditional
Quest Property pTG07Quest  Auto  Conditional
Message Property pTG07VaultDoorMessage  Auto  Conditional

event onActivate (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG07Open == 0
			pTG07VaultDoorMessage.Show()
			pTG07TempVaultDoor.Disable()
			pTG07Lock.Disable()
			pTG07Open = 1
		endif
	endif

endevent

