scriptname defaultStopSceneOnHit extends ReferenceAlias

Scene property sceneToStop Auto
bool property playerOnly Auto

Event onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (!playerOnly || akAggressor == Game.GetPlayer())
		sceneToStop.Stop()
	EndIf
EndEvent