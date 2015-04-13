Scriptname questAliasUtilitySCRIPT extends ReferenceAlias  
{A basic script that can be thrown onto Alias Refs to progress and complete quests easily.}

QUEST PROPERTY questName AUTO
{the quest we're updating}

BOOL PROPERTY questComplete AUTO
{whether or not to complete it}

INT PROPERTY questStage AUTO
{the stage we're updating to}

INT PROPERTY preReqQuestStage AUTO
{only perform the action if we're on this stage, set to 0 if you dont care}

EVENT onACTIVATE(objectReference ref)
	
	IF(ref AS ACTOR == game.getPlayer())
		
		IF(preReqQuestStage == 0 || questName.getStage() == preReqQuestStage)
		
			IF(questComplete)
				questName.completeQuest()
			
			ELSE
				questName.setStage(questStage)
				questName.SetObjectiveDisplayed(questStage, 1)
				
			ENDIF
		
		ENDIF
		
	ENDIF

ENDEVENT
