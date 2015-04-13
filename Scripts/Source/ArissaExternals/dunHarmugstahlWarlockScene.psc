scriptName dunHarmugstahlWarlockScene extends actor
import Debug
import Utility

;the Quest
quest Property myQuest auto

;objectReference Property dunHarmTrigger auto

objectReference Property player Auto

;Key to drop in pocket
key Property harmKey Auto

event onLoad()
endEvent

event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (akAggressor == player)
		self.StartCombat(Game.GetPlayer())
		myQuest.setstage(50)
	endif
endEvent

event OnDeath(Actor akKiller)
	;Notification("Give Key")
	Self.AddItem(harmKey, 1, True)
	myQuest.setstage(100)
endEvent
 


