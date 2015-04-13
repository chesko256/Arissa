Scriptname MQ103InteriorDefenderScript extends ReferenceAlias  
{script for interior defenders in Korvanjund
advances stage when dead or goes into combat}

int stageToSet = 80

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	; move quest ahead if the ambush is sprung
	GetOwningQuest().setstage(stageToSet )
endEvent

Event OnCombatStateChanged(Actor akTarget,int aeCombatState)
	if aeCombatState != 0 ; 0 = not in combat, so non-0 means we entered combat
		; move quest ahead if the player attacks the enemy soldiers outside Korvanjund
		GetOwningQuest().setstage(stageToSet )
	endIf
endEvent

Event OnDeath(Actor akKiller)
	GetOwningQuest().setstage(stageToSet )
endEvent

