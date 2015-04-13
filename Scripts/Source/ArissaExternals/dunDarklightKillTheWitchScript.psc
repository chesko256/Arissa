scriptName dunDarklightKillTheWitchScript extends ObjectReference
{
- Script intented to kill witch before first scene with Illia in Darklight Tower
- This script is for player trigger only
- This script only fires once
}

import game
import actor

objectReference property Killer auto
objectReference property Witch auto


Event onTriggerEnter(ObjectReference triggerRef)
	if (triggerRef == (Game.GetPlayer() as ObjectReference))
		if witch as actor
			(Witch as Actor).kill(Killer as Actor)
		else
; 			debug.Trace(self + " could not kill witch because it is not an actor")
		endif
		(Killer as Actor).evaluatePackage()
	endif
endEvent
