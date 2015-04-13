Scriptname MQ304TsunScript extends ReferenceAlias  

float healthPercentTrigger = 0.5

event OnLoad()
	; make him hard to stagger
	GetActorRef().SetActorValue("mass", 100000)
endEvent

event OnUpdate()
	; watch for health to hit 50% 
	if GetActorRef().GetActorValuePercentage("health") < healthPercentTrigger
		GetOwningQuest().SetStage(150)
	endif
endEvent

; put him into fight mode if you attack without speaking to him
Event onHit(objectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if GetOwningQuest().GetStageDone(140) == 0 && GetOwningQuest().GetStageDone(150) == 0
		if akAggressor == Game.GetPlayer() as ObjectReference
; 			debug.trace(self + "OnHit: akSource=" + akSource + " akProjectile=" + akProjectile)
			; if hit with weapon or hostile spell or projectile, Tsun attacks
			Spell mySpell = akSource as Spell
			if mySpell
; 				debug.trace(self + " OnHit by spell=" + mySpell + ", isHostile = " + mySpell.IsHostile())
			endif
			if ( !mySpell && (akProjectile || akSource)) || (mySpell && mySpell.IsHostile())
				GetOwningQuest().SetStage(140)
			endif
		endif
	endif
endEvent
