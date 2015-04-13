Scriptname defaultDisableLinkRefOnDestruction extends ObjectReference  
{Disables my linked ref when I'm destroyed (Through destruction stages).}

Int Property OldStage = 3 Auto
{The destruction stage that is before the stage you want to trigger at
- Default = 3}

Int Property NewStage = 4 Auto
{The destruction stage that you want the trigger to happen at
- Default = 4}

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if (aiOldStage == OldStage) && (aiCurrentStage == NewStage)
		GetLinkedRef().Disable()
	endif
EndEvent
