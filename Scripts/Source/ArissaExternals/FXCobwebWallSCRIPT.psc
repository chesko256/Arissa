Scriptname FXCobwebWallSCRIPT extends ObjectReference  
{Plays animation when player walks through cobweb wall.}


;===============================================

import debug				; import debug.psc for acces to trace()
import game				; game.psc for access to getPlayer()
import utility			; utility.psc for access to wait()
import sound				; sound.psc for access to play()



;ImageSpaceModifier Property TestCrossfadeISM Auto
;sound property TestLoopSound auto

;===============================================


auto STATE startAnim

	Event onBeginState()
		PlayGamebryoAnimation("Backward", true, 1)
		goToState ("waiting")
	endEvent
	
ENDSTATE

STATE waiting

	EVENT ONTRIGGERENTER(ObjectReference akActionRef)
		IF (akActionRef == getPlayer() as ObjectReference)
			goToState ("broken")
		ENDIF
	ENDEVENT
	
ENDSTATE

STATE broken

	Event onBeginState()
		Self.PlayGamebryoAnimation("Backward", 1)
		;FogEffectArt.Play(GetPlayer(), 30)
		;TestCrossfadeISM.ApplyCrossFade(10)
		;int instanceID = TestLoopSound.Play(Self)

		;wait (27)

		goToState ("done")
	endEvent

ENDSTATE

STATE done

			
ENDSTATE