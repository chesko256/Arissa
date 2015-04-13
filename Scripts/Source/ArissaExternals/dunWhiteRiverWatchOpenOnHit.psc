scriptName dunWhiteRiverWatchOpenOnHit extends ObjectReference
{ Opens the object when it's struck by an attack. }

Auto State PreActivation
	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if (akAggressor == Game.GetPlayer())
			Self.SetOpen(True);
			gotoState("PostActivation")
		endif
	endEvent
EndState

STATE PostActivation
	;Do nothing
EndState
