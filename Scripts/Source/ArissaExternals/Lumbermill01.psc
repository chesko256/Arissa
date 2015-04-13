scriptName  Lumbermill01 extends ObjectReference

;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;THIS SCRIPT IS OBSOLETE... SEE ResourceObjectScript.psc... THIS SCRIPT SHOULD BE DELETED -- jduvall
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

import Debug

objectReference property Log Auto
ObjectReference property Sash Auto
ObjectReference property Saw Auto


 Event OnInit()
	playAnimation("PulledPosition")
endEvent

auto STATE Normal
      EVENT onActivate ( objectReference triggerRef )
	playAnimation("PullUp")
	Saw.playAnimation("activate")
	Sash.playAnimation("activate")
	log.playAnimationAndWait("activate", "Havok")
	Log.DamageObject(100.0)
	EndEvent
 endState

STATE Sabotage
      EVENT onActivate ( objectReference triggerRef )
	playAnimation("FullPush")
	Saw.playAnimation("jam")
	Sash.playAnimation("jam")
	log.playAnimationAndWait("jam", "Destroyed")
	Log.DamageObject(50.0)
	Sash.DamageObject(100.0)
	endEvent
 endState
 