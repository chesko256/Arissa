Scriptname dunQuestUtilitySCRIPT extends ReferenceAlias  
{A basic script that can be thrown onto Alias Refs to progress and complete quests easily.}

QUEST PROPERTY myQuest AUTO
{the quest we're updating}

BOOL PROPERTY complete AUTO
{whether or not to complete it}

INT PROPERTY stage AUTO
{the stage we're updating to}

EVENT onACTIVATE(objectReference ref)
	
	IF(ref AS ACTOR == game.getPlayer())
		
		IF(complete)
			myQuest.completeQuest()
		
		ELSE
			myQuest.setStage(stage)
			myQuest.SetObjectiveDisplayed(stage, 1)
			
		ENDIF
		
	ENDIF

ENDEVENT
