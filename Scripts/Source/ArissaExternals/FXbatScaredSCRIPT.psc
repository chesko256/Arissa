Scriptname FXbatScaredSCRIPT extends ObjectReference  
{Runs the bats animations when trigger box is entered.}


;===============================================

import debug				; import debug.psc for acces to trace()
import utility			; utility.psc for access to wait()

sound property mySFX auto         ; specify sound fx to play
weapon property weapLg auto		; specify large weapon type
ammo property myAmmo auto			; specify ammo type

float rndWaitTimer

;===============================================


auto STATE waiting
	Event onTriggerEnter(ObjectReference akActionRef)
		if (akActionRef == game.getPlayer() as ObjectReference)
			;go to an empty state while we take care of the FX
			gotoState("busy")
			
			;take care of FX
			mySFX.play(self)
			weapLg.fire(self, myAmmo)
			playAnimationAndWait("MothTakeoff", "End")
			
			;now wait
			wait(RandomInt(20,30))
			
			;done waiting, now get out of the "busy" state and back to "waiting" state
			goToState ("waiting")
		endif
	endEvent
endState

;===============================================

State busy
	;do nothing
EndState
