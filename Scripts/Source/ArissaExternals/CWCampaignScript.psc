Scriptname CWCampaignScript extends Quest  Conditional

;#POINTER TO GLOBAL SHOW DEBUG TRACES
GlobalVariable property debugOn auto conditional					;0 = unset, 1 = set - show warnings
{Pointer to Global CWDebugOn, used to toggle campaign start message}


int property initCampaign auto conditional hidden ;0 = unset, 1 = running through initialization quest stages, -1 = finished

int property costPatrol auto conditional hidden 
int property ownerPatrol1 auto conditional hidden 
int property ownerPatrol2 auto conditional hidden 
int property ownerPatrol3 auto conditional hidden 
int property ownerPatrol4 auto conditional hidden 
int property ownerPatrol5 auto conditional hidden 

;What type each each offered mission? Used to flavor initial dialog when Field Officer is offering player missions
int property Mission1Type auto conditional	 hidden 						
int property Mission2Type auto conditional hidden 
int property Mission3Type auto conditional hidden 
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
;200 - Fort Siege

;N = TBD


;*** Below is for debugging what is changing the properties in script -- note, this will break conditions functions, but I'm leaving it here for future reference.
;int __Mission1Type
;int property Mission1Type 
;	int function get()
;		return __Mission1Type
;	endFunction
;	function set(int value)
; ;		debug.tracestack("CWCampaignScript Mission1Type being set to: " + value)
;		__Mission1Type = value
;	endFunction
;endProperty

;int __Mission2Type
;int property Mission2Type
;	int function get()
;		return __Mission2Type
;	endFunction
;	function set(int value)
; ;		debug.tracestack("CWCampaignScript Mission2Type being set to: " + value)
;		__Mission2Type = value
;	endFunction
;endProperty



int Property ResolutionMissionType Auto Conditional Hidden
;1 = Attack Minor Hold Capital
;2 = Defend Minor Hold Capital
;3 = Attack Major Hold Capital
;4 = Defend Major Hold Capital

int property acceptedHooks auto conditional hidden 					;0 = un/reset, 1 = player has heard the opening mission hooks (unlocks mission topics)
int property acceptedMission auto conditional hidden 				;0 = un/reset, 1 = player has accepted a mission (suppresses other mission topics)

int Property acceptedTutorialHooks	Auto Conditional Hidden			;0 = un/reset, 1 = player has heard the opening mission hooks (unlocks mission topics)


int property resolutionPhase auto conditional hidden 		; N = at what CWCampaignPhase are we considered to be in the "resolution" phase, meaning the final mission (which can also resolve offscreen if player is absent)
																	;Reminder: GLOBAL CWCampaignPhase is the current phase

int property resolveOffscreen auto conditional hidden 		;0 = un/reset, 1 = waiting for CW to resolve offscreen and set this quest's stage 255 to stop it

int Property currentAttackDelta auto Conditional Hidden

int attackDeltaMissionBonus 	; this variable holds bonus attack delta points earned by completing certain CWMission quests -- see Add/SetAttackDeltaMissionBonus()

