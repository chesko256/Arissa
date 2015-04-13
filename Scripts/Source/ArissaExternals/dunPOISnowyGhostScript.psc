Scriptname dunPOISnowyGhostScript extends ObjectReference  

GlobalVariable property gameHour auto

Event OnLoad()
	;Self.RegisterForUpdate(1)
EndEvent

;Event OnUpdate()
	;if (gameHour.getValue() < 20 || gameHour.getValue() > 4)
		;self.disable(true)
	;endif
;endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Self.disable(true)
EndEvent

Event OnUnload()
	self.disable(true)
endEvent



