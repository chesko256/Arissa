Scriptname _Arissa_MQ01_GuardNotLookingScript extends ObjectReference  

Quest property _Arissa_MQ01 auto
Faction property GuardFactionFalkreath auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef as Actor).IsInFaction(GuardFactionFalkreath) && (akActionRef.GetAngleZ() >= 225.0 && akActionRef.GetAngleZ() <= 300.0)
		(_Arissa_MQ01 as _Arissa_MQ01_Data).JailBreakGuardNotWatching = true
	endif
endEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if (akActionRef as Actor).IsInFaction(GuardFactionFalkreath)
		(_Arissa_MQ01 as _Arissa_MQ01_Data).JailBreakGuardNotWatching = false
	endif
endEvent