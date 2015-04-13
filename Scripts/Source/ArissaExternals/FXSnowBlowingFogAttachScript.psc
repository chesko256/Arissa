Scriptname FXSnowBlowingFogAttachScript extends ObjectReference  
{Attaches a blowing fog to the camera when in the trigger box.}


;===============================================

import debug				; import debug.psc for acces to trace()
import game				; game.psc for access to getPlayer()
import utility				; utility.psc for access to wait()
import sound				; sound.psc for access to play()

VisualEffect Property FogEffectArt Auto ;Art to attach to camera
;sound property mySFX auto         ; specify sound fx to play
ImageSpaceModifier Property TestCrossfadeISM Auto
;sound property TestLoopSound auto

;===============================================


auto STATE waiting

	EVENT ONTRIGGERENTER(ObjectReference akActionRef)
		IF (akActionRef == getPlayer() as ObjectReference)
			goToState ("Fogged")
		ENDIF
	ENDEVENT
	
ENDSTATE

STATE Fogged

	Event onBeginState()
		FogEffectArt.Play(GetPlayer(), -1)
		TestCrossfadeISM.ApplyCrossFade(5)
		;int instanceID = TestLoopSound.Play(Self)

		;wait (27)

		goToState ("reset")
	endEvent

ENDSTATE

STATE reset
	EVENT OnTriggerLeave(ObjectReference akActionRef)
		IF (akActionRef == getPlayer() as ObjectReference)
			;StopInstance(instanceID)
			FogEffectArt.Stop(GetPlayer())
			ImageSpaceModifier.RemoveCrossFade(10)
			goToState ("waiting")
		ENDIF
	ENDEVENT
	
	;EVENT onBeginState()
	;	goToState ("waiting")
	;ENDEVENT
			
ENDSTATE