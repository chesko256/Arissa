Scriptname V01SetstageBloodfireAmuletScript extends ReferenceAlias  
{V01 Checks its owning quest for two different stages, and sets another stage based on result.}

int Property StageToLookFor Auto
{The quest must be in this stage for the script to activate}
int Property StageToSet Auto
{The stage to set the quest to when activated}

int Property SecondStageToLookFor Auto
{The quest must be in this stage for the script to activate}
int Property SecondStageToSet Auto
{The stage to set the quest to when activated}

Event OnContainerChanged(ObjectReference akOldContainer, ObjectReference akNewContainer)
	If GetOwningQuest().GetStage() == StageToLookFor
		if akNewContainer == Game.GetPlayer()
		GetOwningQuest().SetStage(StageToSet)	
		endIf
	Endif

	If GetOwningQuest().GetStage() == SecondStageToLookFor
		if akNewContainer == Game.GetPlayer()
		GetOwningQuest().SetStage(SecondStageToSet)	
		endIf
	Endif

EndEvent