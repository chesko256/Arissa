Scriptname CWMission06LoyalistScript extends ReferenceAlias  
{Checks for death and calls function to decrement property on parent quest and set stage if property is zero.}

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if aeCombatState != 0 ; 0 = not in combat, so non-zero means we entered combat
		if GetOwningQuest().GetStage() >= 10
			if GetOwningQuest().GetStageDone(30) == False
				GetOwningQuest().SetStage(30)
			EndIf
		EndIf
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as CWMission06Script).DecrementLoyalistAliveCount()

EndEvent
