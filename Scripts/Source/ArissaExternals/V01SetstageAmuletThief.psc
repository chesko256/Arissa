Scriptname V01SetstageAmuletThief extends ReferenceAlias  
{V01 quest stage update}


int property stage auto
{ stage to set}

int property prereqStageOPT auto
{ OPTIONAL: stage that must be set for this trigger to fire }

int property stage2 auto
{ Second stage to set}

int property prereqStage2OPT auto
{ OPTIONAL: Second stage that must be set for this trigger to fire }

Event OnDeath(Actor akKiller)
		if GetOwningQuest().getStageDone(prereqStageOPT) == 1
				GetOwningQuest().setStage(stage)
				gotoState("hasBeenTriggered")
		endif
		if GetOwningQuest().getStageDone(prereqStage2OPT) == 1
				GetOwningQuest().setStage(stage2)
				gotoState("hasBeenTriggered")
		endif
endEvent



