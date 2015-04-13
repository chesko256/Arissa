Scriptname CWMission07StewardScript extends ReferenceAlias  

CWScript Property CW Auto

Faction Property CWImperialFaction  Auto  
Faction Property CWSonsFaction  Auto  

Faction Property GovImperial Auto  
Faction Property GovSons  Auto  

Actor Property PlayerRef Auto

int EscortDistance = 500

bool ContinueUpdating

State Busy
	Event OnUpdate()
; 		debug.trace("CWMission07StewardScript OnUpdate() in state BUSY")
		
		if continueUpdating
			RegisterForSingleUpdate(1)
		EndIf
	EndEvent
	
EndState


Event OnUpdate()
; 	debug.trace("CWMission07StewardScript OnUpdate()")

	AddOrRemovePlayerFromFaction()
	
	if continueUpdating
		RegisterForSingleUpdate(1)
	EndIf
	
EndEvent

Faction function GetMyFaction()
	Actor SelfActor = GetActorReference()
	Faction FactionToAdd
	
	if SelfActor.IsInFaction(GovImperial)
		FactionToAdd = CWImperialFaction
	Else
		FactionToAdd = CWSonsFaction
	EndIf
	
; 	debug.trace("CWMission07StewardScript GetMyFaction() returning " + factionToAdd)
	
	return FactionToAdd
	
EndFunction

Function AddOrRemovePlayerFromFaction(bool ForceAdd = False, bool ForceRemove = False)
	Actor SelfActor = GetActorReference()
	
	Faction FactionToAdd = GetMyFaction()
	
	if ForceAdd || selfActor.GetDistance(PlayerRef) <= EscortDistance
; 		debug.trace("CWMission07StewardScript adding player to " + FactionToAdd)
		PlayerRef.addToFaction(FactionToAdd)
	
	ElseIf ForceRemove || selfActor.GetDistance(PlayerRef) > EscortDistance
; 		debug.trace("CWMission07StewardScript removing player from " + FactionToAdd)
		PlayerRef.RemoveFromFaction(FactionToAdd)
	
	EndIf
EndFunction


function MonitorPlayerDistance(bool Monitor = True)
	GoToState("Busy")

	if Monitor == true 
		AddOrRemovePlayerFromFaction(ForceAdd = True)
		ContinueUpdating = true
		RegisterForSingleUpdate(1)
	Else
		ContinueUpdating = False
		;JUST IN CASE:
		utility.wait(5)
		AddOrRemovePlayerFromFaction(ForceRemove = True)
	EndIf
	
	GoToState("")
EndFunction


