Scriptname MQ101BearScript extends ReferenceAlias  

int Property deathStage = 750 Auto  
{stage to set onDeath}

int Property combatStage =730 Auto  
{stage to set onCombatStart}

int Property prereqStage = 500 Auto


Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if aeCombatState != 0 ; 0 = not in combat, so non-zero means entered combat
		if GetOwningQuest().GetStageDone(prereqStage)
			GetOwningQuest().SetStage(combatStage)
		endif
	endif
endEvent

Event OnDeath(Actor akKiller)
	if GetOwningQuest().GetStageDone(prereqStage)
		GetOwningQuest().SetStage(deathStage)
	endif
endEvent

