Scriptname MQ103ExteriorDefenderScript extends ReferenceAlias  
{script for exterior defenders in Korvanjund
tracks when all are dead in order to update
correct quest (MQ103A or MQ103B)
}

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	; move quest ahead if the player attacks the enemy soldiers outside Korvanjund
	if akAggressor == Game.GetPlayer()
		GetOwningQuest().setstage(45)
	endif
endEvent

Event OnCombatStateChanged(Actor akTarget,int aeCombatState )
	; move quest ahead if the player attacks the enemy soldiers outside Korvanjund
	if aeCombatState != 0 && akTarget == Game.GetPlayer() ; 0 = not in combat, so non-0 means we entered combat
		GetOwningQuest().setstage(45)
	endif
endEvent

Event OnDeath(Actor akKiller)
	MQ103QuestScript myQuest = GetOwningQuest() as MQ103QuestScript
	myQuest.IncrementDefenderDeadCount(self.getActorRef())
endEvent
