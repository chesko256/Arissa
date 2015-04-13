scriptname dunMzulftKeyPickedUp extends objectReference

import Debug

objectReference Property DoorRef Auto
objectReference Property EnableMarker Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if (akNewContainer == game.getplayer())
			int DoorOpenState = DoorRef.GetOpenState()
			;Notification (DoorOpenState)
			if (DoorOpenState == 1)
				DoorRef.setOpen(FALSE)
			endif
			EnableMarker.Enable()
		endif
endEvent

