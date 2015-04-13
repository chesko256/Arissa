Scriptname CWMissionScript extends Quest
{All the Civil War scripts are based on this script. It contains properties and functions common to all of them.}


;#### Common Properties for all CWMission Quests ####
int Property MissionNumber auto Conditional Hidden			;Which "slot" in the campaign does this mission fill... used for mission hooks dialogue in CWCampaign -- formerly this was handled by passing in xmarkers, but know uses the numeric data of the script event
;0 = un/reset
;100 = Tutorial / Ambush
;1 = attack settlement
;2 = sabotage resource
;3 = intercept courier
;4 = rescue soldier from fort prison
;5 = assassinate enemy field co
;6 = turn coats
;7 = blackmail steward
;8 - recruit a giant
;9 = steal plans
;10 - recruit a warrior ally
;11 - recruit orc ally
;99 - Fort Siege
;50 - Final Battle for Minor Hold Capital
;*** NOTE: setting faction rank higher than 100 doesn't work. So keeps these under 100 for flagging Field CO mission factions


int property acceptedMission auto conditional Hidden			;player has accepted the mission
int property objectiveCompleted auto conditional Hidden		;player has completed the objective (ie finished the quest and needs to report success)

float property failDay auto Conditional Hidden				;used by CWMissionPollForFailDayScript: after accepting the quest, the player has until this gamedayspassed value to complete the mission or it fails

