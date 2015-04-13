scriptName db07SanctuaryGuardianEnableScript extends ObjectReference
{
- This script enables the linked actor only if the player is in the proper stage of db07
- This script is for player trigger only
- This script only fires once
}
import game
import utility

ObjectReference myLinkedRef
quest property db07 auto

Event onTriggerEnter(ObjectReference triggerRef)
	myLinkedRef = GetLinkedRef() as ObjectReference
	if (triggerRef == (Game.GetPlayer() as ObjectReference)) && (db07.getstage()==40)
		myLinkedRef.enable(true)
		self.disable()	
	endif
endEvent
