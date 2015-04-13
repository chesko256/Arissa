Scriptname defaultOnResetTestAndDisable extends ObjectReference  
{On reset, disable this reference if its prereq stage has been set.}

Quest property myQuest Auto
{Optionally, quest to test a stage on.}

int property myStage Auto
{If this stage is set, disable the reference.}

ReferenceAlias property myAlias Auto
{Optionally, a ReferenceAlias to clear if we're disabling this ref.}


Event OnReset()
	if (myQuest == None || myQuest.GetStageDone(myStage))
		Self.Disable()
		myAlias.ForceRefTo(None)
	EndIf
EndEvent
	