ScriptName FavorOnDeathScript extends ReferenceAlias
{Script to attach to a quest alias that sets a quest stage when the reference is killed}

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

Event OnDeath(Actor akKiller)
	if prereqStageOPT == -1 || GetOwningQuest().getStageDone(prereqStageOPT) == 1
		GetOwningQuest().SetStage(stage)
	EndIf
EndEvent