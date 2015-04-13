Scriptname FXmothScaredSCRIPT extends ObjectReference  
{This script handles a moth that sit until scared by the player entering a triggerbox}

;===============================================

import debug				; import debug.psc for acces to trace()
import game				; game.psc for access to getPlayer()
import utility				; utility.psc for access to wait()
import sound				; sound.psc for access to play()

;===============================================





auto STATE waiting

	EVENT ONTRIGGERENTER(ObjectReference akActionRef)
		IF (akActionRef == getPlayer() as ObjectReference)
			goToState ("flying")
		ENDIF
	ENDEVENT
	
ENDSTATE

STATE flying

	Event onBeginState()
		playAnimationAndWait("MothTakeoff", "End")
		goToState ("reset")
	endEvent

ENDSTATE

STATE reset

	EVENT onBeginState()
		goToState ("waiting")
	ENDEVENT
			
ENDSTATE
