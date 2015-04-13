scriptName dunMzinchaleftGateAttentionScript extends ObjectReference
{
Script to enable effect on gate with the intent of calling attention to it
}

import game
import debug
import utility

ObjectReference Property steam01 Auto
ObjectReference Property steam02 Auto
ObjectReference Property light01 Auto
ObjectReference Property light02 Auto
;ObjectReference Property soundSpot Auto
;sound Property gateSound Auto

;when player activates button
auto STATE waiting
	EVENT onActivate (objectReference triggerRef)
		Steam01.enable()
		Steam02.enable()
		wait(1)
		Light01.enable(true)
		Light02.enable(true)
		;gateSound.playAndWait(soundSpot)
		activate(self)
		wait(5)	
		Steam01.disable(true)
		Steam02.disable(true)
		gotoState("allDone")
	endEvent
endState

State allDone
	;do nothing
endState
	


