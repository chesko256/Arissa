scriptName FXdustDropOnActivateSCRIPT extends objectReference 
{this Script plays three dust falling animations when triggered} 
;===============================================

import debug				; import debug.psc for acces to trace()
import utility				; utility.psc for access to wait()
import sound				; sound.psc for access to play()

;===============================================
Explosion property FallingDustExplosion01 auto
sound property mySFX auto			; specify SFX to play

;*********************************

auto State waiting
	Event onActivate(objectReference triggerRef)
; 		debug.trace(self + " activated")
		;;Actor actorRef = triggerRef as Actor
		;if(actorRef == game.getPlayer())
			;player has entered trigger
			gotoState("done")
			self.PlayAnimation("PlayAnim01")
			mySFX.play(self)
			wait(0.3)
			placeAtMe(FallingDustExplosion01)
			wait(3.0)
			self.PlayAnimation("PlayAnim02")
			mySFX.play(self)
			wait(3.3)
			self.PlayAnimation("PlayAnim03")
			mySFX.play(self)
		;endif
	endEvent
endSTATE

;*********************************

State done
	;do nothing
endState

;*********************************
