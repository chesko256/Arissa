ScriptName defaultOnHitChangeAggression extends Actor
{Default script that lives on an actor. On hit, actor's aggression is changed}

import game
import debug

float property fAggression auto
{
By default this property is set to 2 (very aggressive).
0 - Unaggressive - will not initiate combat
1 - Aggressive - will attack enemies on sight
2 - Very Aggressive - Will attack enemies and neutrals on sight
3 - Frenzied - Will attack anyone else
} 
bool doOnce = false 
keyword property linkKeyword auto
{if this has a linkedRef with this keyword, we will activate it once when hit}

auto State waiting
	Event onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		self.setAV("Aggression", fAggression)
		gotoState ("allDone")
		if DoOnce == false
			if (GetLinkedRef(linkKeyword) as objectReference)
				(getLinkedRef(linkKeyword) as objectReference).activate(self)
				DoOnce = TRUE
			endif
		endif
	endEvent
endState

State allDone
	;do nothing
endState
	