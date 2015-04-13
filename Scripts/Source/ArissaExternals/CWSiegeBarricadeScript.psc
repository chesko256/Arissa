Scriptname CWSiegeBarricadeScript extends ReferenceAlias  

import Debug
import Utility


GlobalVariable Property CWPathClear1 Auto

GlobalVariable Property CWPathClear2 Auto

GlobalVariable Property CWPathClear3 Auto

;<OBSOLETE>
bool Property SetPathClear1 Auto
{Should I set PathClear1 to 1? - Don't use with "SetPathClear2 or 3"}

bool Property SetPathClear2 Auto
{Should I set PathClear2 to 1? - Don't use with "SetPathClear1 or 3"}

bool Property SetPathClear3 Auto
{Should I set PathClear3 to 1? - Don't use with "SetPathClear1 or 2"}
;</OBSOLETE>


Int Property OldStage = 3 Auto
{The destruction stage that is before the stage you want to trigger at
- Default = 3}

Int Property NewStage = 4 Auto
{The destruction stage that you want the trigger to happen at
- Default = 4}

int Property StageToSetWhenDestroyed Auto
{What stage in CWSiege should I set when I'm destroyed}

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if (aiOldStage == OldStage) && (aiCurrentStage == NewStage)
	
		GetOwningQuest().SetStage(StageToSetWhenDestroyed)


		if (SetPathClear1 == TRUE)
			CWPathClear1.SetValue(1)
		endif
		if (SetPathClear2 == TRUE)
			CWPathClear2.SetValue(1)
		endif
		if (SetPathClear3 == TRUE)
			CWPathClear3.SetValue(1)
		endif
	endif
EndEvent

Function ClearGlobals()

	if CWPathClear1
		CWPathClear1.SetValue(0)
	endif

	if CWPathClear2
		CWPathClear2.SetValue(0)
	endif

	if CWPathClear3
		CWPathClear3.SetValue(0)
	endif	

EndFunction
