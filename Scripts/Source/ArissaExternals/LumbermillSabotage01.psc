scriptName  LumbermillSabotage01 extends ObjectReference

;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;THIS SCRIPT IS OBSOLETE... SEE ResourceObjectScript.psc... THIS SCRIPT SHOULD BE DELETED -- jduvall
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

import Debug

objectReference property Log Auto
ObjectReference property Sash Auto


auto STATE Sabotage
      EVENT onActivate ( objectReference triggerRef )
		playAnimation("jam")
		Sash.playAnimation("jam")
		log.playAnimationAndWait("jam", "Destroyed")
		Log.DamageObject(50.0)
		Sash.DamageObject(100.0)
	endEvent
 endState
 