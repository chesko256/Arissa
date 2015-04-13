Scriptname MG02TolfdirEVPTriggerScript extends ObjectReference  

ReferenceAlias Property MG02Tolfdir  Auto  


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		MG02Tolfdir.GetActorReference().EvaluatePackage()
	endif

EndEvent