Scriptname _Arissa_MQ01_NearJailTriggerScript extends ObjectReference  

Quest property _Arissa_MQ01 auto
ReferenceAlias property Alias_Arissa auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef as Actor) == Game.GetPlayer()
		(_Arissa_MQ01 as _Arissa_MQ01_Data).PlayerNearJailCell = true
		Alias_Arissa.GetActorReference().EvaluatePackage()
	endif
endEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if (akActionRef as Actor) == Game.GetPlayer()
		(_Arissa_MQ01 as _Arissa_MQ01_Data).PlayerNearJailCell = false
		Alias_Arissa.GetActorReference().EvaluatePackage()
	endif
endEvent