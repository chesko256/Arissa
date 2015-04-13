ScriptName DragonPriestAmbushScript extends Actor
{Script takes care of removing and adding the outfit that has the FX so they don't go through the sarcophagus}

import game
import utility
import debug

armor property mySkin auto
VisualEffect Property DragonPriestParticlesFX Auto

bool doOnce = false

;**********************************************

auto State waiting
	
	Event onLoad()
		if(doOnce == false)
			wait(1)
	;		self.unequipitem(mySkin)
			DragonPriestParticlesFX.Stop(self)
			doOnce = true
		endif
	endEvent
	
	Event onGetUp(ObjectReference myFurniture)
		gotoState("done")
		;self.equipitem(mySkin)
		DragonPriestParticlesFX.Play(self, -1)
	endEvent
	
endState

;**********************************************

State allDone
	;do nothing

endState
	
;**********************************************