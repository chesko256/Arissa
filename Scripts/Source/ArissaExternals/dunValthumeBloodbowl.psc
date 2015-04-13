scriptName dunValthumeBloodbowl extends ObjectReference
{
Controller script for events when player reaches boss chamber in Valthume
}

import game
import debug
import utility

int property itemplaced auto hidden

objectReference Property controllerScript auto
objectReference Property fxBloodbowl auto
dunValthumeControllerScript mainScript

EVENT onInit ()
	mainScript = controllerScript as dunValthumeControllerScript
	;mainscript.itemplaced==0 
endevent



;when player activates urn
EVENT onActivate (objectReference triggerRef)
	mainScript = controllerScript as dunValthumeControllerScript
	if mainscript.dunValthumeQST.getstage() == 15
			fxBloodbowl.Activate(self)
			wait(1)
			game.getplayer().removeitem(mainScript.Eyes)
			game.getplayer().removeitem(mainScript.Heart)
			game.getplayer().removeitem(mainScript.Brain)
			gotoState("allDone")
	endif 
endEvent

State allDone
	;do nothing
endState
	


