Scriptname MQ303Script extends Quest  Conditional

int playerLevel

function DamageBoss(Actor pBoss)
	;playerLevel = game.GetPlayer().GetLevel()
	if playerLevel < 10
		playerLevel = 10
	endif
	if playerLevel < 20
	; damage the boss to make a fairer fight
; 		debug.trace(self + " playerLevel = " + playerLevel )
		float damage = pBoss.GetActorValue("health")
; 		debug.trace(self + " starting boss health = " + damage )
		float percent = (20.0 - playerLevel)/20.0 as float
; 		debug.trace(self + " percent = " + percent )
		damage = damage * percent
; 		debug.trace(self + " damage = " + damage )
		pBoss.DamageAV("health", damage)
; 		debug.trace(self + " final boss health = " + pBoss.GetAV("health") )
	endif
endFunction
