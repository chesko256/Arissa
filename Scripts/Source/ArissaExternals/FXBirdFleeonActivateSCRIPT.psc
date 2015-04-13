Scriptname FXBirdFleeonActivateSCRIPT extends ObjectReference  
{when activated, birds fly away}

import debug				; import debug.psc for acces to trace()
import game				; game.psc for access to getPlayer()
import utility			; utility.psc for access to wait()
import sound				; sound.psc for access to play()


sound property BirdFlockSound auto
sound property BirdFlockFleeSound auto

race property giantRace auto

int instanceID00
defaultActivateSelf trigScript

;===============================================

Event onLoad()
	instanceID00 = BirdFlockSound.Play(Self)
endEvent

;===============================================

auto STATE waiting

	Event onBeginState()
		;instanceID00 = BirdFlockSound.Play(Self)
	endEvent
	
	EVENT onActivate(ObjectReference akActionRef)
		;actorBase myBase
		;trigScript = akActionRef as defaultActivateSelf
		;myBase = akActionRef.getBaseObject() as ActorBase
		;if (trigScript.triggerRef).getRace() == giantRace
			goToState ("done")
			Self.PlayAnimation("PlayAnim01")
			int instanceID01 = BirdFlockFleeSound.Play(Self)
			wait (0.5)
			StopInstance(instanceID00) 
		;endif
	ENDEVENT
	
ENDSTATE

;===============================================

STATE done
	;do nothing
ENDSTATE

;===============================================
; 		; debug.trace("DEMO: akActionRef == " + akActionRef)
; 		; debug.trace("DEMO: akActionRef Base == " + akActionRef.getBaseObject())
; 		; debug.trace("DEMO: Race of akActionRef == " + myBase.getRace())