ScriptName dunVolskyggePuzzleDoorControl extends objectReference
{This script will open/close the two doors in volskygge based on distance and whether or not the puzzle is solved}

import game
import debug

ObjectReference property myDoor01 auto
ObjectReference property myDoor02 auto
dunVolskyggePuzzleButtonControl property myControl auto


;************************************

Event onCellLoad()
	if(!mycontrol.puzzleSolved)
		;puzzle has not been solved
		if(game.getPlayer().GetDistance(myDoor01) < game.getPlayer().GetDistance(myDoor02))
			;myDoor01 is closest to the player, so keep open and shut the other
			myDoor01.setOpen(true)
			myDoor02.setOpen(false)
		else
			myDoor01.setOpen(false)
			myDoor02.setOpen(true)
		endif
	endif

endEvent

;************************************