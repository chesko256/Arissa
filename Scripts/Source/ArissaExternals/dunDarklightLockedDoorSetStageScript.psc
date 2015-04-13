scriptName dunDarklightLockedDoorSetStageScript extends ObjectReference
{
- When player unlocks this door by key or lockpicking, set stage to 18
}

import game

quest property dunDarklightQST auto

Event OnOpen(ObjectReference akActionRef)
	dunDarklightQST.setstage(18)
endEvent
