scriptName dunDarklightLeverScript extends ObjectReference
{
- Script intented to kill witch before first scene with Illia in Darklight Tower
- This script is for player trigger only
- This script only fires once
}

import game
import actor
           
quest property dunDarklightQST auto
ObjectReference myLinkedRef


Event onActivate(ObjectReference triggerRef)
	myLinkedRef = GetLinkedRef() as ObjectReference
	myLinkedRef.disable()
	utility.wait(1)
	dunDarklightQST.setstage(14)
endEvent

State done
; This is the end state, player should not be able to reactivate
endState
