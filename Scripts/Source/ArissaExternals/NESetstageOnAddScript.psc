Scriptname NESetstageOnAddScript extends ReferenceAlias  
{On alias activation checks for "StageToLookFor" and if it's set, will set the quest to "StageToSet".}

int Property StageToLookFor Auto
{The quest must be in this stage for the script to activate}
int Property StageToSet Auto
{The stage to set the quest to when activated}

Event OnAdd(ObjectReference akActionRef)

	If GetOwningQuest().GetStage() == StageToLookFor
		GetOwningQuest().SetStage(StageToSet)	
	Endif

EndEvent