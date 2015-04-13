Scriptname LumbermillSawScript extends ObjectReference  

;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;THIS SCRIPT IS OBSOLETE... SEE ResourceObjectScript.psc... THIS SCRIPT SHOULD BE DELETED -- jduvall
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

{script for destructible lumbermill object
when other resource objects are done,
we might be able to extend this script
}

import game
import utility
import debug


objectReference property Log Auto
ObjectReference property Sash Auto
Message property SabatogeMessage Auto
Message property RepairMessage Auto


auto STATE normal
	EVENT onActivate ( objectReference triggerRef )
		if triggerRef == GetPlayer()
			if SabatogeMessage.Show() == 1
				; sabatoge the mill
				gotoState("busy")
				Destroy()
				gotoState("destroyed")
			endif
		else
			; assume lever script just activating me normally
			trace(self + "activated by lever")
			gotoState("busy")
			Saw()
			gotoState("normal")
		endif
	endEvent
EndState

STATE busy
endState

STATE destroyed
	EVENT onActivate ( objectReference triggerRef )
		if triggerRef == GetPlayer()
			if RepairMessage.Show() == 1
				; repair the mill
				gotoState("busy")
				Repair()
				gotoState("normal")
			endif
		endif
	endEvent
endState


function Destroy()
	playAnimation("jam")
	Sash.playAnimation("jam")
	log.playAnimationAndWait("jam", "Destroyed")
	Log.DamageObject(50.0)
	Sash.DamageObject(100.0)
 endFunction

function Repair()
	playAnimation("repair")
	Sash.playAnimation("repair")
	log.playAnimation("repair")
	Log.ClearDestruction()
	Sash.ClearDestruction()
endFunction
 
function Saw()
	playAnimation("activate")
	Sash.playAnimation("activate")
	log.playAnimationAndWait("activate", "Havok")
	Log.DamageObject(100.0)
	; for now, just reset so the sabatoge can still work
	Repair()
 endFunction
 