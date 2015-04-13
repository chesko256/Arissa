scriptName FXdustDropTrigSCRIPT extends objectReference 
{this Script controls randomized dustfalls} 
;===============================================

import debug				; import debug.psc for acces to trace()
import game				; game.psc for access to getPlayer()
import utility				; utility.psc for access to wait()
import sound				; sound.psc for access to play()

;===============================================
Explosion property FallingDustExplosion01 auto
sound property mySFX auto			; specify SFX to play
int chooser				; random FX choice integer
float rndWaitTimer			; we'll randomize how long we wait between FX
;===============================================

;function playFX(int chooser)
;	if chooser == 1
		; MARK - there's a playgroup forward in your script here but not in the others.  Hur?
;		self.PlayGamebryoAnimation("Forward")
;		weapLg.fire(self, myAmmoMed)
;	elseif chooser == 2
;		self.PlayGamebryoAnimation("Backward")
;		weapMd.fire(self, myAmmoSm)
;	elseif chooser == 3
;		self.PlayGamebryoAnimation("Left")	
;		weapSm.fire(self, myAmmoTiny)
;	endif
;	mySFX.play(self)							; same sound no matter what vizFX we choose. 
;	rndWaitTimer = RandomInt(1,5)
;	wait(rndWaitTimer)							; sit around for 1-5 seconds		
;	gotoState("latent")
;endFunction

;===============================================

auto STATE latent								; by default, just sit still and wait for a trigger event
	EVENT onTriggerENTER(objectReference trigRef)
		if trigRef == getPlayer()
; 			Debug.Trace("Triggered")
			chooser = RandomInt(1,3)		; generate a random number between one and three
			gotoState("active")
			;playFX(chooser)
			
		endif
	endEVENT
endSTATE

;===============================================

STATE active		
		EVENT onBeginState()
								; Been triggered.  Do stuff.
; 			Debug.Trace("Entered active state - picked: " + chooser)
			if chooser == 1
				self.PlayAnimation("PlayAnim01")
				mySFX.play(self)
				wait(0.5)
				placeAtMe(FallingDustExplosion01)
				wait(3.5)
				self.PlayAnimation("PlayAnim02")
			elseif chooser == 2
				self.PlayAnimation("PlayAnim02")
				mySFX.play(self)
			elseif chooser == 3
				self.PlayAnimation("PlayAnim03")		
				mySFX.play(self)
			endif
			gotoState("waiting")

		endEVENT
endSTATE


STATE waiting
		EVENT onBeginState()
			rndWaitTimer = RandomInt(10,30)
; 			Debug.Trace("Entered wating state - waiting for " + rndWaitTimer + " seconds")
			wait(rndWaitTimer)							; sit around for 1-5 seconds		
			gotoState("latent")
; 			Debug.Trace("Should be ready to trigger")
		endEVENT			
endSTATE


