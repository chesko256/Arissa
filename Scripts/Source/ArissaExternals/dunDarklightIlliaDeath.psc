Scriptname dunDarklightIlliaDeath extends Actor
;Sets stage upon Illia's death to 35, which fails the objective
;Also set to evaluate package everytime she enters into dialogue

import game
import debug
	
quest Property dunDarklightQST auto



EVENT onDeath(Actor AkKiller)
	if dunDarklightQST.getstage() <=20 && dunDarklightQST.getstage() >=10
		dunDarklightQST.setstage(35)
	endif
endEvent

EVENT onActivate(objectReference triggerRef)
	self.evaluatePackage()
endEvent