int Property campaignPhase Auto Conditional Hidden			;set in RegisterMissionTypeWithCampaign() -- what phase the campaign was in when this mission quest started (used to make sure it's in the correct phases)
int Property countCampaigns Auto Conditional 	Hidden			;set in RegisterMissionTypeWithCampaign() -- what the countCampaigns property in CWScript was when this mission started (used to make sure it's in the correct campaign)

;Many but not all mission quests will be using these
int property foundRendezvous auto conditional Hidden			;player has rendezvoused with his team
int Property countResources Auto Conditional Hidden			;count of resource objects in the attack point garrison
int Property countFarms Auto Conditional Hidden				;count of farm resource objects
int Property countMills Auto Conditional Hidden				;count of farm resource objects
int Property countMines Auto Conditional Hidden				;count of farm resource objects
int Property resource1Type Auto Conditional Hidden			;the type of resource in alias ResourceObject1

;##### Properties with pointers to things in the master file:
;###

;## Aliases ##
ReferenceAlias Property FieldCO auto
ReferenceAlias Property MissionNumberRef Auto

;# Aliases in OTHER QUESTS #
ReferenceAlias Property CWCampaignFieldCO auto
{Pointer to FieldCO alias in the CWCampaign quest}

;## Quests ##
Quest Property CW  Auto  
Quest Property CWCampaign Auto  
Quest Property CWCampaignObj Auto  

;## Scripts ##
;These will be assigned in the OnInit() block
CWScript Property CWs Auto hidden
CWCampaignScript Property CWCampaignS Auto hidden

Event OnInit()
	
	CWs = CW as CWScript
	CWCampaignS = CWCampaign as CWCampaignScript
	
; 	CWScript.Log("CWMissionScript", self + ": OnInit()")
	
EndEvent

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
 
; 	CWScript.Log("CWMissionScript", self + ": OnStoryScript() setting MissionNumber = aiValue1: " + aiValue1)
	MissionNumber = aiValue1
 
 
 EndEvent



;OBSOLETE!!!!
function PlayerAcceptsMission()
	AcceptedMission = 1
	CWCampaignS.AcceptedMission = 1
	SetMissionFailDay()
	((self as quest) as CWMissionPollForFailDayScript).startPolling()

	CWs.PlayerJoinedCurrentCampaign = 1
	
	if CWs.ContestedHold == CWs.iReach
		CWs.playerJoinedCampaginReach = 1
	elseif CWs.ContestedHold == CWs.iWhiterun
		CWs.playerJoinedCampaginWhiterun = 1
	elseif CWs.ContestedHold == CWs.iRift
		CWs.playerJoinedCampaginRift = 1
	EndIf
	
EndFunction


Function TryToResetSoldierAlias(ReferenceAlias AliasToReset)
;Resets actor ref if exists
	Actor actorRef = AliasToReset.GetActorReference()
	
	if actorRef
; 		CWScript.Log("CWMissionScript", self + ": TryToResetSoldierAlias([" +AliasToReset + "]) resetting " + actorRef + ".")
		ActorRef.Reset()
	Else
; 		CWScript.Log("CWMissionScript", self + ": TryToResetSoldierAlias([" +AliasToReset + "]) is empty, not resetting.")
	
	EndIf

EndFunction

function TryToResetEnemySoldierAlias(ReferenceAlias AliasToTry)
{Checks to see if the alias is in enemy faction, and if so resets it}

	Actor actorRef = AliasToTry.GetActorReference()
	
	if ActorRef && CWs.IsPlayerInMyFaction(ActorRef) == false
; 		CWScript.Log("CWMissionScript", self + ": TryToResetEnemySoldierAlias([" +AliasToTry + "]) resetting " + actorRef + ".")
		actorRef.reset()
	
	Else
; 		CWScript.Log("CWMissionScript", self + ": TryToResetSoldierAlias([" +AliasToTry + "]) is empty, or is in player ally faction, not resetting.")
		
	EndIf
	

EndFunction



function EnableMapMarkerAlias(ReferenceAlias MapMarkerAlias)
	
	ObjectReference mapMarkerRef = MapMarkerAlias.GetReference()
	
	if mapMarkerRef
		mapMarkerRef.AddToMap(False)
	Else
; 		CWScript.Log("CWMissionScript", self + "WARNING: EnableMapMarkerAlias([" + MapMarkerAlias + "]) is empty.", 2)
	
	EndIf

EndFunction

Function CreateAliasedSoldierAttacker(Location HoldLocation, ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, bool IsGuard = true, bool startInFactionNPC = true, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls either CreateAliasedSoldierImperial() or CreateAliasedSoldierSons() based on the player's allegience}

	if CWs.GetAttacker(HoldLocation) == CWs.iImperials
		CreateAliasedSoldierImperial(AliasToFill, ReferenceToPlaceAt, CreateDisabled, IsGuard, startInFactionNPC, aiLevelMod, akZone)	;create an imperial
	
	ElseIf CWs.GetAttacker(HoldLocation) == CWs.iSons
		CreateAliasedSoldierSons(AliasToFill, ReferenceToPlaceAt, CreateDisabled, IsGuard, startInFactionNPC, aiLevelMod, akZone)		;create a sons
	
	Else
; 		CWScript.Log("CWMissionScript", self + ": CreateAliasedSoldierAttacker() expected CWScript Attacker to be 1 or 2, instead got: " + CWs.GetAttacker(HoldLocation), 2, true, true)
	EndIf

EndFunction

Function CreateAliasedSoldierDefender(Location HoldLocation, ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, bool IsGuard = true, bool startInFactionNPC = true, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls either CreateAliasedSoldierImperial() or CreateAliasedSoldierSons() based on the player's allegience}

	if CWs.GetDefender(HoldLocation) == CWs.iImperials
		CreateAliasedSoldierImperial(AliasToFill, ReferenceToPlaceAt, CreateDisabled, IsGuard, startInFactionNPC, aiLevelMod, akZone)	;create an imperial
	
	ElseIf CWs.GetDefender(HoldLocation) == CWs.iSons
		CreateAliasedSoldierSons(AliasToFill, ReferenceToPlaceAt, CreateDisabled, IsGuard, startInFactionNPC, aiLevelMod, akZone)		;create a sons
	
	Else
; 		CWScript.Log("CWMissionScript", self + ": CreateAliasedSoldierDefender() expected CWScript Defender to be 1 or 2, instead got: " + CWs.GetDefender(HoldLocation), 2, true, true)
	EndIf

EndFunction


Function CreateAliasedSoldierAlly(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, bool IsGuard = true, bool startInFactionNPC = true, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls either CreateAliasedSoldierImperial() or CreateAliasedSoldierSons() based on the player's allegience}

	if CWs.PlayerAllegiance == CWs.iImperials
		CreateAliasedSoldierImperial(AliasToFill, ReferenceToPlaceAt, CreateDisabled, IsGuard, startInFactionNPC, aiLevelMod, akZone)	;create an imperial
	
	ElseIf CWs.PlayerAllegiance == CWs.iSons
		CreateAliasedSoldierSons(AliasToFill, ReferenceToPlaceAt, CreateDisabled, IsGuard, startInFactionNPC, aiLevelMod, akZone)		;create a sons
	
	Else
; 		CWScript.Log("CWMissionScript", self + ": CreateAliasedSoldierAlly() expected CWScript PlayerAllegience to be 1 or 2, instead got: " + CWs.PlayerAllegiance, 2, true, true)
	EndIf
	

EndFunction

Function CreateAliasedSoldierEnemy(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, bool IsGuard = true, bool startInFactionNPC = true, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls either CreateAliasedSoldierImperial() or CreateAliasedSoldierSons() based on the player's allegience}

	if CWs.PlayerAllegiance == CWs.iImperials
		CreateAliasedSoldierSons(AliasToFill, ReferenceToPlaceAt, CreateDisabled, IsGuard, startInFactionNPC, aiLevelMod, akZone)		;create and sons (ie enemy of imperials)
	
	ElseIf CWs.PlayerAllegiance == CWs.iSons
		CreateAliasedSoldierImperial(AliasToFill, ReferenceToPlaceAt, CreateDisabled, IsGuard, startInFactionNPC, aiLevelMod, akZone)	;create an imperial (ie enemy of sons)
		
	Else
; 		CWScript.Log("CWMissionScript", self + ": CreateAliasedSoldierEnemy() expected CWScript PlayerAllegience to be 1 or 2, instead got: " + CWs.PlayerAllegiance, 2,  true, true)
	EndIf
	

EndFunction

Function CreateAliasedCourierAlly(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls either CreateAliasedCourierImperial() or CreateAliasedCourierSons() based on the player's allegience}

	if CWs.PlayerAllegiance == CWs.iImperials
		CreateAliasedCourierImperial(AliasToFill, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)	;create an imperial
	
	ElseIf CWs.PlayerAllegiance == CWs.iSons
		CreateAliasedCourierSons(AliasToFill, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)		;create a sons
	
	Else
; 		CWScript.Log("CWMissionScript", self + ": CreateAliasedCourierAlly() expected CWScript PlayerAllegience to be 1 or 2, instead got: " + CWs.PlayerAllegiance, 2, true,true)
	EndIf
	
EndFunction

Function CreateAliasedCourierEnemy(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls either CreateAliasedCourierImperial() or CreateAliasedCourierSons() based on the player's allegience}

	if CWs.PlayerAllegiance == CWs.iImperials
		CreateAliasedCourierSons(AliasToFill, ReferenceToPlaceAt, CreateDisabled,  aiLevelMod, akZone)		;create and sons (ie enemy of imperials)
	
	ElseIf CWs.PlayerAllegiance == CWs.iSons
		CreateAliasedCourierImperial(AliasToFill, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)	;create an imperial (ie enemy of sons)
		
	Else
; 		CWScript.Log("CWMissionScript", self + ": CreateAliasedCourierEnemy() expected CWScript PlayerAllegience to be 1 or 2, instead got: " + CWs.PlayerAllegiance, 2, true, true)
	EndIf

EndFunction

Function CreateAliasedPrisonerAlly(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls either CreateAliasedPrisonerImperial() or CreateAliasedPrisonerSons() based on the player's allegience}

	if CWs.PlayerAllegiance == CWs.iImperials
		CreateAliasedPrisonerImperial(AliasToFill, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)	;create an imperial
	
	ElseIf CWs.PlayerAllegiance == CWs.iSons
		CreateAliasedPrisonerSons(AliasToFill, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)		;create a sons
	
	Else
; 	CWScript.Log("CWMissionScript", self + ": CreateAliasedPrisonerAlly() expected CWScript PlayerAllegience to be 1 or 2, instead got: " + CWs.PlayerAllegiance, 2, true, true)
	EndIf
	
EndFunction

Function CreateAliasedPrisonerEnemy(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls either CreateAliasedPrisonerImperial() or CreateAliasedPrisonerSons() based on the player's allegience}

	if CWs.PlayerAllegiance == CWs.iImperials
		CreateAliasedPrisonerSons(AliasToFill, ReferenceToPlaceAt, CreateDisabled,  aiLevelMod, akZone)		;create and sons (ie enemy of imperials)
	
	ElseIf CWs.PlayerAllegiance == CWs.iSons
		CreateAliasedPrisonerImperial(AliasToFill, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)	;create an imperial (ie enemy of sons)
		
	Else
; 		CWScript.Log("CWMissionScript", self + ": CreateAliasedPrisonerEnemy() expected CWScript PlayerAllegience to be 1 or 2, instead got: " + CWs.PlayerAllegiance, 2, true, true)
	EndIf

EndFunction

Function CreateAliasedSoldierImperial(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, bool IsGuard = true, bool startInFactionNPC = true, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls CreateMissionAliasedActor() creating a CWSoldierImperial or CWSoldierImperialNotGuard, and forcing it into AliasToFill}	
	if IsGuard
		if startInFactionNPC
			CreateMissionAliasedActor(AliasToFill, CWs.CWSoldierImperial, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)
		Else
			CreateMissionAliasedActor(AliasToFill, CWs.CWSoldierImperialNonNPCFaction, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)
		EndIf
	Else
		if startInFactionNPC
			CreateMissionAliasedActor(AliasToFill, CWs.CWSoldierImperialNotGuard, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)
		Else
			CreateMissionAliasedActor(AliasToFill, CWs.CWSoldierImperialNotGuardNonNPCFaction, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)		
		EndIf
		
	EndIf
EndFunction

Function CreateAliasedSoldierSons(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, bool IsGuard = true, bool startInFactionNPC = true, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls CreateMissionAliasedActor() creating a CWSoldierImperial or CWSoldierImperialNotGuard, and forcing it into AliasToFill}	
	if IsGuard
		if startInFactionNPC
			CreateMissionAliasedActor(AliasToFill, CWs.CWSoldierSons, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)
		Else
			CreateMissionAliasedActor(AliasToFill, CWs.CWSoldierSonsNonNPCFaction, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)
		EndIf
	Else
		if startInFactionNPC
			CreateMissionAliasedActor(AliasToFill, CWs.CWSoldierSonsNotGuard, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)
		Else
			CreateMissionAliasedActor(AliasToFill, CWs.CWSoldierSonsNotGuardNonNPCFaction, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)			
		EndIf
	EndIf
EndFunction

Function CreateAliasedCourierImperial(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls CreateMissionAliasedActor() creating a CWCourierImperial or CWCourierImperialNotGuard, and forcing it into AliasToFill}	

		CreateMissionAliasedActor(AliasToFill, CWs.CWCourierImperial, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)

EndFunction

Function CreateAliasedCourierSons(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls CreateMissionAliasedActor() creating a CWCourierImperial or CWCourierImperialNotGuard, and forcing it into AliasToFill}	

		CreateMissionAliasedActor(AliasToFill, CWs.CWCourierSons, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)

EndFunction

Function CreateAliasedPrisonerImperial(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls CreateMissionAliasedActor() creating a CWPrisonerImperial or CWPrisonerImperialNotGuard, and forcing it into AliasToFill}	

		CreateMissionAliasedActor(AliasToFill, CWs.CWPrisonerImperial, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)

EndFunction

Function CreateAliasedPrisonerSons(ReferenceAlias AliasToFill, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls CreateMissionAliasedActor() creating a CWPrisonerImperial or CWPrisonerImperialNotGuard, and forcing it into AliasToFill}	

		CreateMissionAliasedActor(AliasToFill, CWs.CWPrisonerSons, ReferenceToPlaceAt, CreateDisabled, aiLevelMod, akZone)

EndFunction

Function CreateMissionAliasedActor(ReferenceAlias AliasToFill,  ActorBase ActorToPlace, ObjectReference ReferenceToPlaceAt, bool CreateDisabled = false, int aiLevelMod = 4, EncounterZone akZone = None)
{Calls the PlaceActorAtMe() function on ReferenceToPlaceAt, afterword calling ForceRefTo on AliasToFill passing in the actor returned by PlaceAtMe()}

; 	CWScript.Log("CWMissionScript", self + ": CreateMissionAliasedActor() Filling alias: " + AliasToFill + " at reference " + ReferenceToPlaceAt + " by calling PlaceActorAtMe(" + ActorToPlace + ", " + aiLevelMod + ", " + akZone + ")" )
	
	ObjectReference myRef = ReferenceToPlaceAt.PlaceActorAtMe(ActorToPlace, aiLevelMod, akZone)

; 	CWScript.Log("CWMissionScript", self + "CreateMissionAliasedActor() created reference " + myRef + " Will now try to force it into alias " + AliasToFill  )
	
	AliasToFill.ForceRefTo(myRef)
	


	
	if CreateDisabled == True
		AliasToFill.GetReference().disable()
	
	EndIf

	;If the above doesn't work -- there's some evidence to suggest that place at me and forcing into a reference might not happen fast enough to catch the reference before it disappears because it's not persistant
	;Do this instead until we get a function to placeAtMe into an alias directly:
;	AliasToFill.ForceRefTo(Game.GetPlayer().PlaceActorAtMe(ActorToPlace, aiLevelMod, akZone))
;	AliasToFill.GetReference().Moveto(ReferenceToPlaceAt)


EndFunction

Function addAliasToNPCFaction(ReferenceAlias AliasToAdd)
{Adds AliasToAdd to either CWImperialFactionNOC or CWSonsFactionNPC base on whether it is in CWImperialFaction or CWSonsFaction faction. The xxxFactionNPCs are hostile to each other, often you may create soldiers who are not in the NPC faction so they don't aggro on each other, then you add them via this function so they do.}
	Actor ActorRef = AliasToAdd.GetActorReference()
	
	if ActorRef.IsInFaction(CWs.CWImperialFaction)
; 		CWScript.Log("CWMissionScript", self + ": addAliasToNPCFaction(" + AliasToAdd + ") to CWImperialFactionNPC." )
		ActorRef.AddToFaction(CWs.CWImperialFactionNPC)
		
	ElseIf ActorRef.IsInFaction(CWs.CWSonsFaction)
; 		CWScript.Log("CWMissionScript", self + ": addAliasToNPCFaction(" + AliasToAdd + ") to CWSonsFaction." )
		ActorRef.AddToFaction(CWs.CWSonsFactionNPC)	
	
	Else
; 		CWScript.Log("CWMissionScript", self + "WARNING: addAliasToNPCFaction(" + AliasToAdd + ") is not in either CWImperialFaction nor CWSonsFaction so we can't add it to CWImperialFactionNPC nor CWSonsFactionNPC.", 2, true, true)
	
	EndIf
	




EndFunction

Function ResetCommonMissionProperties()
{Resets properties on CWMissionScript that all CWMissions inherit}

	;When the scripting system handles resetting properties on quest start, this might not be needed anymore.

; 	CWScript.Log("CWMissionScript", self + ": ResetCommonMissionProperties() resetting properties.")
	acceptedMission = 0
	foundRendezvous = 0
	objectiveCompleted = 0
	countResources = 0
	countFarms = 0
	countMills = 0
	countMines = 0

EndFunction

Function SetMissionFailDay()	;usually called by Stage 10 and as a safety in CWMissionPollForFailDayScript
	failDay = CWs.GameDaysPassed.value + CWCampaignS.missionDays
	CWs.CWMissionFailDay.value = failDay
	UpdateCurrentInstanceGlobal(CWs.CWMissionFailDay)
; 	CWScript.Log("CWMissionScript", self + ": setting FailDay to " + failDay)
EndFunction

;***OBSOLETE***
Function RegisterMissionTypeWithCampaign(int Type, int ResolutionType = 0)
{Takes an integer represeting the mission type, and based on the MissionNumberRef sets the corresponding MissionXType property in the CWCampaign}
	
	if ResolutionType == 0	;this is non-zero when called by a CWResolutionXX quest
	
		if MissionNumber == 1
; 			CWScript.Log("CWMissionScript", self + ": RegisterMissionTypeWithCampaign() registering type " + Type + " for CWCampaignScript.Mission1Type.")
			CWCampaignS.Mission1Type = Type
		
		ElseIf MissionNumber == 2
; 			CWScript.Log("CWMissionScript", self + ": RegisterMissionTypeWithCampaign() registering type " + Type + " for CWCampaignScript.Mission2Type.")
			CWCampaignS.Mission2Type = Type
			
		EndIf
		

	Else	;we are a Resolution Mission
; 		CWScript.Log("CWMissionScript", self + ": RegisterMissionTypeWithCampaign() registering type " + ResolutionType + " for CWCampaignScript.ResolutionMissionType.")
		CWCampaignS.ResolutionMissionType = ResolutionType
	
	EndIf

;OBSOLETE FUNCTIONALITY -- WE AREN'T DOING SEQUENTIAL CAMPAIGNS ANYMORE
;		campaignPhase = CWCampaignS.CWCampaignPhase.value as int
;		countCampaigns = CWs.countCampaigns
	
EndFunction


function FlagFieldCOWithPotentialMissionFactions(int MissionType = -1, Bool ShouldRemoveFromFactions = False, int ForceMissionNumber = 0)
	
; 	CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithPotentialMissionFactions()")
	
	Actor FieldCOActor = FieldCo.GetActorReference()
	
	if ForceMissionNumber > 0
		MissionNumber = 1
	EndIf
	
	if ShouldRemoveFromFactions == False ;called when quest is starting up
		if MissionNumber == 1
; 			CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithPotentialMissionFactions() found MissionNumber = 1, will add FieldCO " + FieldCOActor + " to CWFieldCOPotentialMission1Faction with rank meaning mission type = " + MissionType)
			FieldCOActor.SetFactionRank(CWs.CWFieldCOPotentialMission1Faction, MissionType)
		
		elseif MissionNumber == 2
; 			CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithPotentialMissionFactions() found MissionNumber = 2, will add FieldCO " + FieldCOActor + " to CWFieldCOPotentialMission2Faction with rank meaning mission type = " + MissionType)
			FieldCOActor.SetFactionRank(CWs.CWFieldCOPotentialMission2Faction, MissionType)
		
		Else
; 			CWScript.Log("CWMissionScript", self + " WARNING: FlagFieldCOWithPotentialMissionFactions() found unexpected mission number. Expected 1 or 2, found: " + MissionNumber, 2, true, true)
			
		EndIf

	Else	;ShouldRemoveFromFactions == true; called when quest is shutting down
		if MissionNumber == 1
; 			CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithPotentialMissionFactions() (called with ShouldRemoveFromFactions param == true) found MissionNumber = 1, will REMOVE FieldCO " + FieldCOActor + " from CWFieldCOPotentialMission1Faction")
			FieldCOActor.RemoveFromFaction(CWs.CWFieldCOPotentialMission1Faction)
		
		elseif MissionNumber == 2
; 			CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithPotentialMissionFactions() (called with ShouldRemoveFromFactions param == true) found MissionNumber = 2, will REMOVE FieldCO " + FieldCOActor + " from CWFieldCOPotentialMission2Faction")
			FieldCOActor.RemoveFromFaction(CWs.CWFieldCOPotentialMission2Faction)
		
		Else
; 			CWScript.Log("CWMissionScript", self + "WARNING: FlagFieldCOWithPotentialMissionFactions() found unexpected mission number. Expected 1 or 2, found: " + MissionNumber, 2, true, true)
			
		EndIf
	
	
	EndIf
		
EndFunction

Function FlagFieldCOWithActiveQuestFaction(int MissionType = -1, Bool ShouldRemoveFromFactions = False)
; 	CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithActiveQuestFaction()")
	
	Actor FieldCOActor = FieldCo.GetActorReference()
	
	if ShouldRemoveFromFactions == False ;called when quest is accepted up
; 		CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithActiveQuestFaction() will add FieldCO " + FieldCOActor + " to CWFieldCOActiveMissionFaction with rank meaning mission type = " + MissionType + ", and will remove from CWFieldCO Potential Mission Factions")
		FieldCOActor.SetFactionRank(CWs.CWFieldCOActiveMissionFaction, MissionType)
		FlagFieldCOWithPotentialMissionFactions(ShouldRemoveFromFactions = True)
		
	Else	;ShouldRemoveFromFactions == true; called when quest is shutting down
; 		CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithActiveQuestFaction() (called with ShouldRemoveFromFactions param == true) found MissionNumber = 1, will REMOVE FieldCO " + FieldCOActor + " from CWFieldCOActiveMissionFaction")
		FieldCOActor.RemoveFromFaction(CWs.CWFieldCOActiveMissionFaction)

; 		CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithActiveQuestFaction() (called with ShouldRemoveFromFactions param == true) now calling RemoveFieldCOFromHooksAcceptedFaction()")

	EndIf
		

EndFunction

Function FlagFieldCOWithMissionResultFaction(int MissionType = -1, Bool MissionFailure = False)
; 	CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithMissionResultFaction()")
	
	Actor FieldCOActor = FieldCo.GetActorReference()
	
	if MissionFailure == False ;called when quest is succeeded
; 		CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithMissionResultFaction() will add FieldCO " + FieldCOActor + " to CWFieldCOSuccessfulMissionFaction with rank meaning mission type = " + MissionType)
		FieldCOActor.SetFactionRank(CWs.CWFieldCOSuccessfulMissionFaction, MissionType)

		;incrementing new tracking variable:
		float newCount = CWs.CWCountMissionsDone.GetValue() + 1
		
; 		CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithMissionResultFaction() setting CWCountMissionsDone global to:" + newCount)
		CWs.CWCountMissionsDone.SetValue(newCount)
		
		
	Else	;MissionFailure == true; called when quest is failed
; 		CWScript.Log("CWMissionScript", self + ": FlagFieldCOWithMissionResultFaction() will add FieldCO " + FieldCOActor + " to CWFieldCOFailedMissionFaction with rank meaning mission type = " + MissionType)
		FieldCOActor.SetFactionRank(CWs.CWFieldCOFailedMissionFaction, MissionType)
		
	EndIf
	
EndFunction

Function RemoveFieldCOFromHooksAcceptedFaction()
		Actor FieldCOActor = FieldCo.GetActorReference()

; 		CWScript.Log("CWMissionScript", self + ": RemoveFieldCOFromAcceptedHooksFaction() will remove " + FieldCOActor + "from CWFieldCOHooksAcceptedFaction")
		FieldCOActor.RemoveFromFaction(CWs.CWFieldCOHooksAcceptedFaction)
		
EndFunction

function ProcessFieldCOFactionsOnQuestShutDown()

; 	CWScript.Log("CWMissionScript", self + ": ProcessFieldCOFactionsOnQuestShutDown()")
	
	
	;only remove him from active quest faction if the mission was attempted and succeeded or failed
	if GetStageDone(200) || GetStageDone(205) || GetStageDone(9000)
; 		CWScript.Log("CWMissionScript", self + ": ProcessFieldCOFactionsOnQuestShutDown() calling FlagFieldCOWithActiveQuestFaction(ShouldRemoveFromFactions = True) AND RemoveFieldCOFromHooksAcceptedFaction()")
		FlagFieldCOWithActiveQuestFaction(ShouldRemoveFromFactions = True)
		RemoveFieldCOFromHooksAcceptedFaction()
	EndIf

EndFunction

Function SetResourceCountProperties(ReferenceAlias ResourceObject1, ReferenceAlias ResourceObject2, ReferenceAlias ResourceObject3)
{Calls CWCampaignScript.GetFarmCount(), CWCampaignScript.GetMillCount(), CWCampaignScript.GetMineCount() and sets countResources, countFarms, countMills, and countMines properties in this script.}

	CountFarms = CWCampaignS.GetCountFarms(ResourceObject1, ResourceObject2, ResourceObject3)
	CountMills = CWCampaignS.GetCountMills(ResourceObject1, ResourceObject2, ResourceObject3)
	CountMines = CWCampaignS.GetCountMines(ResourceObject1, ResourceObject2, ResourceObject3)
	CountResources = 	CountFarms + CountMines + CountMills

	resource1Type = CWCampaignS.GetResourceType(ResourceObject1)
	
; 	CWScript.Log("CWMissionScript", self + ": SetResourceCountProperties() CountFarms =" + CountFarms + ", CountMills =" + CountMills + ", CountMines = " + CountMines + "; CountResources = " + CountResources + "; Resource1Type =" + Resource1Type)
	
EndFunction

Function RegisterResourceObjectAliasesForUpdate(ReferenceAlias ResourceObject1 = None, ReferenceAlias ResourceObject2 = none, ReferenceAlias ResourceObject3 = None)
	if ResourceObject1.getReference()
		ResourceObject1.RegisterForUpdate(5)
	EndIf
	if ResourceObject2.getReference()
		ResourceObject2.RegisterForUpdate(5)
	EndIf
	if ResourceObject3.getReference()
		ResourceObject3.RegisterForUpdate(5)
	EndIf

EndFunction

Function UnregisterResourceObjectAliasesForUpdate(ReferenceAlias ResourceObject1, ReferenceAlias ResourceObject2, ReferenceAlias ResourceObject3)
	if ResourceObject1.getReference()
		ResourceObject1.UnRegisterForUpdate()
	EndIf
	if ResourceObject2.getReference()
		ResourceObject2.UnRegisterForUpdate()
	EndIf
	if ResourceObject3.getReference()
		ResourceObject3.UnRegisterForUpdate()
	EndIf

EndFunction


Function RegisterLocationAttacked(Location HoldLocation, location AttackedLocation, int iFaction = 0)
{Called by any mission where a settlement is attacked violently in such a way that people *could* condemn the action. Default iFaction doing the attacking is the CW.Attacker}
; 	CWScript.Log("CWMissionScript", self + "RegisterLocationAttacked()")
	CWs.RegisterLocationAttacked(HoldLocation, AttackedLocation, iFaction)
	
EndFunction

function ToggleOffComplexWIInteractions(LocationAlias LocationAliasToToggle)
; 	CWScript.Log("CWMissionScript", self + "ToggleOffComplexWIInteractions(" + LocationAliasToToggle + ") calling function on CWScript")
	CWs.ToggleOffComplexWIInteractions(LocationAliasToToggle)

EndFunction

function ToggleOnComplexWIInteractions(LocationAlias LocationAliasToToggle)
; 	CWScript.Log("CWMissionScript", self + "ToggleOnComplexWIInteractions(" + LocationAliasToToggle + ") calling function on CWScript")
	CWs.ToggleOnComplexWIInteractions(LocationAliasToToggle)

EndFunction
