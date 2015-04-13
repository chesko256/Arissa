Scriptname DA11OpenDooronDeath extends ObjectReference  
import debug
import utility

ObjectReference Property Door01  Auto  

default2StateActivator door01Script
string property startOpenAnim = "startopen" auto

event OnLoad()
	door01Script = door01 as default2StateActivator
	door01script.SetOpen(False)
endEvent

Event OnDeath(Actor akKiller)

		;notification("OpenDoor")
		trace(self + "OnLoad: playanimation(" + startOpenAnim + ")")
		door01.playAnimation(startOpenAnim)		
		
endEvent


