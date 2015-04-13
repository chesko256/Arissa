Scriptname CWAlliesScript extends Quest  

;This script handles adding new allies, and getting allies for use with sieges.

;To add an ally to be available in future sieges:
;*Use function AddPotentialAlly()
;*Note: - there are optional parameters which allow this ally to show up at sieges in various holds. Make sure you set at least one of these paramters to true or you will never see the ally show up for any battles.

;To get Allies to show up to sieges:
;1) Register markers for phase1/2/3/4/5 so allies have some place to go if the player isn't nearby call RegisterAllyPhaseMarkers() -- note this is MANDATORY
;2) Call ProcessAlliesForSiege() which finds appropriate allies, disables them, and then and moves them to Phase0Marker
;3) When it's appropriate stage in the siege quest, you then need to call EnableActiveAllies() which enables them causing them to appear at phase0marker.

;After sieges, to get allies to go home:
;*Call DeactivateAllies()
;*!!! NOTE !!!! This assumes the allies have standard packages that take them home some place. If this is not true, I will need to revisit this system.

CWScript Property CWs Auto

ReferenceAlias Property Phase0Marker Auto
ReferenceAlias Property Phase1Marker Auto
ReferenceAlias Property Phase2Marker Auto
ReferenceAlias Property Phase3Marker Auto
ReferenceAlias Property Phase4Marker Auto
ReferenceAlias Property Phase5Marker Auto
ReferenceAlias Property Phase6Marker Auto

ReferenceAlias Property PotentialAlly1 Auto
ReferenceAlias Property PotentialAlly2 Auto
ReferenceAlias Property PotentialAlly3 Auto
ReferenceAlias Property PotentialAlly4 Auto
ReferenceAlias Property PotentialAlly5 Auto
ReferenceAlias Property PotentialAlly6 Auto
ReferenceAlias Property PotentialAlly7 Auto
ReferenceAlias Property PotentialAlly8 Auto
ReferenceAlias Property PotentialAlly9 Auto
ReferenceAlias Property PotentialAlly10 Auto

ReferenceAlias Property ActiveAlly1 Auto
ReferenceAlias Property ActiveAlly2 Auto
ReferenceAlias Property ActiveAlly3 Auto
ReferenceAlias Property ActiveAlly4 Auto
ReferenceAlias Property ActiveAlly5 Auto
ReferenceAlias Property ActiveAlly6 Auto
ReferenceAlias Property ActiveAlly7 Auto
ReferenceAlias Property ActiveAlly8 Auto
ReferenceAlias Property ActiveAlly9 Auto
ReferenceAlias Property ActiveAlly10 Auto

Faction Property CWAlliesHaafingarFaction Auto
Faction Property CWAlliesReachFaction Auto
Faction Property CWAlliesHjaalmarchFaction Auto
Faction Property CWAlliesWhiterunFaction Auto
Faction Property CWAlliesFalkreathFaction Auto
Faction Property CWAlliesPaleFaction Auto
Faction Property CWAlliesWinterholdFaction Auto
Faction Property CWAlliesEastmarchFaction Auto
Faction Property CWAlliesRiftFaction Auto

Faction Property CWAlliesImperialsOnlyFaction Auto
Faction Property CWAlliesSonsOnlyFaction Auto



Location Property HaafingarHoldLocation Auto 
Location Property ReachHoldLocation Auto 
Location Property HjaalmarchHoldLocation Auto 
Location Property WhiterunHoldLocation Auto 
Location Property FalkreathHoldLocation Auto 
Location Property PaleHoldLocation Auto 
Location Property WinterholdHoldLocation Auto 
Location Property EastmarchHoldLocation Auto 
Location Property RiftHoldLocation Auto 

function MakeHadvarAndRalofPotentialAllies()
	;we're making them both potential allys when player joins either side, because IsAllowedtoJoinPlayersFaction() should prevent the wrong guy from showing up

