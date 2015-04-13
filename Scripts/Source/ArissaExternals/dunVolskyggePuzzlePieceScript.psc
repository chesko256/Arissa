scriptName dunVolskyggePuzzlePieceScript extends ObjectReference
{
- This script lives on the puzzle pieces in Volskygge02
- When activated, simply disables it's linked ref and adds item to inventory
}

import debug
import utility

MiscObject property puzzlePiece auto
{puzzle piece taken by player}

ObjectReference myLinkedRef

;*************************************

Event onLoad()
	myLinkedRef = GetLinkedRef()
endEvent

;*************************************

auto State Waiting
	Event onActivate (ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer())
			gotoState ("done")
			disable()
			myLinkedRef.disable()
			game.GetPlayer().AddItem(puzzlePiece, 1)
		endif
	endEvent
endState

;*************************************

State done
	Event onActivate (ObjectReference triggerRef)
		;do nothing
	endEvent
endState

;*************************************

	