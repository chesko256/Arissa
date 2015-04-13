ScriptName dunShimmermistFalmerBossScript extends Actor
{}

import game
import debug
import utility

ObjectReference Property centurion auto
;spell Property lightSpell auto


auto State Waiting
Event onHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if(self.getActorValuePercentage("health") < 0.75) 
			;lightSpell.cast(self,centurion)
			wait(1)
			;centurion.Activate(self)
			gotoState("allDone")
		endif
EndEvent
EndState

State allDone
EndState


	