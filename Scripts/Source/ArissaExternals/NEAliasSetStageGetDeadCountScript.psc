Scriptname NEAliasSetStageGetDeadCountScript extends ReferenceAlias  
{Set the stage to "StageToSet" if the base actor dead count is >= "DeadNPCCount"}

int Property DeadNPCCount Auto  
{REQUIRED -- how many NPCs need to die to trigger quest update?}
int Property StageToSet Auto
{REQUIRED -- what stage should it set the quest to?}

Event OnDeath(Actor akKiller)
	if GetActorRef().GetActorBase().GetDeadCount() >= DeadNPCCount
		GetOwningQuest().SetStage(StageToSet)
	endif

endEvent