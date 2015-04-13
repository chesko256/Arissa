ScriptName defaultOnHitSetAVRefAlias extends ReferenceAlias
{Default script that lives on a RefAlias. On hit, sets an actor variable.}

String property actorVariable Auto
int property value Auto
bool property playerOnly Auto

auto State waiting
	Event onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if (!playerOnly || akAggressor == Game.GetPlayer())
			Self.GetActorRef().SetAV(actorVariable, value)
			Self.GetActorRef().EvaluatePackage()
			GoToState("allDone")
		EndIf
	endEvent
endState

State allDone
	;do nothing
endState
	