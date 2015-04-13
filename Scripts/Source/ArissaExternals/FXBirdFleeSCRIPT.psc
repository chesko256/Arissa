Scriptname FXBirdFleeSCRIPT extends ObjectReference  
{Triggers birds to fly away}

import debug				; import debug.psc for acces to trace()
import game				; game.psc for access to getPlayer()
import utility			; utility.psc for access to wait()
import sound				; sound.psc for access to play()

sound property BirdFlockSound auto
sound property BirdFlockFleeSound auto
bool property PlayerTriggered = false auto
{check if player is only actor that can trigger - Default FALSE}

int instanceID00

;*************************************************

Event onCellAttach()
	instanceID00 = BirdFlockSound.Play(Self)
	gotoState("Waiting")
endEvent

;*************************************************

State Waiting
	Event onTriggerEnter(ObjectReference akActionRef)
		Actor actionRef = akActionRef as Actor
		if(((PlayerTriggered) && (actionRef == game.GetPlayer() as Actor)) || (PlayerTriggered == False))
			gotoState("doNothing")
			Self.PlayAnimation("PlayAnim01")
			int instanceID01 = BirdFlockFleeSound.Play(Self)
			wait (0.5)
			StopInstance(instanceID00)
		endif
	endEvent
endState

;*************************************************

State doNothing
	;do nothing
endState

;*************************************************