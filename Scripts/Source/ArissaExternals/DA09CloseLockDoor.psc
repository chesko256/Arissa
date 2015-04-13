Scriptname DA09CloseLockDoor extends ObjectReference  
import Debug
import Utility

ObjectReference Property door01 Auto
;ObjectReference Property TriggerRef Auto

default2StateActivator door01Script

event OnLoad()
	door01Script = door01 as default2StateActivator
endEvent

event onTriggerEnter(objectreference TriggerRef)
;	Notification("Enter Trigger")
	if (TriggerRef == game.getPlayer())
		int openState = door01.GetOpenState()
		if (openState == 1 || openState == 2)
			door01.Activate(self)
		endif
;		if (door01script.isOpen)
;			Notification("Door")
;			door01script.SetOpen(false)
;		endif
		door01.Lock()
	endif
endEvent
