scriptName dunHarmugstahlSpiderDead extends Actor
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

Event onGrab()
	if (spellFired < 1)
		wait(0.5)
		selfSpiderSpell.Cast(Self,Self)
		;Notification("FIRE!")
		spellFired = spellFired+1
		;Removed the Magic Effect
		;wait(5.0)
		;Self.RemoveSpell(selfSpiderSpell)
		;Notification("REMOVED!")
	endif
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (spellFired < 1)
		selfSpiderSpell.Cast(Self,Self)
		;Notification("FIRE!")
		spellFired = spellFired+1
		;Removed the Magic Effect
		;wait(5.0)
		;Self.RemoveSpell(selfSpiderSpell)
		;Notification("REMOVED!")
	endif
endEvent

Event OnActivate(ObjectReference akActionRef)
if (spellFired < 1)
		selfSpiderSpell.Cast(Self,Self)
		;Notification("FIRE!")
		spellFired = spellFired+1
		;Removed the Magic Effect
		;wait(5.0)
		;Self.RemoveSpell(selfSpiderSpell)
		;Notification("REMOVED!")
	endif
endEvent
