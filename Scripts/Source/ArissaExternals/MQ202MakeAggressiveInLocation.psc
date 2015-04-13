Scriptname MQ202MakeAggressiveInLocation extends ReferenceAlias  
{make the actor aggressive when he enters the 
specified location, unaggressive otherwise}

Location Property AggressionLocation  Auto  
{location where I become aggressive
}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if bAlwaysAggressive
		return
	endif

; 	debug.trace(self + " OnLocationChange from " + akOldLoc + " to " + akNewLoc)
	if akNewLoc == AggressionLocation ||  akNewLoc == AggressionLocation2 ||  akNewLoc == AggressionLocation3
		if GetActorRef().GetActorValue("Aggression") == 0
; 			debug.trace(self + " MAKE AGGRESSIVE")
			GetActorRef().SetActorValue("Aggression", 1)
		endif
	elseif GetActorRef().GetActorValue("Aggression") == 1
; 		debug.trace(self + " make unaggressive")
		GetActorRef().SetActorValue("Aggression", 0)
	endif
endEvent

Event OnDeath(Actor akKiller)
	; don't need this any more
	MQ202ShavariTrigger.Disable()
endEvent

ObjectReference Property MQ202ShavariTrigger  Auto  

; turn off aggression switching
function MakeAggressive(bool bFlag)
	bAlwaysAggressive = bFlag
	if bFlag
		GetActorRef().SetActorValue("Aggression", 1)
	endif
endFunction

Location Property AggressionLocation2  Auto  
Location Property AggressionLocation3  Auto  

bool bAlwaysAggressive = false		; set to true to set her to always aggressive regardless of location