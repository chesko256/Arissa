Scriptname dunFallowstoneCaveTrig01 extends ObjectReference  
{Trigger to start the guidance for the ai}

import game

bool playerHasEntered = FALSE		;boolean for tracking the player
bool YamarzHasEntered = FALSE		;boolean for tracking yamarz
objectReference property YamarzRef auto	;Yamarz, must be set in editor
quest property myQuest auto
int property stage auto

auto state waitingForTrigger

	event onTriggerEnter(objectReference TriggerRef)
		if TriggerRef == getPlayer() as actor
			playerHasEntered = TRUE
		endif
	
		if TriggerRef == YamarzRef
			YamarzHasEntered = TRUE
		endif
		
		if playerHasEntered && YamarzHasEntered
			myQuest.setstage(stage)
			gotostate("hasTriggered")
		endif
	endEvent

endstate

state hasTriggered

endstate