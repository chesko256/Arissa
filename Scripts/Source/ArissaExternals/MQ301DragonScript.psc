Scriptname MQ301DragonScript extends ReferenceAlias  Conditional

Event OnCombatStateChanged(Actor akTarget,int aeCombatState )
	if GetOwningQuest().GetStage() < 200
		if aeCombatState != 0 && akTarget == Game.GetPlayer() ; 0 = not in combat, so non-0 means we entered combat
			(GetOwningQuest() as MQ301Script).AdvanceDragonAttackScene(3)
		endif
	endif
endEvent
