ScriptName defaultOnHitActivateLinkedRef extends Actor
{Default script that lives on an actor. On hit, activate the specified linkedref.}

import game
import debug

bool property doOnce = false  auto
keyword property linkKeyword auto
{if this has a linkedRef with this keyword, we will activate it once when hit}

auto State waiting
	Event onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		(getLinkedRef(linkKeyword) as objectReference).activate(self)
		if (doOnce)
			GoToState("allDone")
		EndIf
	endEvent
endState

State allDone
	;do nothing
endState
	