; 	CWScript.Log("CWAlliesScript", self + "MakeHadvarAndRalofPotentialAllies() calling AddPotentialAlly() for both Hadvar and Ralof")
	
	AddPotentialAlly( \
		CWs.HadvarRef, \
		AllowedInHaafingar = False, \
		AllowedInReach = True, \
		AllowedInHjaalmarch = True, \
		AllowedInWhiterun = True, \
		AllowedInFalkreath = True, \
		AllowedInPale = True, \
		AllowedInWinterhold = True, \
		AllowedInEastmarch = False, \
		AllowedInRift = True, \
		ImperialsOnly = True, \
		SonsOnly = false \
	)
		
		
	AddPotentialAlly( \
		CWs.RalofRef, \
		AllowedInHaafingar = False, \
		AllowedInReach = True, \
		AllowedInHjaalmarch = True, \
		AllowedInWhiterun = True, \
		AllowedInFalkreath = True, \
		AllowedInPale = True, \
		AllowedInWinterhold = True, \
		AllowedInEastmarch = False, \
		AllowedInRift = True, \
		ImperialsOnly = False, \
		SonsOnly = True \
	)

EndFunction

function AddPotentialAlly( \
ObjectReference ReferenceToAdd, \
Bool AllowedInHaafingar = false, \
Bool AllowedInReach = false, \
Bool AllowedInHjaalmarch = false, \
Bool AllowedInWhiterun = false, \
Bool AllowedInFalkreath = false, \
Bool AllowedInPale = false, \
Bool AllowedInWinterhold = false, \
Bool AllowedInEastmarch = false, \
Bool AllowedInRift = false, \
bool ImperialsOnly = false, \
bool SonsOnly = false \
)

; 	CWScript.Log("CWAlliesScript", self + "AddPotentialAlly() trying to add " + ReferenceToAdd + "Calling GetFreePotenialAllyAlias()")

	ReferenceAlias AliasToForceInto = GetFreePotentialAllyAlias()
	
	Actor ActorToAdd = ReferenceToAdd as Actor
	
	if AliasToForceInto != None
; 		CWScript.Log("CWAlliesScript", self + "AddPotentialAlly() forcing " + ReferenceToAdd + " into alias " + AliasToForceInto)
		AliasToForceInto.ForceRefTo(ReferenceToAdd)

		if AllowedInHaafingar
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesHaafingarFaction)
			ActorToAdd.AddToFaction(CWAlliesHaafingarFaction)
		EndIf
		
		if AllowedInReach
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesReachFaction)
			ActorToAdd.AddToFaction(CWAlliesReachFaction)
		EndIf
		
		if AllowedInHjaalmarch
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesHjaalmarchFaction)
			ActorToAdd.AddToFaction(CWAlliesHjaalmarchFaction)
		EndIf
		
		if  AllowedInWhiterun
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesWhiterunFaction)
			ActorToAdd.AddToFaction(CWAlliesWhiterunFaction)
		EndIf
		
		if AllowedInFalkreath
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesFalkreathFaction)
			ActorToAdd.AddToFaction(CWAlliesFalkreathFaction)
		EndIf
		
		if AllowedInPale
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesPaleFaction)
			ActorToAdd.AddToFaction(CWAlliesPaleFaction)
		EndIf
		
		if AllowedInWinterhold
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesWinterholdFaction)
			ActorToAdd.AddToFaction(CWAlliesWinterholdFaction)
		EndIf
		
		if AllowedInEastmarch
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesEastmarchFaction)
			ActorToAdd.AddToFaction(CWAlliesEastmarchFaction)
		EndIf
		
		if AllowedInRift
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesRiftFaction)
			ActorToAdd.AddToFaction(CWAlliesRiftFaction)
		EndIf
		
		if ImperialsOnly
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesImperialsOnlyFaction)
			ActorToAdd.AddToFaction(CWAlliesImperialsOnlyFaction)
		EndIf

		if SonsOnly
; 			CWScript.Log("CWAlliesScript", self + "adding " + ReferenceToAdd + " to faction " + CWAlliesSonsOnlyFaction)
			ActorToAdd.AddToFaction(CWAlliesSonsOnlyFaction)
		EndIf		
		
	Else
		;WARNING WE COULDN'T FIND FREE SLOT!!!!
; 		CWScript.Log("CWAlliesScript", self + " WARNING: AddPotentialAlly() couldn't find a free slot for the ally.", 2, 1, 1 )
		
	EndIf
	
EndFunction



