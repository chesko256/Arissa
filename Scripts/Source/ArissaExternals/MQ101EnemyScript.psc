Scriptname MQ101EnemyScript extends ReferenceAlias  
{tracks dead count}

int Property onDeathStage  Auto  
{stage to set OnDeath
}

int Property onHitStage  Auto  
{stage to set if hit by player }

int Property onCombatStage  Auto  
{stage to set if entering combat with player }

int Property prereqStage Auto
{ stage that needs to be set before death stage is triggered (needed for respawning guys)}

int Property myFactionPath = 1 Auto
{ which faction path do we count my death? }

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	If akTarget == Game.GetPlayer()
		if onCombatStage > 0 && (prereqStage == 0 || GetOwningQuest().GetStageDone(prereqStage) ) && (myFactionPath == 0 || myFactionPath ==(GetOwningQuest() as MQ101QuestScript).FactionPath)
			GetOwningQuest().setStage(onCombatStage )
		endif
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
	if OnDeathStage > 0 && (prereqStage == 0 || GetOwningQuest().GetStageDone(prereqStage) ) && (myFactionPath == 0 || myFactionPath ==(GetOwningQuest() as MQ101QuestScript).FactionPath)
		(GetOwningQuest() as MQ101QuestScript).SetStageOnDeadCount(onDeathStage)
	endif
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if onHitStage > 0 && (prereqStage == 0 || GetOwningQuest().GetStageDone(prereqStage) ) && (myFactionPath == 0 || myFactionPath ==(GetOwningQuest() as MQ101QuestScript).FactionPath)
		GetOwningQuest().setStage(onHitStage)
	endif
endEvent
