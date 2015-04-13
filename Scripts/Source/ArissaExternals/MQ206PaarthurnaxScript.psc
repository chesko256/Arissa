Scriptname MQ206PaarthurnaxScript extends ReferenceAlias  

import game
import debug



auto STATE waitingForAlduin
	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;		trace("OnHit in waitingForAlduin")
		if akAggressor == Alias_Alduin.GetRef()
			gotoState("hasBeenHit")
			; Do we need to do anything here?
			GetOwningQuest().SetStage(160)
		endif
	endEvent

endSTATE

STATE hasBeenHit
	; this state doesn't do anything
endSTATE

ReferenceAlias Property Alias_Alduin  Auto  
