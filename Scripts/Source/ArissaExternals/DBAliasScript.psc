Scriptname DBAliasScript extends ReferenceAlias  Conditional
{script to update specified quest when actor dies}

Quest Property QuestToUpdate  Auto  
int Property pActorDead  Auto  Conditional
 
Event OnUpdate()

;If the NPC is killed, this block updates the stage in the corresponding Dark Brotherhood contract
if QuestToUpdate.GetStage () == 10
	if pActorDead  == 0
		if GetActorRef().IsDead() == 1
			QuestToUpdate.SetStage (20)
			pActorDead  = 1
		endif
	endif
endif


EndEvent


