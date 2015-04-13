scriptName dunHarmugstahlSpider extends Actor
{ Fire Spiders of Harmugstahl }
import Debug
import Utility 
;VFX
;Activator property SummonFX Auto
Spell property selfSpiderSpell Auto

;internal Variables
int spellFired 

;ObjectReference property player Auto

Event onLoad()
	spellFired = 0
endEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if (aeCombatState != 0) && (spellFired < 1) ; 0 = not in combat, so non-zero means we entered combat
		spellFired = spellFired + 1
		wait(1.0)
		selfSpiderSpell.Cast(Self,Self)
	endif
endEvent

Event OnDeath(Actor akKiller)
	wait(1.0)
	self.removeSpell(selfSpiderSpell)
endEvent