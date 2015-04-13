Scriptname WIKill06ThugScript extends ReferenceAlias  

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if akTarget == Game.GetPlayer() && aeCombatState == 1
		GetOwningQuest().setStage(1)
	
	EndIf

EndEvent

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as WIKill06Script).CheckThugDeath()

EndEvent