ReferenceAlias function GetFreePotentialAllyAlias()
	ReferenceAlias AliasToReturn
	
	if PotentialAlly1.GetReference() == False
		AliasToReturn = PotentialAlly1
		
	ElseIf PotentialAlly2.GetReference() == False
		AliasToReturn = PotentialAlly2
		
	ElseIf PotentialAlly3.GetReference() == False
		AliasToReturn = PotentialAlly3
		
	ElseIf PotentialAlly4.GetReference() == False
		AliasToReturn = PotentialAlly4
		
	ElseIf PotentialAlly5.GetReference() == False
		AliasToReturn = PotentialAlly5	
		
	ElseIf PotentialAlly6.GetReference() == False
		AliasToReturn = PotentialAlly6
		
	ElseIf PotentialAlly7.GetReference() == False
		AliasToReturn = PotentialAlly7
		
	ElseIf PotentialAlly8.GetReference() == False
		AliasToReturn = PotentialAlly8
		
	ElseIf PotentialAlly9.GetReference() == False
		AliasToReturn = PotentialAlly9
		
	ElseIf PotentialAlly10.GetReference() == False
		AliasToReturn = PotentialAlly10
	
	Else
		;RAN OUT OF SLOTS
; 		CWScript.Log("CWAlliesScript", self + " WARNING: GetFreePotenialAllyAlias() ran out of PotentialAlly Aliases, returning none.", 2, 1, 1 )
		return None

	EndIf

; 	CWScript.Log("CWAlliesScript", self + "GetFreePotenialAllyAlias() returning " + AliasToReturn)
	
	return AliasToReturn

EndFunction



function RegisterAllyPhaseMarkers(ObjectReference Phase0MarkerRef, ObjectReference Phase1MarkerRef, ObjectReference Phase2MarkerRef, ObjectReference Phase3MarkerRef, ObjectReference Phase4MarkerRef, ObjectReference Phase5MarkerRef, ObjectReference Phase6MarkerRef)
{Called by Siege scripts to register 1 set of phase1/2/3/4/5 markers for all the allies to use for that siege}

; 	CWScript.Log("CWAlliesScript", self + "RegisterAllyPhaseMarkers() forcing Refs: " + Phase0MarkerRef + "," + Phase1MarkerRef + ", " + Phase2MarkerRef + ", " +  Phase3MarkerRef + ", " + Phase4MarkerRef + ", " + Phase5MarkerRef + ", " + Phase6MarkerRef +  " into Phase0/1/2/3/4/5/6Marker Aliases.")
	Phase0Marker.ForceRefTo(Phase0MarkerRef)
	Phase1Marker.ForceRefTo(Phase1MarkerRef)
	Phase2Marker.ForceRefTo(Phase2MarkerRef)
	Phase3Marker.ForceRefTo(Phase3MarkerRef)
	Phase4Marker.ForceRefTo(Phase4MarkerRef)
	Phase5Marker.ForceRefTo(Phase5MarkerRef)
	Phase6Marker.ForceRefTo(Phase6MarkerRef)

EndFunction

function ProcessAlliesForSiege(Location HoldLocation)
{Called by Siege scripts to find appropriate allies and move them to Phase0Marker}	
; 	CWScript.Log("CWAlliesScript", self + "ProcessAlliesForSiege() for location  " + HoldLocation + " will now try to find appropriate allies, move them to Phase1Marker and disable them.")
	
	ObjectReference Phase0MarkerRef = Phase0Marker.GetReference()
	
	if Phase0MarkerRef == None
; 		CWScript.Log("CWAlliesScript", self + " WARNING: ProcessAlliesForSiege() couldn't find a reference in Phase0Marker. Make sure Siege Script calls RegisterAllyPhaseMarkers() before calling ProcessAlliesForSiege()!!! ", 2, 1, 1 )
		Return
	EndIf
	
	TryToProcessAlly(PotentialAlly1, HoldLocation, Phase0MarkerRef)
	TryToProcessAlly(PotentialAlly2, HoldLocation, Phase0MarkerRef)
	TryToProcessAlly(PotentialAlly3, HoldLocation, Phase0MarkerRef)
	TryToProcessAlly(PotentialAlly4, HoldLocation, Phase0MarkerRef)
	TryToProcessAlly(PotentialAlly5, HoldLocation, Phase0MarkerRef)
	TryToProcessAlly(PotentialAlly6, HoldLocation, Phase0MarkerRef)
	TryToProcessAlly(PotentialAlly7, HoldLocation, Phase0MarkerRef)
	TryToProcessAlly(PotentialAlly8, HoldLocation, Phase0MarkerRef)
	TryToProcessAlly(PotentialAlly9, HoldLocation, Phase0MarkerRef)
	TryToProcessAlly(PotentialAlly10, HoldLocation, Phase0MarkerRef)

