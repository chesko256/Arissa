scriptName dunForsakenCaveMS12Script extends ObjectReference
{
Script to enable effect on gate with the intent of calling attention to it
}

import game
import debug
import utility

ObjectReference Property liquid Auto
ObjectReference Property glow Auto
ObjectReference Property secretDoor Auto

MiscObject Property MS12Potion Auto


;when player activates button
auto STATE waiting
	EVENT onActivate (objectReference triggerRef)
		if (game.getPlayer().getItemCount(MS12Potion)==1)
			game.getplayer().removeitem(MS12Potion)
			liquid.enable(true)
			glow.enable(true)
			wait(1)
			secretDoor.activate(self)
			gotoState("allDone")
		endif
	endEvent
endState

State allDone
	;do nothing
endState
	


