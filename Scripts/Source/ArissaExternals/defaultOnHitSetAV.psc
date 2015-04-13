ScriptName defaultOnHitSetAV extends Actor
{Default script that lives on an actor. On hit, sets an actor variable.}

String property actorVariable Auto
int property value Auto
bool property playerOnly Auto

auto State waiting
	Event onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if (!playerOnly || akAggressor == Game.GetPlayer())
; 			;Debug.Trace("HIT: " + Self + " by " + akAggressor)
			Self.SetAV(actorVariable, value)
			Self.EvaluatePackage()
			GoToState("allDone")
		EndIf
	endEvent
endState

State allDone
	;do nothing
endState
	