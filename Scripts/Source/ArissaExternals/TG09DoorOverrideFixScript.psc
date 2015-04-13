Scriptname TG09DoorOverrideFixScript extends ObjectReference  

Quest Property pTG09  Auto  
ObjectReference Property pBlockerDoor  Auto
int Property pTriggered Auto

Event OnTrigger(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			if pTG09.GetStageDone(30) == 1
				pBlockerDoor.PlayAnimation("Open")
				pTriggered = 1
			endif
		endif
	endif

endEvent