; 	CWScript.Log("CWAlliesScript", self + "ProcessAlliesForSiege() done processing potential allies.")

EndFunction

Function TryToProcessAlly(ReferenceAlias PotentialAlly, Location HoldLocation, ObjectReference Phase0MarkerRef)
; 	CWScript.Log("CWAlliesScript", self + "TryToProcessAlly() for PotentialAlly Alias:" + PotentialAlly + " for HoldLocation:" + HoldLocation)

	actor CurrentPotentialAlly = TryPromoteToActiveAllyAndReturnActor(PotentialAlly, HoldLocation)	
	
	if CurrentPotentialAlly
; 		CWScript.Log("CWAlliesScript", self + "TryToProcessAlly() disabling " + CurrentPotentialAlly + " and moving to to " + Phase0MarkerRef + "." )
		CurrentPotentialAlly.Disable()
		CurrentPotentialAlly.MoveTo(Phase0MarkerRef)
		
	Else	;for some reason TryPromoteToActiveAllyAndReturnActor failed to return an actor. This does not mean something broke. There are cases where this is fine (for instance tha actor isn't in the faction that allows him to show up in the hold
; 		CWScript.Log("CWAlliesScript", self + "TryToProcessAlly() did not get an actor from TryPromoteToActiveAllyAndReturnActor( " + PotentialAlly + " ) so we are ignoring it.")
	
	EndIf
	
EndFunction

Actor function TryPromoteToActiveAllyAndReturnActor(ReferenceAlias PotentialAllyToPromote, Location HoldLocation)

	Actor ActorToForce = PotentialAllyToPromote.GetActorReference()
	ReferenceAlias AliasToForceInto = GetFreeActiveAllyAlias()

	;check that there is an Actor in PotentialAllyToPromote
	if ActorToForce == None
; 		CWScript.Log("CWAlliesScript", self + " TryPromoteToActiveAllyAndReturnActor() did not find an actor in PotentialAllyToPromote alias: " + PotentialAllyToPromote)
		ActorToForce = None ;it's already none, but for consistency and readability I'm setting it here.
		
	Else
		;Check that Actor is in the correct faction (ie that he is allowed to show up in the HoldLocation)
		if IsAllowedInLocation(ActorToForce, HoldLocation) && IsAllowedToJoinPlayersFaction(ActorToForce)
			;Is Allowed in location
; 			CWScript.Log("CWAlliesScript", self + "TryPromoteToActiveAllyAndReturnActor() found actor" + ActorToForce + " is indeed allowed in location and is allowed to join up with the player's faction." )
				
			if AliasToForceInto != None
; 				CWScript.Log("CWAlliesScript", self + "TryPromoteToActiveAllyAndReturnActor() forcing " + ActorToForce + " into alias " + AliasToForceInto)
				AliasToForceInto.ForceRefTo(ActorToForce)
				
			Else
				;WARNING WE COULDN'T FIND FREE SLOT!!!!
; 				CWScript.Log("CWAlliesScript", self + " WARNING: TryPromoteToActiveAllyAndReturnActor() couldn't find a free slot for the ally.", 2, 1, 1 )
				ActorToForce = None
				
			EndIf
			
		Else ; Is Not Allowed in Location
; 			CWScript.Log("CWAlliesScript", self + "promoteToActiveAlly() found actor" + ActorToForce + " is not allowed in location(" + HoldLocation + ") OR is not allowed to join player's faction:" + CWs.PlayerAllegiance + "[" + CWs.FactionName(CWs.PlayerAllegiance) +"]")
			ActorToForce = None
		EndIf
		
	
	Endif
	
; 	CWScript.Log("CWAlliesScript", self + "promoteToActiveAlly() returning " + ActorToForce)
	return ActorToForce
	
EndFunction


bool function IsAllowedInLocation(Actor ActorToCheck, Location HoldLocationToCheck)
	
	Bool IsAllowed
	
	if HoldLocationToCheck == HaafingarHoldLocation 
		if ActorToCheck.IsInFaction(CWAlliesHaafingarFaction)
			IsAllowed = True
		Else
; 			CWScript.Log("CWAlliesScript", self + "IsAllowedInLocation() did not find ActorToCheck" + ActorToCheck + " in CWAlliesHaafingarFaction. Will return false.")
			IsAllowed = False
		EndIf
					
	elseif HoldLocationToCheck == ReachHoldLocation 
		if ActorToCheck.IsInFaction(CWAlliesReachFaction)
			IsAllowed = true
		else
; 			CWScript.Log("CWAlliesScript", self + "IsAllowedInLocation() did not find ActorToCheck" + ActorToCheck + " in CWAlliesReachFaction. Will return false.")
			IsAllowed = False
		Endif
			
	elseif HoldLocationToCheck == HjaalmarchHoldLocation 
		if ActorToCheck.IsInFaction(CWAlliesHjaalmarchFaction)
			IsAllowed = true
		else
; 			CWScript.Log("CWAlliesScript", self + "IsAllowedInLocation() did not find ActorToCheck" + ActorToCheck + " in CWAlliesHjaalmarchFaction. Will return false.")
			IsAllowed = False
		Endif
			
	elseif HoldLocationToCheck == WhiterunHoldLocation
		if ActorToCheck.IsInFaction(CWAlliesWhiterunFaction)
			IsAllowed = true
		else
; 			CWScript.Log("CWAlliesScript", self + "IsAllowedInLocation() did not find ActorToCheck" + ActorToCheck + " in CWAlliesWhiterunFaction. Will return false.")
			IsAllowed = False
		Endif
			
	elseif HoldLocationToCheck == FalkreathHoldLocation 
		if ActorToCheck.IsInFaction(CWAlliesFalkreathFaction)
			IsAllowed = true
		else
; 			CWScript.Log("CWAlliesScript", self + "IsAllowedInLocation() did not find ActorToCheck" + ActorToCheck + " in CWAlliesFalkreathFaction. Will return false.")
			IsAllowed = False
		Endif
			
	elseif HoldLocationToCheck == PaleHoldLocation 
		if ActorToCheck.IsInFaction(CWAlliesPaleFaction)
			IsAllowed = true
		else
; 			CWScript.Log("CWAlliesScript", self + "IsAllowedInLocation() did not find ActorToCheck" + ActorToCheck + " in CWAlliesPaleFaction. Will return false.")
			IsAllowed = False
		Endif
			
	elseif HoldLocationToCheck == WinterholdHoldLocation 
		if ActorToCheck.IsInFaction(CWAlliesWinterholdFaction)
			IsAllowed = true
		else
; 			CWScript.Log("CWAlliesScript", self + "IsAllowedInLocation() did not find ActorToCheck" + ActorToCheck + " in CWAlliesWinterholdFaction. Will return false.")
			IsAllowed = False
		Endif
			
	elseif HoldLocationToCheck == EastmarchHoldLocation 
		if ActorToCheck.IsInFaction(CWAlliesEastmarchFaction)
			IsAllowed = true
		else
; 			CWScript.Log("CWAlliesScript", self + "IsAllowedInLocation() did not find ActorToCheck" + ActorToCheck + " in CWAlliesEastmarchFaction. Will return false.")
			IsAllowed = False
		Endif
			
	elseif HoldLocationToCheck == RiftHoldLocation 
		if ActorToCheck.IsInFaction(CWAlliesRiftFaction)
			IsAllowed = true
		else
; 			CWScript.Log("CWAlliesScript", self + "IsAllowedInLocation() did not find ActorToCheck" + ActorToCheck + " in CWAlliesRiftFaction. Will return false.")
			IsAllowed = False
		Endif
			
	Else
; 		CWScript.Log("CWAlliesScript", self + " WARNING: IsAllowedInLocation() found an unexpected location for HoldLocationToCheck:" + HoldLocationToCheck, 2, 1, 1 )
		IsAllowed = False
	EndIf	

	return IsAllowed
	
EndFunction

bool Function IsAllowedToJoinPlayersFaction(Actor ActorToCheck)
	
	bool returnVal
	
	if CWs.PlayerAllegiance == CWs.iImperials && ActorToCheck.IsInFaction(CWAlliesSonsOnlyFaction)
	
; 		CWScript.Log("CWAlliesScript", self + "IsAllowedToJoinPlayersFaction(" + ActorToCheck + ") is in CWAlliesSonsOnlyFaction and player Imperial. Will return false.")

		returnVal = False
	
	elseif CWs.PlayerAllegiance == CWs.iSons && ActorToCheck.IsInFaction(CWAlliesImperialsOnlyFaction)
; 		CWScript.Log("CWAlliesScript", self + "IsAllowedToJoinPlayersFaction(" + ActorToCheck + ") is in CWAlliesImperialsOnlyFaction and player Sons. Will return false.")
		returnVal = False
		
	Else
		returnVal = True
		
	EndIf
		
	return returnVal
	
EndFunction


ReferenceAlias function GetFreeActiveAllyAlias()
	ReferenceAlias AliasToReturn
	
	if ActiveAlly1.GetReference() == False
		AliasToReturn = ActiveAlly1
		
	ElseIf ActiveAlly2.GetReference() == False
		AliasToReturn = ActiveAlly2
		
	ElseIf ActiveAlly3.GetReference() == False
		AliasToReturn = ActiveAlly3
		
	ElseIf ActiveAlly4.GetReference() == False
		AliasToReturn = ActiveAlly4
		
	ElseIf ActiveAlly5.GetReference() == False
		AliasToReturn = ActiveAlly5	
		
	ElseIf ActiveAlly6.GetReference() == False
		AliasToReturn = ActiveAlly6
		
	ElseIf ActiveAlly7.GetReference() == False
		AliasToReturn = ActiveAlly7
		
	ElseIf ActiveAlly8.GetReference() == False
		AliasToReturn = ActiveAlly8
		
	ElseIf ActiveAlly9.GetReference() == False
		AliasToReturn = ActiveAlly9
		
	ElseIf ActiveAlly10.GetReference() == False
		AliasToReturn = ActiveAlly10
	
	Else
		;RAN OUT OF SLOTS
; 		CWScript.Log("CWAlliesScript", self + " WARNING: GetFreePotenialAllyAlias() ran out of ActiveAlly Aliases, returning none.", 2, 1, 1 )
		return None

	EndIf

; 	CWScript.Log("CWAlliesScript", self + "GetFreePotenialAllyAlias() returning " + AliasToReturn)
	
	return AliasToReturn

EndFunction

function EnableActiveAllies()
; 	CWScript.Log("CWAlliesScript", self + "EnableActiveAllies() calling TryToEnable() on all of the ActiveAllyX aliases.")
	ActiveAlly1.TryToEnable()
	ActiveAlly2.TryToEnable()
	ActiveAlly3.TryToEnable()
	ActiveAlly4.TryToEnable()
	ActiveAlly5.TryToEnable()
	ActiveAlly6.TryToEnable()
	ActiveAlly7.TryToEnable()
	ActiveAlly8.TryToEnable()
	ActiveAlly9.TryToEnable()
	ActiveAlly10.TryToEnable()

; 	CWScript.Log("CWAlliesScript", self + "EnableActiveAllies() finished trying to enable all the active allies.")
EndFunction

function DeactivateAllies()
{Called by Siege script when the siege is over and the allies should go home. This assumes the Allies have packages that take them some place. If this is not true, I need to revisit this system.}

; 	CWScript.Log("CWAlliesScript", self + "EnableActiveAllies() calling Clear() on all of the ActiveAllyX aliases.")
	
	ActiveAlly1.Clear()
	ActiveAlly2.Clear()
	ActiveAlly3.Clear()
	ActiveAlly4.Clear()
	ActiveAlly5.Clear()
	ActiveAlly6.Clear()
	ActiveAlly7.Clear()
	ActiveAlly8.Clear()
	ActiveAlly9.Clear()
	ActiveAlly10.Clear()

EndFunction

