Scriptname defaultAliasOnUnload extends ReferenceAlias  
{sets a stage OnUnload
}

int Property stageToSet  Auto  
{set this stage when I unload}

Event OnUnload()
	GetOwningQuest().setStage(stageToSet)
endEvent