;"timer" variables
float property acceptDays auto conditional	 hidden 			;(set in stage 1) How many days we allow the player to accept a mission before advancing the phase without him
float property nextPhaseDay auto conditional hidden 			;At start of each phase, GameDaysPassed + acceptDays, after which we advance the phase
float property missionDays auto conditional hidden 			;(set in stage 1) How many days we allow the player to complete an accepted mission before we consider it a failure
int property failedMission auto conditional hidden 			;0 = unset, -N = player got dialog about failing mission, N = player just failed a mission of the numeric Mission type and should get dialogue about it (see comment under property "Mission1Type" above
int property completedMission auto conditional hidden 		;0 = unset, -N player got dialog about completing mission, N = player just completed a mission of the numeric Mission type and should get dialgoue about it (see comment under property "Mission1Type" above




int Property MissionAcceptancePollWait auto Hidden 						;How long to wait between ticks to poll for MissionAcceptance (see PollForMissionAcceptance())

int Property AttackDeltaBonusForKillingCapitalGarrison auto hidden						;how many points to add to the AttackDelta if the player killed all the guards in the capital location
Float Property AttackDeltaGarrisonValueModifierForDestroyingResource auto Hidden		;A multiplier to a garrison's cost when turning that garrison into a CurrentAttackDelta points... when the player destroys a resource, the garrison should contribute less to the attack delta. This is the multiplier that reflects that. Set in OnInit()


;## Quests ##
Quest Property CW  Auto  
{Pointer to CW Quest}

Quest Property CWMission00 Auto

Quest Property CWSiege Auto
{Pointer to CWSiegeScript on CWSiege}

;## Aliases ##
;Pointers to CWCampaign Aliases:

ReferenceAlias Property CampaignStartMarker auto

ReferenceAlias property Rikke Auto
ReferenceAlias property Galmar Auto

ReferenceAlias property GenericFieldCOImperial Auto
ReferenceAlias property GenericFieldCOSons Auto

ReferenceAlias property FieldCO Auto			;Actual field officer for player's faction (Rikke, or Galmar)
ReferenceAlias property EnemyFieldCO Auto		;Actual field officer for player's enemy (Generic Field Commander Imperial / Sons)

LocationAlias Property Hold	 Auto


LocationAlias Property Garrison1 Auto
LocationAlias Property Garrison2 Auto
LocationAlias Property Garrison3 Auto
LocationAlias Property Garrison4 Auto

ReferenceAlias Property Garrison1ResourceObject Auto
ReferenceAlias Property Garrison2ResourceObject Auto
ReferenceAlias Property Garrison3ResourceObject Auto
ReferenceAlias Property Garrison4ResourceObject Auto

LocationAlias Property Fort Auto

LocationAlias Property GarrisonDefenderOnly1 Auto
LocationAlias Property GarrisonDefenderOnly2 Auto
LocationAlias Property GarrisonDefenderOnly3 Auto
LocationAlias Property GarrisonDefenderOnly4 Auto
LocationAlias Property GarrisonDefenderOnly5 Auto
LocationAlias Property GarrisonDefenderOnly6 Auto

ReferenceAlias Property GarrisonDefenderOnly1ResourceObject Auto
ReferenceAlias Property GarrisonDefenderOnly2ResourceObject Auto
ReferenceAlias Property GarrisonDefenderOnly3ResourceObject Auto
ReferenceAlias Property GarrisonDefenderOnly4ResourceObject Auto


LocationAlias Property Capital Auto
LocationAlias Property CapitalHQ Auto

LocationAlias Property CampImperial Auto
LocationAlias Property CampSons Auto

LocationAlias Property FieldHQ Auto
LocationAlias Property EnemyFieldHQ Auto

ReferenceAlias Property CampEnableImperial Auto
ReferenceAlias Property CampEnableSons Auto

ReferenceAlias Property CampImperialLocationCenterMarker Auto
ReferenceAlias Property CampSonsLocationCenterMarker Auto
ReferenceAlias Property CapitalHQMarker Auto


LocationAlias Property Patrols Auto

ReferenceAlias Property PatrolsDefaultEnableImperial Auto
ReferenceAlias Property PatrolsDefaultEnableSons Auto


ReferenceAlias Property PatrolsEnableImperial1 Auto
ReferenceAlias Property PatrolsEnableImperial2 Auto
ReferenceAlias Property PatrolsEnableImperial3 Auto
ReferenceAlias Property PatrolsEnableImperial4 Auto
ReferenceAlias Property PatrolsEnableImperial5 Auto


ReferenceAlias Property PatrolsEnableSons1 Auto
ReferenceAlias Property PatrolsEnableSons2 Auto
ReferenceAlias Property PatrolsEnableSons3 Auto
ReferenceAlias Property PatrolsEnableSons4 Auto
ReferenceAlias Property PatrolsEnableSons5 Auto

;# EXTERNAL aliases:
;CWCampaignObj Aliases:
ReferenceAlias Property CWCampaignObjFieldCO Auto
ReferenceAlias Property CWCampaignObjFactionLeader Auto
ReferenceAlias Property CWCampaignObjCampaignStartMarker Auto
LocationAlias Property CWCampaignObjCampaignHold Auto


;## Globals ##
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property CWCampaignPhase Auto
GlobalVariable Property ResourceDestroyedAtStage Auto
GlobalVariable Property CWDebugSkipPurchase Auto		;if == 1, skips purchaing garrisons

;## Keywords ##
Keyword Property CWOwner Auto
Keyword Property CWCost Auto
Keyword Property CWPurchasedByAttacker Auto

Keyword Property CWMissionStart Auto
Keyword Property CWResolution01Start  Auto		;attack settlement capital resolution mission
Keyword Property CWResolution02Start  Auto		;defend settlement capital resolution mission
Keyword Property CWMissionTutorialStart Auto
Keyword Property CWSiegeStart Auto		;used to start siege attack and defend quests for cities


Keyword Property LocTypeCity Auto
Keyword Property LocTypeHabitation Auto

;## Location Ref Types ##
LocationRefType Property CWSoldier Auto
LocationRefType Property CWPatrolDefault Auto
LocationRefType Property CWPatrol1 Auto
LocationRefType Property CWPatrol2 Auto
LocationRefType Property CWPatrol3 Auto
LocationRefType Property CWPatrol4 Auto
LocationRefType Property CWPatrol5 Auto



;## Object References ##
ObjectReference Property CWMission1Ref Auto	;Passed in to SendStoryEvent when generating mission quests as a way to identify which mission #
ObjectReference Property CWMission2Ref Auto	;Passed in to SendStoryEvent when generating mission quests as a way to identify which mission #
ObjectReference Property CWMission3Ref Auto	;Passed in to SendStoryEvent when generating mission quests as a way to identify which mission #

;## Activators ##

;*** !! *** !! *** !! these are now just forms, and will be set with Game.GetForm(HEX ID) function rather than being pointed at in the editor. As soon as we get Activator objects in Papyrus, this need to change to point directly at the activators
Form Property ResourceObjectFarm auto		;*** !!! TEMPORARILY SET IN OnInit() event using GetForm().... REMOVE THAT FROM THE OnInit() event
Form Property ResourceObjectMill auto		;*** !!! TEMPORARILY SET IN OnInit() event using GetForm().... REMOVE THAT FROM THE OnInit() event
Form Property ResourceObjectMine auto		;*** !!! TEMPORARILY SET IN OnInit() event using GetForm().... REMOVE THAT FROM THE OnInit() event


;## Scripts ##
;These will be assigned in the OnInit() block
CWScript Property CWs Auto hidden


;# SetOwner() Location Variables 	-- these should be arrays, consider converting when we get arrays implemented in the language											
;Variables for holding locations that are purchased so we can pass them all to CWScript SetOwner()
Location PurchasedLocationImperial1
Location PurchasedLocationImperial2
Location PurchasedLocationImperial3
Location PurchasedLocationImperial4
Location PurchasedLocationImperial5
Location PurchasedLocationImperial6
Location PurchasedLocationImperial7
Location PurchasedLocationImperial8
Location PurchasedLocationImperial9
Location PurchasedLocationImperial10
Location PurchasedLocationImperial11
Location PurchasedLocationImperial12
Location PurchasedLocationImperial13
Location PurchasedLocationImperial14
Location PurchasedLocationImperial15
Location PurchasedLocationImperial16
Location PurchasedLocationImperial17
Location PurchasedLocationImperial18
Location PurchasedLocationImperial19
Location PurchasedLocationImperial20


Location PurchasedLocationSons1
Location PurchasedLocationSons2
Location PurchasedLocationSons3
Location PurchasedLocationSons4
Location PurchasedLocationSons5
Location PurchasedLocationSons6
Location PurchasedLocationSons7
Location PurchasedLocationSons8
Location PurchasedLocationSons9
Location PurchasedLocationSons10
Location PurchasedLocationSons11
Location PurchasedLocationSons12
Location PurchasedLocationSons13
Location PurchasedLocationSons14
Location PurchasedLocationSons15
Location PurchasedLocationSons16
Location PurchasedLocationSons17
Location PurchasedLocationSons18
Location PurchasedLocationSons19
Location PurchasedLocationSons20

Location PurchasedLocationBothFactions1
Location PurchasedLocationBothFactions2
Location PurchasedLocationBothFactions3
Location PurchasedLocationBothFactions4
Location PurchasedLocationBothFactions5
Location PurchasedLocationBothFactions6
Location PurchasedLocationBothFactions7
Location PurchasedLocationBothFactions8



Event OnInit()
	CWs = CW as CWScript
	
; 	CWScript.Log("CWCampaignScript", " OnInit() setting default property values.", 0, True, True)

	AcceptDays = 5
	MissionDays = 2
	ResolutionPhase = 4
	
	MissionAcceptancePollWait = 5	;wait this many seconds inside the while loop in PollForMissionAcceptance() function
	
	AttackDeltaBonusForKillingCapitalGarrison = 2
	AttackDeltaGarrisonValueModifierForDestroyingResource = 0.50	;destroying the resource object at a garrison halves it value
	


	;*** !!! *** !!! TEMPORARY HACK UNTIL WE GET ACTIVATORS IN AS OBJECT TYPES -- these should be set in editor
	ResourceObjectFarm = Game.GetForm(0X0001DA07)	;**** !!!! **** !!!!! THIS IS TEMPORARY WORK AROUND UNTIL WE GET ACTIVATOR OBJECTS IN PAPYRUS -- when that happens this property will be set in the editor in the CWCampaign quest
	ResourceObjectMill = Game.GetForm(0X0001DA0C)	;**** !!!! **** !!!!! THIS IS TEMPORARY WORK AROUND UNTIL WE GET ACTIVATOR OBJECTS IN PAPYRUS -- when that happens this property will be set in the editor in the CWCampaign quest
	ResourceObjectMine = Game.GetForm(0X0001DA0D)	;**** !!!! **** !!!!! THIS IS TEMPORARY WORK AROUND UNTIL WE GET ACTIVATOR OBJECTS IN PAPYRUS -- when that happens this property will be set in the editor in the CWCampaign quest
	;*** !!! *** !!! 
	
EndEvent


Function ResetCampaign()

; 	CWScript.Log("CWCampaignScript", " ResetCampaign() resetting property values.")
	Mission1Type = 0
	Mission2Type = 0
	Mission3Type = 0

	acceptedHooks = 0
	acceptedMission = 0
	
	completedMission = 0	
	failedMission = 0		
	
	ownerPatrol1 = 0
	ownerPatrol2 = 0
	ownerPatrol3 = 0
	ownerPatrol4 = 0
	ownerPatrol5 = 0

	unsetPurchasedLocations()
	
	attackDeltaMissionBonus = 0
	
	nextPhaseDay = GameDaysPassed.value + acceptDays 	;init value (note this is immediately updated again in stage 150, that's fine.)

	CWCampaignPhase.value = 0							;reset global (note this is immediately incremented to 1 by stage 150)
	resolveOffscreen = 0						;reset variable
		
EndFunction

Function PurchaseGarrisons()
{Depending on the CW.PurchaseDelta assign various garrisons and patrols to the attacker and defender.}

	;If PurchaseDelta is > 0 it means the attackers have the advantage and can purchase additional garrisons and patrols, if the PurchaseDelta < 0 it means the defenders have the advantage and have all the garrisons and can purchase additional patrols

; 	CWScript.Log("CWCampaignScript", " PurchaseGarrisons() begining to purchase garrisons. Starting PurchaseDelta = " + CWs.PurchaseDelta)

	if CWDebugSkipPurchase.value == 1
; 		CWScript.Log("CWCampaignScript", ": CWDebugSkipPurchase == 1, we are skipping call to PurchaseGarrison()", 1)
		return
	EndIf
	
	unsetPurchasedLocations() ;### used with CallSetOwnerForPurchasedLocations() -- this would be easier if we had arrays
	
	
	;## 4-16-2010 -- jduvall
	;NOTE: Purchasing used to happen before resetting the defender only, camps, and patrols... I don't think there was any particular reason to do this, and since things go a little faster if the defender only stuff goes first because it includes the capital which takes the longest to process, I am now putting it first through the SetOwner() switchboard, it'll process its stuff while other garrisons are also being processed	
	;Hopefully this doesn't break anythingm if it does just but the "reset" stuff back below the "Purchased" stuff
	;## -----------------------------
	
	;"Purchased" THINGS THAT DON'T GET PURCHASED WITH ATTACK DELTA -- everything gets put in PurchasedLocationXXXn variables simulating an array -- see CallSetOwnerForPurchasedLocations()
	;Reset the defender only garrisons
	ResetDefenderOnlyGarrisons()
	
	;Reset the camps
	ResetCamps()
	
	;reset the shared Patrols location
	ResetPatrols()
	
	
	;PURCHASE GARRISONS AND PATROLS -- everything gets put in PurchasedLocationXXXn variables simulating an array -- see CallSetOwnerForPurchasedLocations()
	;Attempt to purchase garrisons
	PurchaseGarrisonLocationAlias(Garrison1)
	PurchaseGarrisonLocationAlias(Garrison2)
	PurchaseGarrisonLocationAlias(Garrison3)
	PurchaseGarrisonLocationAlias(Garrison4)
	
	PurchaseGarrisonLocationAlias(Fort)
	
	;Purchase additional patrols if there is any AttackDelta left:   see EnablePatrols() call below
	ownerPatrol1 = PurchasePatrolAndReturnNewOwner(1)
	ownerPatrol2 = PurchasePatrolAndReturnNewOwner(2)
	ownerPatrol3 = PurchasePatrolAndReturnNewOwner(3)
	ownerPatrol4 = PurchasePatrolAndReturnNewOwner(4)
	ownerPatrol5 = PurchasePatrolAndReturnNewOwner(5)
	
	;ENABLE THE PURCHASED PATROLS -- not these don't get passed into to SetOwner() via a PurchasedLocationXXXn variable, because these patrols are just turned on/off by toggling xmarkers, see the EnablePatrols() function below.
	;Enable patrols that have been purchased by enabling the proper enable markers
	EnablePatrols()

	CallSetOwnerForPurchasedLocations() ;### Calls CWs.SetOwner() for each of the purchased locations -- this would be easier if we had arrays
	
	
EndFunction


Function PurchaseGarrisonLocationAlias(LocationAlias GarrisonAlias)
{Calls PurchaseGarrisonLocation() with the location of the supplied alias, if the alias isn't empty}
	Location Loc = GarrisonAlias.Getlocation()
	
	If Loc != None
		PurchaseGarrisonLocation(Loc)
	EndIf

EndFunction

Function PurchaseGarrisonLocation(Location GarrisonLocation)
{If attacker has enough attack points (ie a large enough positive value in CW.PurchaseDelta) award the garrison ownership to attacker and subtract Purchase Delta, otherwise award to the defender.}
	int cost = GarrisonLocation.GetKeywordData(CWCost) as int
	int newOwner		;1 = Imperials, 2 = Sons -- will correspond to Attacker and Defender property on CWScript attached to CW quest

	If CWs.PurchaseDelta >= Cost	;award to attacker
		newOwner = CWs.Attacker
		CWs.PurchaseDelta = (CWs.PurchaseDelta - cost)
		GarrisonLocation.SetKeywordData(CWPurchasedByAttacker, 1)
; 		CWScript.Log("CWCampaignScript", " PurchaseGarrison() purchasing " + GarrisonLocation + " for attacker(" + CWs.FactionName(newOwner) + ") and flagged for reset")
		
	Else	;award to defender
		newOwner = CWs.Defender
; 		CWScript.Log("CWCampaignScript", " PurchaseGarrison() purchasing " + GarrisonLocation + " for defender(" + CWs.FactionName(newOwner) + ") and flagged for reset")
		GarrisonLocation.SetKeywordData(CWPurchasedByAttacker, 0)
		;There is no cost for the defender to purchase a garrison... he owns it by default
		
	EndIf

	SetPurchasedLocation(GarrisonLocation, NewOwner)
	
EndFunction

Function unsetPurchasedLocations()
	PurchasedLocationImperial1 = None
	PurchasedLocationImperial2 = None
	PurchasedLocationImperial3 = None
	PurchasedLocationImperial4 = None
	PurchasedLocationImperial5 = None
	PurchasedLocationImperial6 = None
	PurchasedLocationImperial7 = None
	PurchasedLocationImperial8 = None
	PurchasedLocationImperial9 = None
	PurchasedLocationImperial10 = None
	PurchasedLocationImperial11 = None
	PurchasedLocationImperial12 = None
	PurchasedLocationImperial13 = None
	PurchasedLocationImperial14 = None
	PurchasedLocationImperial15 = None
	PurchasedLocationImperial16 = None
	PurchasedLocationImperial17 = None
	PurchasedLocationImperial18 = None
	PurchasedLocationImperial19 = None
	PurchasedLocationImperial20 = None

	PurchasedLocationSons1 = None
	PurchasedLocationSons2 = None
	PurchasedLocationSons3 = None
	PurchasedLocationSons4 = None
	PurchasedLocationSons5 = None
	PurchasedLocationSons6 = None
	PurchasedLocationSons7 = None
	PurchasedLocationSons8 = None
	PurchasedLocationSons9 = None
	PurchasedLocationSons10 = None
	PurchasedLocationSons11 = None
	PurchasedLocationSons12 = None
	PurchasedLocationSons13 = None
	PurchasedLocationSons14 = None
	PurchasedLocationSons15 = None
	PurchasedLocationSons16 = None
	PurchasedLocationSons17 = None
	PurchasedLocationSons18 = None
	PurchasedLocationSons19 = None
	PurchasedLocationSons20 = None
	
	PurchasedLocationBothFactions1 = None
	PurchasedLocationBothFactions2 = None
	PurchasedLocationBothFactions3 = None
	PurchasedLocationBothFactions4 = None
	PurchasedLocationBothFactions5 = None
	PurchasedLocationBothFactions6 = None
	PurchasedLocationBothFactions7 = None
	PurchasedLocationBothFactions8 = None
EndFunction

Function SetPurchasedLocation(Location LocationThatWasPurchased, int OwningFaction)
; 	CWScript.Log("CWCampaignScript", " SetPurchasedLocation() LocationThatWasPurchased: " + LocationThatWasPurchased + ", OwningFaction:(" + OwningFaction + ")")

	if owningFaction == CWs.iImperials
		if 	!PurchasedLocationImperial1
			PurchasedLocationImperial1 = LocationThatWasPurchased
			
		elseif !PurchasedLocationImperial2
			PurchasedLocationImperial2 = LocationThatWasPurchased
			
		elseif !PurchasedLocationImperial3
			PurchasedLocationImperial3 = LocationThatWasPurchased
		
		elseif	!PurchasedLocationImperial4
			PurchasedLocationImperial4 = LocationThatWasPurchased
		
		ElseIf	!PurchasedLocationImperial5
			PurchasedLocationImperial5 = LocationThatWasPurchased
		
		ElseIf	!PurchasedLocationImperial6
			PurchasedLocationImperial6 = LocationThatWasPurchased
		
		ElseIf	!PurchasedLocationImperial7
			PurchasedLocationImperial7 = LocationThatWasPurchased
		
		ElseIf	!PurchasedLocationImperial8
			PurchasedLocationImperial8 = LocationThatWasPurchased
			
		ElseIf	!PurchasedLocationImperial9
			PurchasedLocationImperial9 = LocationThatWasPurchased

		ElseIf	!PurchasedLocationImperial10
			PurchasedLocationImperial10 = LocationThatWasPurchased
			
		Elseif !PurchasedLocationImperial11
			PurchasedLocationImperial11 = LocationThatWasPurchased
			
		elseif !PurchasedLocationImperial12
			PurchasedLocationImperial12 = LocationThatWasPurchased
			
		elseif !PurchasedLocationImperial13
			PurchasedLocationImperial13 = LocationThatWasPurchased
		
		elseif	!PurchasedLocationImperial14
			PurchasedLocationImperial14 = LocationThatWasPurchased
		
		ElseIf	!PurchasedLocationImperial15
			PurchasedLocationImperial15 = LocationThatWasPurchased
		
		ElseIf	!PurchasedLocationImperial16
			PurchasedLocationImperial16 = LocationThatWasPurchased
		
		ElseIf	!PurchasedLocationImperial17
			PurchasedLocationImperial17 = LocationThatWasPurchased
		
		ElseIf	!PurchasedLocationImperial18
			PurchasedLocationImperial18 = LocationThatWasPurchased
			
		ElseIf	!PurchasedLocationImperial19
			PurchasedLocationImperial19 = LocationThatWasPurchased

		ElseIf	!PurchasedLocationImperial20
			PurchasedLocationImperial20 = LocationThatWasPurchased
			
		Else
; 			CWScript.Log("CWCampaignScript", " ERROR!!! SetPurchasedLocation() ran out of PurchaseLocationXXXn variables. LocationThatWasPurchased: " + LocationThatWasPurchased + ", OwningFaction: " + OwningFaction, 2  )
		
		EndIf
	
	elseif owningFaction == CWs.iSons
	
		if !PurchasedLocationSons1
			PurchasedLocationSons1 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons2
			PurchasedLocationSons2 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons3
			PurchasedLocationSons3 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons4
			PurchasedLocationSons4 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons5
			PurchasedLocationSons5 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons6
			PurchasedLocationSons6 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons7
			PurchasedLocationSons7 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons8
			PurchasedLocationSons8 = LocationThatWasPurchased

		ElseIf !PurchasedLocationSons9
			PurchasedLocationSons9 = LocationThatWasPurchased

		ElseIf !PurchasedLocationSons10
			PurchasedLocationSons10 = LocationThatWasPurchased

		Elseif !PurchasedLocationSons11
			PurchasedLocationSons11 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons12
			PurchasedLocationSons12 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons13
			PurchasedLocationSons13 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons14
			PurchasedLocationSons14 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons15
			PurchasedLocationSons15 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons16
			PurchasedLocationSons16 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons17
			PurchasedLocationSons17 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationSons18
			PurchasedLocationSons18 = LocationThatWasPurchased

		ElseIf !PurchasedLocationSons19
			PurchasedLocationSons19 = LocationThatWasPurchased

		ElseIf !PurchasedLocationSons20
			PurchasedLocationSons20 = LocationThatWasPurchased
			
		Else
; 			CWScript.Log("CWCampaignScript", " ERROR!!! SetPurchasedLocation() ran out of PurchaseLocationXXXn variables. LocationThatWasPurchased: " + LocationThatWasPurchased + ", OwningFaction: " + OwningFaction, 2  )
		
		EndIf
		
	ElseIf owningFaction == CWs.iBothFactions
		
		if !PurchasedLocationBothFactions1
			PurchasedLocationBothFactions1 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationBothFactions2
			PurchasedLocationBothFactions2 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationBothFactions3
			PurchasedLocationBothFactions3 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationBothFactions4
			PurchasedLocationBothFactions4 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationBothFactions5
			PurchasedLocationBothFactions5 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationBothFactions6
			PurchasedLocationBothFactions6 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationBothFactions7
			PurchasedLocationBothFactions7 = LocationThatWasPurchased
		
		ElseIf !PurchasedLocationBothFactions8
			PurchasedLocationBothFactions8 = LocationThatWasPurchased

		Else
; 			CWScript.Log("CWCampaignScript", " ERROR!!! SetPurchasedLocation() ran out of PurchaseLocationXXXn variables. LocationThatWasPurchased: " + LocationThatWasPurchased + ", OwningFaction: " + OwningFaction, 2  )
		
		EndIf
		
		
	Else
; 		CWScript.Log("CWCampaignScript", " ERROR!!! SetPurchasedLocation() Recieved an unexpected value for OwningFaction. Expected 1, 2 or 3, got:" + OwningFaction, 2  )

	EndIf
	

EndFunction

Function CallSetOwnerForPurchasedLocations()
	
	;SetOwner() takes a max of 8 locations, so we call it until we are done with all the locations in our "arrays"
		
	;setOwner for Imperial garrisons
	if PurchasedLocationImperial1
		CWs.setOwner(PurchasedLocationImperial1, CWs.iImperials, PurchasedLocationImperial2, PurchasedLocationImperial3, PurchasedLocationImperial4, PurchasedLocationImperial5, PurchasedLocationImperial6, PurchasedLocationImperial7, PurchasedLocationImperial8)
	EndIf
	
	if PurchasedLocationImperial9
		CWs.setOwner(PurchasedLocationImperial9, CWs.iImperials, PurchasedLocationImperial10, PurchasedLocationImperial11, PurchasedLocationImperial12, PurchasedLocationImperial13, PurchasedLocationImperial14, PurchasedLocationImperial15, PurchasedLocationImperial16)
	EndIf
	
	if PurchasedLocationImperial17
		CWs.setOwner(PurchasedLocationImperial17, CWs.iImperials, PurchasedLocationImperial18, PurchasedLocationImperial19, PurchasedLocationImperial20)
	EndIf
	
	;setOwner for Sons garrisons
	if PurchasedLocationSons1
		CWs.setOwner(PurchasedLocationSons1, CWs.iSons, PurchasedLocationSons2, PurchasedLocationSons3, PurchasedLocationSons4, PurchasedLocationSons5, PurchasedLocationSons6, PurchasedLocationSons7, PurchasedLocationSons8)
	EndIf
	
	if PurchasedLocationSons9
		CWs.setOwner(PurchasedLocationSons9, CWs.iSons, PurchasedLocationSons10, PurchasedLocationSons11, PurchasedLocationSons12, PurchasedLocationSons13, PurchasedLocationSons14, PurchasedLocationSons15, PurchasedLocationSons16)
	EndIf
	
	if PurchasedLocationSons17
		CWs.setOwner(PurchasedLocationSons17, CWs.iSons, PurchasedLocationSons18, PurchasedLocationSons19, PurchasedLocationSons20)
	EndIf
	
	;setOwner for garrisons owned by both (the one patrol location)
	if PurchasedLocationBothFactions1
		CWs.setOwner(PurchasedLocationBothFactions1, CWs.iBothFactions, PurchasedLocationBothFactions2, PurchasedLocationBothFactions3, PurchasedLocationBothFactions4, PurchasedLocationBothFactions5, PurchasedLocationBothFactions6, PurchasedLocationBothFactions7, PurchasedLocationBothFactions8)
	EndIf
	
EndFunction


Function ResetDefenderOnlyGarrisons()
; 	CWScript.Log("CWCampaignScript", " ResetDefenderOnlyGarrisons() 'purchasing' aliases Captial & GarrisonDefenderOnly1-6 (if not empty)")

	ResetDefenderOnlyGarrison(1)
	ResetDefenderOnlyGarrison(2)
	ResetDefenderOnlyGarrison(3)
	ResetDefenderOnlyGarrison(4)
	ResetDefenderOnlyGarrison(5)
	ResetDefenderOnlyGarrison(6)
	
; 	CWScript.Log("CWCampaignScript", " ResetDefenderOnlyGarrisons() calling SetPurchasedLocation() for Capital" + Capital.GetLocation() + " to be owned by defender(" + CWs.FactionName(CWs.Defender) + ").")
	SetPurchasedLocation(Capital.GetLocation(), CWs.Defender)
	
	
EndFunction

Function ResetDefenderOnlyGarrison(Int GarrisonToReset)
{Calls ReturnLocationForDefenderOnlyGarrison and (if not None) sets the CWOwner keyword data on the location to be -Defender.}

	Location Garrison = ReturnLocationForDefenderOnlyGarrison(GarrisonToReset)
	
	if Garrison != None
; 		CWScript.Log("CWCampaignScript", " ResetDefenderOnlyGarrisons() calling SetPurchasedLocation() for GarrisonDefenderOnly" + GarrisonToReset + " to be owned by defender(" + CWs.FactionName(CWs.Defender) + ").")

		SetPurchasedLocation(Garrison, CWs.Defender)
			
	Else
		;Do nothing
	EndIf

EndFunction

location Function ReturnLocationForDefenderOnlyGarrison(int GarrisonToGet)
{Refturns the Location of the GarrisonDefenderOnlyX location alias corresponding to the supplied Int}

	if GarrisonToGet == 1
		return GarrisonDefenderOnly1.Getlocation()
	
	elseif GarrisonToGet == 2
		return GarrisonDefenderOnly2.Getlocation()
	
	elseif GarrisonToGet == 3
		return GarrisonDefenderOnly3.Getlocation()
		
	elseif GarrisonToGet == 4
		return GarrisonDefenderOnly4.Getlocation()
		
	elseif GarrisonToGet == 5
		return GarrisonDefenderOnly5.Getlocation()
		
	elseif GarrisonToGet == 6
		return GarrisonDefenderOnly6.Getlocation()
	else
	
	EndIf

EndFunction


Function ResetCamps()
{Sets keyword data CWOwner on CampImperial and CampSons location aliases to cause them to reset}
	if CWs.iImperials == CWs.Attacker
; 		CWScript.Log("CWCampaignScript", " ResetCamps() calling SetPurchasedLocation() for CampImperial locaion alias.")

		SetPurchasedLocation(CampImperial.GetLocation(), CWs.iImperials)	
		
; 		CWScript.Log("CWCampaignScript", " ResetCamps() disabling CampEnableSons.")
		CampEnableSons.GetReference().disable()

		
	Else	;Sons are attacking
; 		CWScript.Log("CWCampaignScript", " ResetCamps() calling SetPurchasedLocation() CampSons locaion alias.")

		SetPurchasedLocation(CampSons.GetLocation(), CWs.iSons)			
		
; 		CWScript.Log("CWCampaignScript", " ResetCamps() disabling CampEnableImperial.")
		CampEnableImperial.GetReference().disable()
	
	endif
	
	
EndFunction

int Function PurchasePatrolAndReturnNewOwner(int WhichPatrolToPurchase)
{Returns an int corresponding to faction that should own. If there is enough remaining positive or negative points in PurchaseDelta, purchase a patrol for the attacker (if positive) or defender (if negative)}
	int cost = CWs.iCostPatrol
	int newOwner		;1 = Imperials, 2 = Sons -- will correspond to Attacker and Defender property on CWScript attached to CW quest
	
	If CWs.PurchaseDelta >= Cost	;award to attacker, decrease the PurchaseDelta toward 0
		newOwner = CWs.Attacker
		CWs.PurchaseDelta = (CWs.PurchaseDelta - cost)
; 		CWScript.Log("CWCampaignScript", " PurchasePatrolAndReturnNewOwner() purchasing Patrol" + WhichPatrolToPurchase + " for Attacker (" + CWs.FactionName(NewOwner) + ") New PurchaseDelta =" + CWs.PurchaseDelta)
	
	Elseif -(CWs.PurchaseDelta) <= -(Cost)	;award to defender, increase the PurchaseDelta toward 0
		newOwner = CWs.Defender
		CWs.PurchaseDelta = (CWs.PurchaseDelta + cost)
; 		CWScript.Log("CWCampaignScript", " PurchasePatrolAndReturnNewOwner() purchasing Patrol" + WhichPatrolToPurchase + " for Defender (" + CWs.FactionName(NewOwner) + ")  New PurchaseDelta =" + CWs.PurchaseDelta)
		
	Else	;award to no one
		newOwner = 0
; 		CWScript.Log("CWCampaignScript", " PurchasePatrolAndReturnNewOwner() not purchasing Patrol" + WhichPatrolToPurchase + " for anyone. Not enough PurchaseDelta: " + CWs.PurchaseDelta)

	EndIf

	return newOwner

EndFunction

Function ResetPatrols()
; 	CWScript.Log("CWCampaignScript", " ResetPatrols() calling SetPurchasedLocation(" + Patrols.GetLocation() + ") with owner = 3 (both factions own patrols location).")

	SetPurchasedLocation(Patrols.GetLocation(), CWs.iBothFactions)	;this causes the garrison to reset/change hands, lives in CWScript
	
EndFunction

Function EnablePatrols()

	EnableDefaultPatrols()

	EnablePatrol(1)
	EnablePatrol(2)
	EnablePatrol(3)
	EnablePatrol(4)
	EnablePatrol(5)
	
EndFunction

Function EnableDefaultPatrols()
	PatrolsDefaultEnableImperial.GetReference().Enable()
	PatrolsDefaultEnableSons.GetReference().Enable()

; 	CWScript.Log("CWCampaignScript", " EnableDefaultPatrols() enabling ReferenceAliases PatrolsDefaultEnableImperial and PatrolsDefaultEnableSons.")
	
EndFunction

Function EnablePatrol(int WhichPatrolToEnable)
{Calls GetEnableMarkerForPatrol() for patrol supplied as an Int, and then enables it.}
	ObjectReference EnableMarker
	
	EnableMarker = GetEnableMarkerForPatrol(WhichPatrolToEnable)
	
	If EnableMarker != None
		EnableMarker.Enable()
; 		CWScript.Log("CWCampaignScript", " EnablePatrol() enabling " + EnableMarker)
	Else
; 		CWScript.Log("CWCampaignScript", " EnablePatrol() not enabling the patrol #" + WhichPatrolToEnable + " for either faction. Which should mean that neither own it.")
	EndIf

EndFunction

ObjectReference Function GetEnableMarkerForPatrol(int WhichPatrol)
{Returns the ObjectReference for patrol supplied as an Int}
	if WhichPatrol == 1
		if OwnerPatrol1 == CWs.iImperials
			return PatrolsEnableImperial1.GetReference()
		elseif OwnerPatrol1 == CWs.iSons
			return PatrolsEnableSons1.GetReference()
		else
			return None
		endif
		
	elseif WhichPatrol == 2
		if OwnerPatrol2 == CWs.iImperials
			return PatrolsEnableImperial2.GetReference()
		elseif OwnerPatrol2 == CWs.iSons
			return PatrolsEnableSons2.GetReference()
		else
			return None
		endif
	
	elseif WhichPatrol == 3
		if OwnerPatrol3 == CWs.iImperials
			return PatrolsEnableImperial3.GetReference()
		elseif OwnerPatrol3 == CWs.iSons
			return PatrolsEnableSons3.GetReference()
		else
			return None
		endif
	
	elseif WhichPatrol == 4
		if OwnerPatrol4 == CWs.iImperials
			return PatrolsEnableImperial4.GetReference()
		elseif OwnerPatrol4 == CWs.iSons
			return PatrolsEnableSons4.GetReference()
		else
			return None
		endif
	
	elseif WhichPatrol == 5
		if OwnerPatrol5 == CWs.iImperials
			return PatrolsEnableImperial5.GetReference()
		elseif OwnerPatrol5 == CWs.iSons
			return PatrolsEnableSons5.GetReference()
		else
			return None
		endif
	Else
; 		CWScript.Log("CWCampaignScript", " GetEnableMarkerForPatrol() expected an Int 1-5, instead got " + WhichPatrol)
		return None
	EndIf

EndFunction



Function SetCWCampaignFieldCOAliases()
{Forces named field COs into FieldCO and generic enemy field COs into EnemyFieldCO, enables the EnemyFieldCO and disables the other non-used generic field CO}

	if CWs.playerAllegiance == CWs.iImperials

		if CWs.playerInvolved == 0
; 			CWScript.Log("CWCampaignScript", " SetCWCampaignFieldCOAliases() Player Allegience == 1 and PlayerInvolved == 0, so we are Forcing GenericFieldCOImperial into FieldCo, GenericFieldCOSons into EnemyFieldCO, and enabling them both.")
			
			FieldCO.ForceRefTo(GenericFieldCOImperial.GetReference())
			EnemyFieldCO.ForceRefTo(GenericFieldCOSons.GetReference())

			GenericFieldCOImperial.GetReference().Enable()
			EnemyFieldCO.GetReference().Enable()

		Elseif CWs.playerInvolved == 1
	
; 			CWScript.Log("CWCampaignScript", " SetCWCampaignFieldCOAliases() is Forcing Rikke into FieldCo, GenericFieldCOSons into EnemyFieldCO, enabling EnemyFieldCO, and disabling GenericFieldCOImperial.")

			FieldCO.ForceRefTo(Rikke.GetReference())
			EnemyFieldCO.ForceRefTo(GenericFieldCOSons.GetReference())

			EnemyFieldCO.GetReference().Enable()
			GenericFieldCOImperial.GetReference().Disable()
			
		Else
; 			CWScript.Log("CWCampaignScript", "WARNING: SetCWCampaignFieldCOAliases() expected 0 or 1 for CWScript PlayerInvolved, instead found:" + CWs.playerInvolved, 2)

			
		EndIf

	Elseif CWs.playerAllegiance == CWs.iSons
		
		if CWs.playerInvolved == 0
; 			CWScript.Log("CWCampaignScript", " SetCWCampaignFieldCOAliases() playerAllegiance == 2 and PlayerInvolved == 0, so we are Forcing GenericFieldCOSons into FieldCo, GenericFieldCOImperial into EnemyFieldCO, and enabling them both.")
			
			FieldCO.ForceRefTo(GenericFieldCOSons.GetReference())
			EnemyFieldCO.ForceRefTo(GenericFieldCOImperial.GetReference())

			GenericFieldCOImperial.GetReference().Enable()
			EnemyFieldCO.GetReference().Enable()

		Elseif CWs.playerInvolved == 1

; 			CWScript.Log("CWCampaignScript", " SetCWCampaignFieldCOAliases() is Forcing Galmar into FieldCo, GenericFieldCOImperial into EnemyFieldCO, enabling EnemyFieldCO, and disabling GenericFieldCOSons.")

			FieldCO.ForceRefTo(Galmar.GetReference())
			EnemyFieldCO.ForceRefTo(GenericFieldCOImperial.GetReference())

			EnemyFieldCO.GetReference().Enable()
			GenericFieldCOSons.GetReference().Disable()

		Else
; 			CWScript.Log("CWCampaignScript", "WARNING: SetCWCampaignFieldCOAliases() expected 0 or 1 for CWScript PlayerInvolved, instead found:" + CWs.playerInvolved, 2)
			
		EndIf
			
	Else
; 		CWScript.Log("CWCampaignScript", "WARNING: SetCWCampaignFieldCOAliases expected playerAllegience to be 1 or 2, got " + CWs.playerAllegiance, 2)

	EndIf
	
EndFunction

Function AdvanceCampaignPhase(int OptionalPhaseToSetTo = -1)
{Called when needing to advance the campaign to the next phase, and start new missions}
	
	;* The reason for this weird if / while loop below...
	;Phases advance 'automatically': mission accept timers and mission fail timers expire setting mission quest stages that call AdvanceCampaignPhase() and then shut down.
	;However, this function is also called in dialogue with the FactionLeader the first time the player is joining a campaign to reset the campaign to the first phase (via passing a "1" in for the optional param)
	;It's possible that while in dialogue, the campaign phase could advance automatically and the resolution happens off screen, in the middle of the FactionLeader telling us to go meet the field officer - that'd be really weird.
	;We don't want him to say go join this campaign, and then immediately it fails.
	;So this while loop prevents the campaign from advancing at least until after the player leaves the town with the FactionLeader in it, since the player realizes this is a dynamic system, he'll hopefully forgive that weirdness if the campaign ends soon after leaving.
	;If the campaign is starting fresh (ie the CWCampaignPhase is 0) we don't care if the player is standing right in front of the FactionLeader, otherwise we'd never get start the campaign if the player hangs out in the same town with FactionLeader
	
	;* See rationale for this above
	if CWCampaignPhase.value != 0 && OptionalPhaseToSetTo == -1	;ie the default call, not when it's called in dialogue with the faction leader the first time the player is joining a campaign in the civil war
		while CWs.AliasFactionLeader.GetReference().getCurrentLocation().IsSameLocation(Game.GetPlayer().getCurrentLocation(), LocTypeHabitation)
; 			CWScript.Log("CWCampaignScript", " AdvanceCampaignPhase() WAITING -PLAYER NEARBY: in a while loop wait until after player and Faction leader aren't in the same LocTypeHabitation location.", 1)
;*** !!! *** IF WE EVER GET A WAIT MENU, THEN WE NEED TO NOT CARE IF THE PLAYER IS IN THE SAME LOCATION IF HE IS ALSO WAITING			
			utility.wait(10)
		
		EndWhile
	EndIf
	
; 	CWScript.Log("CWCampaignScript", " AdvanceCampaignPhase() running.")
	
	if OptionalPhaseToSetTo > 0
		CWCampaignPhase.value = OptionalPhaseToSetTo
; 		CWScript.Log("CWCampaignScript", " AdvanceCampaignPhase() forced CWCampaignPhase global to " + CWCampaignPhase.value )
	Else
		;Increment the phase
		CWCampaignPhase.value += 1
; 		CWScript.Log("CWCampaignScript", " AdvanceCampaignPhase() incremented CWCampaignPhase global to " + CWCampaignPhase.value )
	EndIf
	
	if CWs.debugStartingCampaignPhase != 0 && CWCampaignPhase.value < CWs.debugStartingCampaignPhase
		CWCampaignPhase.value = CWs.debugStartingCampaignPhase
; 		CWScript.Log("CWCampaignScript", " AdvanceCampaignPhase() forcing CWCampaignPhase to debugStartingCampaignPhase " + CWCampaignPhase.value )
	EndIf
	
	if DebugOn.value == 1
		debug.Notification("CWCampaignPhase: " + CWCampaignPhase.value)
	EndIf
	
	;Increment the NextPhaseDay
	NextPhaseDay = GameDaysPassed.value + AcceptDays
; 	CWScript.Log("CWCampaignScript", " AdvanceCampaignPhase() set CWCampaignPhase NextPhaseDay to " + NextPhaseDay + " ( = GameDaysPassed(" + GameDaysPassed.value + ") AcceptDays(" + AcceptDays + ")." )
	
	;Reset Mission tracking properties
	Mission1Type = 0
	Mission2Type = 0
	Mission3Type = 0	
	AcceptedHooks = 0
	AcceptedMission = 0

	;set current attack delta
	SetCurrentAttackDelta()
	
	;Start missions:
	StartMissions()
	
	if DebugOn.value == 1
		debug.MessageBox("CWCampaignScript: Ready to start campaign.")
	EndIf
	
EndFunction




Function StartResolutionMission()
{Starts the proper resolution mission, checking if the Capital is a city or not, and whether the player should be attacking or defending.}
	
	;start an Attack the Capital Settlement resolution quest
	;createEvent CWResolution01Start  zBogusLocation FieldCO CampaignStartMarker 

	;start a Defend the Capital Settlement resolution quest
	;createEvent CWResolution02Start  zBogusLocation FieldCO CampaignStartMarker 

	If Capital.GetLocation().HasKeyword(LocTypeCity)	&& CWs.debugTreatCityCapitalsAsTowns == 0 ;capital is a city (note the debugTreatCityCapitalsAsTowns)
	
		CWSiegeStart.SendStoryEvent(Capital.GetLocation())	;the story manager handles checking the location, the player's allegiance and who is attacking to start the quests
	
	;	if Capital.GetLocation() == CWs.WhiterunLocation 	;ADD || OTHER CITY HERE
; 	;		CWScript.Log("CWCampaignScript", " StartResolutionMission() starting attack on Whiterun.")
	;		CWSiegeStart.SendStoryEvent(Capital.GetLocation())	;the story manager handles checking the location, the player's allegiance and who is attacking to start the quests
	;			
	;	Else ;SOME OTHER NOT YET IMPLEMENTED CITY
; 	;		CWScript.Log("CWCampaignScript", " StartResolutionMission() needs to start an Attack on a Capital CITY. Will RESOLVE OFFSCREEN.")
	;		debug.MessageBox("CWCampaignScript StartResolutionMission() needs to start an Attack on a Capital CITY. RESOLVE OFFSCREEN.")
	;		CWs.ResolveOffscreen(GetCurrentAttackDelta())
	;			
	;	EndIf

	Else	;capital is not a city
		if CWs.playerAllegiance == CWs.Attacker
			;start an Attack the Capital Settlement resolution quest
; 			CWScript.Log("CWCampaignScript", " StartResolutionMission() starting Resolution01 for " + Capital.Getlocation())
			CWResolution01Start.SendStoryEvent(Capital.Getlocation(), FieldCO.GetReference(), CampaignStartMarker.GetReference()) 
		
		Else
			;start an Defend the Capital Settlement resolution quest
; 			CWScript.Log("CWCampaignScript", " StartResolutionMission() starting Resolution02 for " + Capital.Getlocation())
			CWResolution02Start.SendStoryEvent(Capital.Getlocation(), FieldCO.GetReference(), CampaignStartMarker.GetReference()) 
			
		EndIf
	
	EndIf

EndFunction


function setCurrentAttackDelta()

	CurrentAttackDelta = GetCurrentAttackDelta()

EndFunction


int Function GetCurrentAttackDelta()
{Returns the current Attack Delta based on situation affected by players actions on the ground. Garrisons don't provide points if all the soldiers are dead, or half points if a resource object is destroyed, plus any misc modifiers for doing special missions.}

	float myCurrentAttackDelta
	
; 	CWScript.Log("CWCampaignScript", " GetmyCurrentAttackDelta() is running.")
	
	;Get points for capital garrison
	myCurrentAttackDelta += GetAttackDeltaPointsForCapital(Capital.GetLocation())

	;Get points for garrisons and their resource objects	--- Detailed note about resource objects: A garrison may have more than one resource object in it... we are only testing against the one that filled the alias. Effectively this means the player must get lucky, or destroy all of the resources to get the bonus. This shouldn't matter greatly.
	myCurrentAttackDelta += GetAttackDeltaPointsForDefenderOnlyGarrison(GarrisonDefenderOnly1.GetLocation(), GarrisonDefenderOnly1ResourceObject.GetReference())
	myCurrentAttackDelta += GetAttackDeltaPointsForDefenderOnlyGarrison(GarrisonDefenderOnly2.GetLocation(), GarrisonDefenderOnly2ResourceObject.GetReference())
	myCurrentAttackDelta += GetAttackDeltaPointsForDefenderOnlyGarrison(GarrisonDefenderOnly3.GetLocation(), GarrisonDefenderOnly3ResourceObject.GetReference())
	myCurrentAttackDelta += GetAttackDeltaPointsForDefenderOnlyGarrison(GarrisonDefenderOnly4.GetLocation(), GarrisonDefenderOnly4ResourceObject.GetReference())
	
	myCurrentAttackDelta += GetAttackDeltaPointsForGarrison(Garrison1.GetLocation(), Garrison1ResourceObject.GetReference())
	myCurrentAttackDelta += GetAttackDeltaPointsForGarrison(Garrison2.GetLocation(), Garrison2ResourceObject.GetReference())
	myCurrentAttackDelta += GetAttackDeltaPointsForGarrison(Garrison3.GetLocation(), Garrison3ResourceObject.GetReference())
	myCurrentAttackDelta += GetAttackDeltaPointsForGarrison(Garrison4.GetLocation(), Garrison4ResourceObject.GetReference())


	;Get points for Patrols
	myCurrentAttackDelta += GetAttackDeltaPointsForPatrols()
	
	;Get points for mission bonueses
	myCurrentAttackDelta += GetAttackDeltaMissionBonus()
	
; 	CWScript.Log("CWCampaignScript", " GetmyCurrentAttackDelta() is returning myCurrentAttackDelta " + myCurrentAttackDelta + " rounded as int (" + (myCurrentAttackDelta as int) + ") compared to original campaign AttackDelta of " + CWs.AttackDelta)
	
	return myCurrentAttackDelta as int
	
EndFunction

int Function GetAttackDeltaPointsForCapital(Location CapitalLocation)
{Returns the CurrentAttackDelta points contributed by the capital.}

	;Note:
	;Since the defender gets the capital garrison for free, in otherwords it's not purchased at the start of the campaign, the defender gets no benefit if the guards are alive.
	;However, if the player killed all the guards there, then we want to give the attacker some bonus points so the player can feel like his actions have had an effect

	If CapitalLocation.GetRefTypeAliveCount(CWSoldier) == 0
; 		CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForCapital() is returning " + AttackDeltaBonusForKillingCapitalGarrison + " points for the CurrentAttackDelta because all the soldiers in the garrison are dead.")
	
		return AttackDeltaBonusForKillingCapitalGarrison		;set in OnInit()
	
	else
; 		CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForCapital() is returning 0 points for the CurrentAttackDelta because the garrison is intact:" + CapitalLocation )
		return 0	;There are soldiers alive in the capital, so the attacker is awarded no points
		
	EndIf

EndFunction

float Function GetAttackDeltaPointsForDefenderOnlyGarrison(Location Garrison, ObjectReference ResourceObject)
{Returns the CurrentAttackDelta points contributed by the Garrison and it's ResourceObject.}
	;Note:
	;Since the defender gets the garrison for free, in otherwords it's not purchased at the start of the campaign, the defender gets no benefit if the guards are alive.
	;However, if the player killed all the guards there, or destroyed a resourceObject there, then we want to give the attacker some bonus points so the player can feel like his actions have had an effect

	int BaseGarrisonValue 
	float GarrisonValue 

	If Garrison == None
		return 0
	EndIf
	
	BaseGarrisonValue = Garrison.GetKeywordData(CWCost) as Int
	GarrisonValue = BaseGarrisonValue
	
	if BaseGarrisonValue == CWs.iCostNonContestable
; 		CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForDefenderOnlyGarrison() is returning 0 points for the CurrentAttackDelta because Garrison(" + Garrison + ") is Non-Contestable, ie has a CWCost value of:" + BaseGarrisonValue )
	
		return 0
	
	ElseIf Garrison.GetRefTypeAliveCount(CWSoldier) == 0
; 		CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForDefenderOnlyGarrison() is returning " + BaseGarrisonValue + " points for the CurrentAttackDelta because all the soldiers are dead in Garrison(" + Garrison + ")")
	
		return BaseGarrisonValue
	
	;*** !!! THIS IS SIMILAR BUT NOT IDENTICAL TO ELSEIF IN GetAttackDeltaPointsForGarrison() BELOW
	ElseIf (ResourceObject as ResourceObjectScript).IsSabotaged()

		GarrisonValue *= AttackDeltaGarrisonValueModifierForDestroyingResource
		
; 		CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForDefenderOnlyGarrison() is returning " + GarrisonValue + " points for the CurrentAttackDelta because the resource object is destroyed in the Garrison(" + Garrison + ")")
	
		return GarrisonValue		

	
	Else
	
; 		CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForDefenderOnlyGarrison() is returning 0 points for the CurrentAttackDelta because the garrison is intact:"  + Garrison + ")")
		return 0

	EndIf
		
EndFunction

float Function GetAttackDeltaPointsForGarrison(Location Garrison, ObjectReference ResourceObject)
{Returns the CurrentAttackDelta points contributed by the Garrison and it's ResourceObject.}
	;Note:
	;Whoever owns the Garrison gets points for it based on if the resource object is destroyed or not, and if the guards there are alive or not.s so the player can feel like his actions have had an effect

; 	CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForGarrison(Garrison[" + Garrison + "], ResourceObject[" + ResourceObject + "])")

	
	int BaseGarrisonValue 
	float GarrisonValue 

	If Garrison == None
		return 0
	EndIf
	
	BaseGarrisonValue = Garrison.GetKeywordData(CWCost) as Int
	GarrisonValue = BaseGarrisonValue
	
	if BaseGarrisonValue == CWs.iCostNonContestable	;Note this shouldn't be the case unless an error has occured setting the cost in the first place, only defender only garrisons should have a CWCost == iCostNonContestable
; 		CWScript.Log("CWCampaignScript", "WARNING: GetAttackDeltaPointsForGarrison() is returning 0 points for the CurrentAttackDelta because Garrison(" + Garrison + ") UNEXPECTEDLY is Non-Contestable, ie has a CWCost value of:" + BaseGarrisonValue, 2)
	
		return 0
	
	ElseIf Garrison.GetRefTypeAliveCount(CWSoldier) == 0
; 		CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForGarrison() is returning 0 points for the CurrentAttackDelta because all the soldiers are dead in Garrison(" + Garrison + ")")
	
		return 0
	
	;*** !!! THIS IS SIMILAR BUT NOT IDENTICAL TO ELSEIF IN GetAttackDeltaPointsForDefenderOnlyGarrison() ABOVE	
	ElseIf (ResourceObject as ResourceObjectScript).IsSabotaged()

		GarrisonValue *= AttackDeltaGarrisonValueModifierForDestroyingResource
		
; 		CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForGarrison() is returning " + GarrisonValue + " points for the CurrentAttackDelta because the resource object is destroyed in the Garrison(" + Garrison + ")")

		;DON'T RETURN, to give chance to process the attacker/defender below
		
	EndIf
	
	if Math.ABS(Garrison.GetKeywordData(CWOwner) as Int) == CWs.Attacker
; 		CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForGarrison() is returning " + GarrisonValue + " points for the CurrentAttackDelta (ie positive value for the Attacker). Garrison:"  + Garrison)

		return GarrisonValue
	
	Else	;owned by Defender
		;only award points if the Defender won it back from the Attacker who purchased it
		if Garrison.GetKeywordData(CWPurchasedByAttacker) as Int == 1
; 			CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForGarrison() is returning " + -(GarrisonValue) + " points for the CurrentAttackDelta (ie negative value for the Defender) because he won it back from the Attacker who purchased it. Garrison:"  + Garrison)

			return -(GarrisonValue)	;Negative value means in the defender's favor
		Else
; 			CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForGarrison() is returning 0 points for the CurrentAttackDelta because it is owned by the Defender who did not have to purchase it. Garrison:"  + Garrison)

			return 0
		
		EndIf
		

		
	EndIf
	
EndFunction


int Function GetAttackDeltaPointsForPatrols()
{Returns the sum of the CurrentAttackDelta points contributed by the Patrols for both sides.}

	;If the patrol is owned, the owner get's points for it if the patrol isn't dead.
	
	int PatrolValue = CWs.iCostPatrol
	int PatrolsAttackDeltaPoints = 0
	
	Location PatrolsLoc = Patrols.GetLocation()
	
	int Attacker = CWs.Attacker
	int Defender = CWs.Defender
	
	if PatrolsLoc.GetRefTypeAliveCount(CWPatrol1) >= 1
		if OwnerPatrol1 == Attacker
			PatrolsAttackDeltaPoints += PatrolValue
		Elseif OwnerPatrol1 == Defender		;must be explictly owned
			PatrolsAttackDeltaPoints += -(PatrolValue)	;negative value means in the defender's favor
		EndIf
	EndIf
	
	if PatrolsLoc.GetRefTypeAliveCount(CWPatrol2) >= 1
		if OwnerPatrol2 == Attacker
			PatrolsAttackDeltaPoints += PatrolValue
		Elseif OwnerPatrol1 == Defender		;must be explictly owned
			PatrolsAttackDeltaPoints += -(PatrolValue)	;negative value means in the defender's favor
		EndIf
	EndIf

	if PatrolsLoc.GetRefTypeAliveCount(CWPatrol3) >= 1
		if OwnerPatrol3 == Attacker
			PatrolsAttackDeltaPoints += PatrolValue
		Elseif OwnerPatrol1 == Defender		;must be explictly owned
			PatrolsAttackDeltaPoints += -(PatrolValue)	;negative value means in the defender's favor
		EndIf
	EndIf
	
	if PatrolsLoc.GetRefTypeAliveCount(CWPatrol4) >= 1
		if OwnerPatrol4 == Attacker
			PatrolsAttackDeltaPoints += PatrolValue
		Elseif OwnerPatrol1 == Defender		;must be explictly owned
			PatrolsAttackDeltaPoints += -(PatrolValue)	;negative value means in the defender's favor
		EndIf
	EndIf
	
	if PatrolsLoc.GetRefTypeAliveCount(CWPatrol5) >= 1
		if OwnerPatrol5 == Attacker
			PatrolsAttackDeltaPoints += PatrolValue
		Elseif OwnerPatrol1 == Defender		;must be explictly owned
			PatrolsAttackDeltaPoints += -(PatrolValue)	;negative value means in the defender's favor
		EndIf
	EndIf

; 	CWScript.Log("CWCampaignScript", " GetAttackDeltaPointsForPatrols() is returning " + (PatrolsAttackDeltaPoints) + " points for the patrols. If positive it means the Attacker has more living patrols, if negative it means the defender has more living patrols.).")

	return PatrolsAttackDeltaPoints
	
EndFunction

function addAttackDeltaMissionBonus(int valueToAdd)
	attackDeltaMissionBonus += valueToAdd
; 	CWScript.Log("CWCampaignScript", " addAttackDeltaMissionBonus() adding " + valueToAdd + " making AttackDeltaMissionBonus = " + attackDeltaMissionBonus)
	
EndFunction

function subtractAttackDeltaMissionBonus(int valueToSubtract)
	attackDeltaMissionBonus += valueToSubtract
; 	CWScript.Log("CWCampaignScript", " asubtractAttackDeltaMissionBonus() subtracting " + valueToSubtract + " making AttackDeltaMissionBonus = " + attackDeltaMissionBonus)
	
EndFunction

int Function getAttackDeltaMissionBonus()
; 	CWScript.Log("CWCampaignScript", " getAttackDeltaMissionBonus() returning AttackDeltaMissionBonus: " + attackDeltaMissionBonus)
	return attackDeltaMissionBonus

EndFunction

int Function GetCountFarms(ReferenceAlias ResourceObject1, ReferenceAlias ResourceObject2, ReferenceAlias ResourceObject3)
{Called by CWMissions. Returns the number of farm resource objects.}

	int count

	If ResourceObject1.GetReference() != None && GetResourceType(ResourceObject1) == 1
		count += 1
	endif
	
	If ResourceObject2.GetReference() != None && GetResourceType(ResourceObject2) == 1
		count += 1
	endif
	
	If ResourceObject3.GetReference() != None && GetResourceType(ResourceObject3) == 1
		count += 1
	endif

	return count
	
EndFunction

int Function GetCountMills(ReferenceAlias ResourceObject1, ReferenceAlias ResourceObject2, ReferenceAlias ResourceObject3)
{Called by CWMissions. Returns the number of mill resource objects.}
	
	int count
	
	If ResourceObject1.GetReference() != None && GetResourceType(ResourceObject1) == 2
		count += 1
	endif
	
	If ResourceObject2.GetReference() != None && GetResourceType(ResourceObject2) == 2
		count += 1
	endif
	
	If ResourceObject3.GetReference() != None && GetResourceType(ResourceObject3) == 2
		count += 1
	endif

	return count
	
EndFunction

int Function GetCountMines(ReferenceAlias ResourceObject1, ReferenceAlias ResourceObject2, ReferenceAlias ResourceObject3)
{Called by CWMissions. Returns the number of mine resource objects.}
	
	int count
	
	If ResourceObject1.GetReference() != None && GetResourceType(ResourceObject1) == 3
		count += 1
	endif
	
	If ResourceObject2.GetReference() != None && GetResourceType(ResourceObject2) == 3
		count += 1
	endif
	
	If ResourceObject3.GetReference() != None && GetResourceType(ResourceObject3) == 3
		count += 1
	endif

	return count

EndFunction

int function GetResourceType(ReferenceAlias ResourceObject)
{Returns an int signifying the resource type: 1 = Farm object, 2 = Mill object, 3 = Mine object}

	ResourceObjectScript ResourceObjectS = ResourceObject.GetReference() as ResourceObjectScript
	int type = ResourceObjectS.GetResourceType()
	
	if type < 1 || type > 3
; 		CWScript.Log("CWCampaignScript", " GetResourceType() doesn't know what type to return for ResourceObject, will return 4")
		type = 4
	EndIf

; 	CWScript.Log("CWCampaignScript", " GetResourceType(" + ResourceObject +") which is objectReference[" + ResourceObject.GetReference() + "]returning type =" + type)

	return type
	
EndFunction


function ForceFieldHQAliases()
{Forces The capitalHQ, or camp location into the FieldHQ and EnemyFieldHQ aliases based on the player's faction and the attacking faction.}

	int playerAllegiance = CWs.PlayerAllegiance
	int Attacker = CWs.Attacker
	int ownerContestedHold = CWs.ownerContestedHold
	int iImperials = CWs.iImperials
	int iSons = CWs.iSons
	
	
	If PlayerAllegiance == ownerContestedHold
		FieldHQ.ForceLocationTo(CapitalHQ.GetLocation())
		
		;make the enemy camp as the EnemyFieldHQ
		If playerAllegiance == iImperials 	;enemy is Sons
			EnemyFieldHQ.ForceLocationTo(CampSons.GetLocation())
		
		Elseif playerAllegiance == iSons ;enemy is Imperials
			EnemyFieldHQ.ForceLocationTo(CampImperial.GetLocation())
		
		Else	;unexpected allegiance
; 			CWScript.Log("CWCampaignScript", "ERROR: ForceFieldHQAliases() expected playerAllegiance to be 1 or 2, instead found " + playerAllegiance, 2)
		
		EndIf
		
		
	Else	;player's faction is not the owner of the contested hold, so make his camp the fieldHQ and the capital the EnemyFieldHQ
		EnemyFieldHQ.ForceLocationTo(CapitalHQ.GetLocation())
	
		;make the player's faction camp as the FieldHQ
		If playerAllegiance == iImperials 	;player is Sons
			FieldHQ.ForceLocationTo(CampImperial.GetLocation())
		
		Elseif playerAllegiance == iSons ;player is Imperials
			FieldHQ.ForceLocationTo(CampSons.GetLocation())
		
		Else	;unexpected allegiance
; 			CWScript.Log("CWCampaignScript", "ERROR: ForceFieldHQAliases() expected playerAllegiance to be 1 or 2, instead found " + playerAllegiance, 2)
		
		EndIf		
	
	EndIf
	
; 	CWScript.Log("CWCampaignScript", " ForceFieldHQAliases(): PlayerAllegiance ==" + PlayerAllegiance + ", ownerContestedHold ==" + ownerContestedHold + ", Attacker ==" + Attacker)
; 	CWScript.Log("CWCampaignScript", " ForceFieldHQAliases(): Set FieldHQ to " + FieldHQ.GetLocation() + ", Set EnemyFieldHQ to " + EnemyFieldHQ.GetLocation())

EndFunction


Function PlayerJoinsActiveCampaign()
{When player get's involved in a civil war campaign for the first time, we need to roll it back to the begining.}
; 	CWScript.Log("CWCampaignScript", " PlayerJoinsActiveCampaign() will Call ForceFieldHQAliases(), SetCWCampaignFieldCOAliases, UpdateCWCampaignObjAliases, and AdvanceCampaignPhase(1) ")
	ForceFieldHQAliases()
	SetCWCampaignFieldCOAliases()
	UpdateCWCampaignObjAliases()
	AdvanceCampaignPhase(1) ;forces the campaign to "start over" with phase 1
	startTutorialMission()
	
EndFunction

function UpdateCWCampaignObjAliases()
{Forces the aliases in CWCampaignObj quest to have the current references/locations of the related aliases in CWCampaign}
; 	CWScript.Log("CWCampaignScript", " UpdateCWCampaignObjAliases() forcing CWCampaignObj aliases to match. ")

	CWCampaignObjFieldCO.ForceRefTo(FieldCO.GetReference())
	CWCampaignObjFactionLeader.ForceRefTo(CWs.AliasFactionLeader.GetReference())
	CWCampaignObjCampaignStartMarker.ForceRefTo(CampaignStartMarker.GetReference())
	CWCampaignObjCampaignHold.ForceLocationTo(Hold.GetLocation())

EndFunction

Function startTutorialMission()
	int tutorial = CWs.TutorialMissionComplete

; 	CWScript.Log("CWCampaignScript", " StartTutorialMission()")	
	CWMissionTutorialStart.SendStoryEvent(Hold.Getlocation(), CampaignStartMarker.GetReference(), CWMission1Ref)
	
EndFunction

Function stopTutorialMission()

	int secondsWaiting = 0

	;This is called by "CWScript FinishCampaign()"
	;In the event that a campaign finishes before the player runs the mission, we need to be sure to completely stop the tutorial mission before the campaign wraps up, so when the next campaign starts we can start the tutorial mission properly.

; 	CWScript.Log("CWCampaignScript", " stopTutorialMission() stopping CWMission00")
	
	CWMission00.stop()
	
	while CWMission00.IsStopped() == False
		Utility.wait(5)
		secondsWaiting += 5
; 		CWScript.Log("CWCampaignScript", " stopTutorialMission() waiting for CWMission00 to stop. Seconds spent waiting:" + secondsWaiting, 1)
	EndWhile

EndFunction

;Used by CWCampaignFieldCOScript - see Stage 0 in CWCampaign
ObjectReference Function GetAttackerFieldHQCenterMarker()
	
	ObjectReference CenterMarkerRef
	
	if CWs.Attacker == CWs.iImperials
		CenterMarkerRef = CampImperialLocationCenterMarker.GetReference()
	
	elseif CWs.Attacker == CWs.iSons
		CenterMarkerRef = CampSonsLocationCenterMarker.GetReference()
			
	Else
; 		CWScript.Log("CWCampaignScript", " WARNING: GetAttackerFieldHQCenterMarker() expected CWs.Attacker to be 1 or 2, instead found " + CWs.Attacker, 2, 1, 1)
		CenterMarkerRef = none
	EndIf

; 	CWScript.Log("CWCampaignScript", " GetAttackerFieldHQCenterMarker() returning " + CenterMarkerRef)
	
	return CenterMarkerRef
	
EndFunction

ObjectReference function GetCapitalHQMarker()
	ObjectReference markerRef = CapitalHQMarker.GetReference()

; 	CWScript.Log("CWCampaignScript", " GetCapitalHQMarker() returning " + MarkerRef)

	Return MarkerRef
	
EndFunction


ObjectReference  function GetFieldHQMarker()
; 	CWScript.Log("CWCampaignScript", " GetFieldHQCenterMarker()")
	
	ObjectReference MarkerRef
	
	if CWs.PlayerAllegiance == CWs.Attacker
		MarkerRef = GetAttackerFieldHQCenterMarker()
	
	Else
		MarkerRef = GetCapitalHQMarker()
		
	EndIf

; 	CWScript.Log("CWCampaignScript", " GetFieldHQMarker() is returning " + MarkerRef)
	
	Return MarkerRef
	
EndFunction


ObjectReference  function GetEnemyFieldHQMarker()
; 	CWScript.Log("CWCampaignScript", " GetEnemyFieldHQMarker()")
	
	ObjectReference MarkerRef
	
	if CWs.PlayerAllegiance == CWs.Attacker
		MarkerRef = GetCapitalHQMarker()	;since player is attacking then the enemy is defending and has the captial hq
	
	Else
		MarkerRef = GetAttackerFieldHQCenterMarker() ;since player is defending then the enemy is attacking	
		
	EndIf

; 	CWScript.Log("CWCampaignScript", " GetEnemyFieldHQMarker() is returning " + MarkerRef)
	
	Return MarkerRef
	
EndFunction



;*******************************************************************************************************************
;***	OBSOLETE FUNCTIONS BELOW	***
;*******************************************************************************************************************

Function StartMissions()

	If CWCampaignPhase.value < ResolutionPhase		;then start normal missions
	
; 		CWScript.Log("CWCampaignScript", " AdvanceCampaignPhase() CWCampaignPhase(" + CWCampaignPhase.value + ") < ResolutionPhase(" + ResolutionPhase + "). Starting Missions.")
		
		CWMissionStart.SendStoryEvent(Hold.Getlocation(), CampaignStartMarker.GetReference(), CWMission1Ref)
		CWMissionStart.SendStoryEvent(Hold.Getlocation(), CampaignStartMarker.GetReference(), CWMission2Ref)
		
		;we used to offer three missiosn, now we are only offering two at a time
		;CWMissionStart.SendStoryEvent(Hold.Getlocation(), CampaignStartMarker.GetReference(), CWMission3Ref)
		
		((Self as Quest) as CWCampaignPollForMissionAcceptScript).StartPolling()
	
	ElseIf CWCampaignPhase.value == ResolutionPhase	;then start the resolution Quest
		if CWs.TutorialMissionComplete == 0
; 			CWScript.Log("CWCampaignScript", " AdvanceCampaignPhase() CWCampaignPhase(" + CWCampaignPhase.value + ") == ResolutionPhase(" + ResolutionPhase + "). Tutorial mission not completed, resolving offscreen.")
			CWs.ResolveOffscreen(GetCurrentAttackDelta())
			
		Else
; 			CWScript.Log("CWCampaignScript", " AdvanceCampaignPhase() CWCampaignPhase(" + CWCampaignPhase.value + ") == ResolutionPhase(" + ResolutionPhase + "). Starting Resolution Mission.")
			StartResolutionMission()
			((Self as Quest) as CWCampaignPollForMissionAcceptScript).StartPolling()
		
		EndIf
			
	Else	; We are trying to advance into a phase after the resolution phase, which means we should resolve the resolution mission off screen
; 		CWScript.Log("CWCampaignScript", " AdvanceCampaignPhase() CWCampaignPhase(" + CWCampaignPhase.value + ") > ResolutionPhase(" + ResolutionPhase + "). Resolving Resolution Mission OFFSCREEN.")
		((Self as Quest) as CWCampaignPollForMissionAcceptScript).StopPolling()
		CWs.ResolveOffscreen(GetCurrentAttackDelta())
	
	EndIf

EndFunction
