Scriptname dunJaphetBossOpenDoorscript extends Actor 
import Debug
import Utility

objectReference Property  portPole1 Auto
objectReference Property  portPole2 Auto
objectReference Property  portPole3 Auto
objectReference Property  portPole4 Auto
objectReference Property  portPole5 Auto
objectReference Property  portPole6 Auto

default2StateActivator pole01
default2StateActivator pole02
default2StateActivator pole03
default2StateActivator pole04
default2StateActivator pole05
default2StateActivator pole06



Event onLoad()
pole01 = portPole1 as default2StateActivator
pole02 = portPole2 as default2StateActivator
pole03 = portPole3 as default2StateActivator
pole04 = portPole4 as default2StateActivator
pole05 = portPole5 as default2StateActivator
pole06 = portPole6 as default2StateActivator
endEvent

Event onDeath(Actor akKiller)
	;Notification("Test")
	pole01.setOpen(TRUE)
	pole02.setOpen(TRUE)
	pole03.setOpen(TRUE)
	pole04.setOpen(TRUE)
	pole05.setOpen(TRUE)
	pole06.setOpen(TRUE)	
endEvent

