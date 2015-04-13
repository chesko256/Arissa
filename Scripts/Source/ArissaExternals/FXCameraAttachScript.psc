Scriptname FXCameraAttachScript extends ObjectReference  
{Attaches a camera attach fx based on the property set in the reference. Also has a slot to fade in an image space at the same time.}
;===============================================

import debug				; import debug.psc for acces to trace()
import game				; game.psc for access to getPlayer()
import utility			; utility.psc for access to wait()
import sound				; sound.psc for access to play()

VisualEffect Property CameraAttachFX Auto 
{Particle art to attach to camera, fog by default}
VisualEffect Property CameraAttachFX2 Auto 
{2nd Particle art to attach to camera, not used by default}
sound property LoopSound auto
{specify sound fx to play, set on reference, none by default}
;ImageSpaceModifier Property CrossfadeableISM Auto
;{specify crossfaded imagespace to play, set on reference, none by default}
int instanceID ;used to store sound ref
int Property timeLimit = 180 Auto


;===============================================

	EVENT ONTRIGGERENTER(ObjectReference akActionRef)
	IF (akActionRef == getPlayer() as ObjectReference);new
		CameraAttachFX.Play(GetPlayer(), timeLimit)
; ;		debug.trace("Triggered by player")
		if (CameraAttachFX2)
			CameraAttachFX2.Play(GetPlayer(), timeLimit)
		endif
		;if (CrossfadeableISM)
		;	CrossfadeableISM.ApplyCrossFade(2)
		;endif
		if (LoopSound)
			instanceID = LoopSound.Play(Self)
		endif
		;wait (27)
	endif ;new
		;goToState ("reset")
	endEvent

	EVENT OnTriggerLeave(ObjectReference akActionRef)
		IF (akActionRef == getPlayer() as ObjectReference)
			CameraAttachFX.Stop(GetPlayer())
			if (CameraAttachFX2)
				CameraAttachFX2.Stop(GetPlayer())
			endif
			;if (CrossfadeableISM)
			;	ImageSpaceModifier.RemoveCrossFade(3)
			;endif
			if (LoopSound)
				StopInstance(instanceID)
			endif
			goToState ("waiting")
		ENDIF
	ENDEVENT
	
		EVENT OnUnLoad()
			CameraAttachFX.Stop(GetPlayer())
			if (CameraAttachFX2)
				CameraAttachFX2.Stop(GetPlayer())
			endif
			;if (CrossfadeableISM)
			;	ImageSpaceModifier.RemoveCrossFade(3)
			;endif
			if (LoopSound)
				StopInstance(instanceID)
			endif
			goToState ("waiting")
	ENDEVENT
	
	