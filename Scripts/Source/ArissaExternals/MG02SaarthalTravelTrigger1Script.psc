Scriptname MG02SaarthalTravelTrigger1Script extends ObjectReference  

Quest Property MG02  Auto  

ReferenceAlias Property MG02Brelyna  Auto  

ReferenceAlias Property MG02Onmund  Auto  

ReferenceAlias Property MG02Jzargo  Auto  


Event OnTriggerEnter(ObjectReference ActionRef)

MG02QuestScript MG02Script = MG02 as MG02QuestScript

	if ActionRef == MG02Brelyna.GetReference()
		MG02Script.BrelynaTravelUpdate=1
		MG02Brelyna.GetActorReference().EvaluatePackage()
	elseif ActionRef == MG02Onmund.GetReference()
		MG02Script.OnmundTravelUpdate = 1
		MG02Onmund.GetActorReference().EvaluatePackage()
	elseif ActionRef == MG02Jzargo.GetReference()
		MG02Script.JzargoTravelUpdate = 1
		MG02Jzargo.GetActorReference().EvaluatePackage()
	endif

EndEvent