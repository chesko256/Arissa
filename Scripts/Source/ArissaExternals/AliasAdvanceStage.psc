Scriptname AliasAdvanceStage extends ReferenceAlias  
{When attached to an alias, will check its owning quest for one stage, and if set, will set another stage.}

int Property StageToLookFor Auto
{The quest must be in this stage for the script to activate}
int Property StageToSet Auto
{The stage to set the quest to when activated}

Event OnActivate(ObjectReference akActionRef)

	If GetOwningQuest().GetStage() == StageToLookFor
		GetOwningQuest().SetStage(StageToSet)	
	Endif

EndEvent
