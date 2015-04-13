scriptName MG03FreeOrothorn extends ObjectReference
{ The player frees Orothorn by pulling this lever. }

Quest property MG03 auto

Event OnActivate(ObjectReference triggerRef)
	if (MG03.GetStage() > 20 && MG03.GetStage() < 200)
		MG03.SetStage(55)
		MG03Orthorn.GetActorReference().EvaluatePackage()
	endif
EndEvent

ReferenceAlias Property MG03Orthorn  Auto  
