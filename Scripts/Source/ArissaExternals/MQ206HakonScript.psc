Scriptname MQ206HakonScript extends ReferenceAlias  

import game
import debug

int hitCount = 0

auto STATE waitingForAlduin
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if akAggressor == Alias_AncientAlduin.GetRef() && GetOwningQuest().GetStageDone(89)
			hitCount = hitCount + 1
			if hitCount >= 3
				gotoState("hasBeenHit")
				GetOwningQuest().SetStage(87)
			endif
		endif
	endEvent
endSTATE

STATE hasBeenHit
	; this state doesn't do anything
endSTATE

ReferenceAlias Property Alias_AncientAlduin  Auto  


