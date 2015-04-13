scriptname dragonTowerWallScript extends objectReference

import debug
import utility
import sound

Quest property myQuest auto
int property myQuestStage auto
String property myEvent auto
sound property QSTE3TowerHoleMono auto
sound property QSTE3TowerHoleStereo auto
ObjectReference property mySpellOrigin auto
ObjectReference property mySpellTarget01 auto
Spell property mySpell auto

bool isCasting = false

;************************************

EVENT onLoad()
	registerForAnimationEvent(self, myEvent)
endEVENT

;************************************

EVENT onAnimationEvent(ObjectReference akSource, string asEventName)
	if (asEventName == myEvent)
		myQuest.setStage(myQuestStage)
		KnockAreaEffect(1, 1.5*getLength())
		QSTE3TowerHoleMono.play(self) 
		QSTE3TowerHoleStereo.play(self)
		;need to player spell effect
		;wait(4.75)
		;mySpell.Cast(mySpellOrigin, mySpellTarget01)
	endif
endEVENT

;************************************