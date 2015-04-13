Scriptname fxDustDropRandomSCRIPT extends ObjectReference  
{Randomly fires the dust drop fx}

import debug				; import debug.psc for acces to trace()
import game				; game.psc for access to getPlayer()
import utility				; utility.psc for access to wait()
import sound				; sound.psc for access to play()


;===============================================
sound property mySFX auto			; specify SFX to play
Explosion property FallingDustExplosion01 auto
int chooser				; random FX choice integer
float rndWaitTimer			; we'll randomize how long we wait between FX
bool on
;===============================================
event onLoad()
	on = true
	while on == true
		chooser = RandomInt(1,3)	
		rndWaitTimer = RandomFloat(10.0, 30.0)
		wait(rndWaitTimer)
			if chooser == 1
				self.PlayAnimation("PlayAnim01")
				mySFX.play(self)
				wait(0.5)
				placeAtMe(FallingDustExplosion01)
				wait(3)
				self.PlayAnimation("PlayAnim02")
			elseif chooser == 2
				self.PlayAnimation("PlayAnim02")
			
				mySFX.play(self)
			elseif chooser == 3
				self.PlayAnimation("PlayAnim03")		
				mySFX.play(self)
			endif
	endWhile		
endEvent

event onUnLoad()
	on = false
endEvent

