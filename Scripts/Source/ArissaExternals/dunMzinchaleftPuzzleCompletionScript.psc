scriptName dunMzinchaleftPuzzleCompletionScript extends ObjectReference
{
Script to drop all portculis poles when player activates valve at the end of the puzzle
}

import game
import debug
import utility

ObjectReference Property steam Auto
formList property poles auto

Default2StateActivator myPole
int i
int n
int total 

;when player activates valve
auto STATE waiting
	EVENT onActivate (objectReference triggerRef)
		steam.enable()
		total = poles.getSize()
; 			debug.trace("poles list has "+total+" members")
 			while i < total
				; get the current poles in the list and close each open pole.  
				myPole = poles.getat(i) as default2StateActivator
				if (myPole.isOpen == false)
					myPole.playAnimation("open")
				endif
				i += 1
			endWhile
			wait(2)
			while n < total
				 ;Disables the pole references after the animation plays so they cannot be activated again. 
				myPole = poles.getat(n) as default2StateActivator
				myPole.disable()
				n += 1
			endWhile
		gotoState("allDone")
	endEvent
endState

State allDone
	;do nothing
endState
	


