Scriptname TG03DoorUnlockScript extends ObjectReference  
import Debug
import Utility

objectReference Property DoorRef  Auto  
bool doorLocked = true

event onTriggerEnter(objectReference TriggerRef)
	if (TriggerRef == game.getPlayer() && doorLocked ==true)
		DoorRef.Lock(False, True)
		doorLocked = False
	endif
endevent
