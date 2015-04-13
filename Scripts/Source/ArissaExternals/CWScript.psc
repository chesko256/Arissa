Scriptname CWScript extends Quest  Conditional
{Main script for the Civil War, holds many "global" properties for the system.}

;NOTE:
;The Civil War has gone through many iterations. There's a lot of obsolete stuff in here from previous iterations where it was more dynamic and free form.
;So if you're a modder looking for scripting examples, while there's some interesting things going on in here, the CW scripts are probably not the best place to start. There's a lot of obsolete and deprecated complexity in these systems

;#POINTER TO GLOBAL SHOW DEBUG TRACES
GlobalVariable property debugOn auto conditional		;###This is largely obsolete property, but there are a few things that still refer to it. See the Log() function below for the new way to do this	;0 = unset, 1 = set - show warnings
{Pointer to Global CWDebugOn, used to toggle on trace spam}

;Variables
;int property debugForceAttacker auto conditional 	hidden				;0 = unset, 1 = force the attacker to always be Imperials, 2 = Sons of Skyrim; see stage 10
;int property debugForceHold auto conditional hidden					;0 = unset, 1 = force the Contested Hold to be this enum value (see contestedHold variable below for enums)

GlobalVariable Property CWDebugForceAttacker Auto
GlobalVariable Property CWDebugForceHold Auto
GlobalVariable Property CWDebugAllowCampaignsInFinalHolds Auto

int property debugForceOffscreenResult auto conditional	hidden		;The next time the campaign updates it's script, it will force an Offscreen resolution, Note: this also forces the Quest Delay time to be a frame long to speed everything up
int property debugDBTraces auto conditional	hidden					;0 = unset, 1 = export warnings that are database friendly

int Property debugTreatCityCapitalsAsTowns auto Conditional Hidden	;0 = unset, 1 = causes Cities such as Whiterun, to be considered towns and start minor hold resolution quests
int Property debugStartingCampaignPhase auto Conditional Hidden		;0 = unset, N = the phase that the campaign starts in, for example, you could force the campaign to always start in the resolution phase if you need to test a resolution quest

int Property debugAllowNonAdjacentHolds Auto Conditional Hidden		;0 = unset, 1 = allow attacks against holds where attacker has no adjacent holds

int property debugSkipSetOwnerCalls auto Hidden		;0 unset, 1 = ignore calls to setOwner... breaks things but causes Civil War campaign to start much faster for certain types of play testing

;tracking variables
int property countCampaigns auto conditional	Hidden					;how many campaigns have run
int property countWinImperials auto conditional Hidden					;how many times have the Imperials won a campaign
int property countWinSons auto conditional Hidden						;how many times have the Sons won a campaign

;how many times has the faction won this hold
int property countWinReachImperials auto conditional Hidden
int property countWinReachSons auto conditional Hidden
int property countWinHjaalmarchImperials auto conditional Hidden
int property countWinHjaalmarchSons auto conditional Hidden
int property countWinWhiterunImperials auto conditional Hidden
int property countWinWhiterunSons auto conditional Hidden
int property countWinFalkreathImperials auto conditional Hidden
int property countWinFalkreathSons auto conditional Hidden
int property countWinPaleImperials auto conditional Hidden
int property countWinPaleSons auto conditional Hidden
int property countWinWinterholdImperials auto conditional Hidden
int property countWinWinterholdSons auto conditional Hidden
int property countWinRiftImperials auto conditional Hidden
int property countWinRiftSons auto conditional Hidden

int Property campaignRunning auto Conditional Hidden					;(set in CWCampaign stage 0) 0 = not running, 1 = busy setting up campaign, 2 = done setting up and other quests and scripts can assume its safe to poke the campaign


;Offscreen resolution stuff
float property resolutionAttackDeltaMultiplier auto conditional	 Hidden ;(set in the "init" block below) the value that gets multipled to the attack Delta in the offscreen resolution formula before being added to the die roll
float property resolutionDieRoll auto conditional	 Hidden			;1-100, gets adding to the AttackDelta*Multiplier in the offscreen resolution formula
Bool Property resolutionForced auto conditional Hidden				;True = Defender is forced to be the winner because the player wasn't yet involved in the campaign for the hold which was a major hold with a city (we don't want cities changing hands if the player never got involved)
float property resolutionResult auto conditional	 Hidden			;> 50 = Attacker wins, <= 50 means Defender wins

int property playerAllegiance auto conditional Hidden				;0 = unset, 1 = player joined Imperials, 2 = Sons of Skyrim -- note before the player commits in the main quest, the system still needs him to be on a "side" because it assumes he always is on a side, in CW Stage 0 it puts him in Imperials if he isn't already commited
;REM'd out bit below is used to debug if a script is setting this incorrectly somwhere
;int playerAllegianceVar
;int Property playerAllegiance Hidden									
;	function set(int value)
; ;		debug.tracestack("*playerAllegiance = "+value)
;		playerAllegianceVar = value
;	EndFunction
;	int function get()
;		return playerAllegianceVar
;	EndFunction
;EndProperty


int property playerJoinedCampaginReach auto conditional Hidden		;0 = unset, 1 = player took a mission in that hold. Until this = 1 any offscreen resolution will always fail for the attacker. This ensures that the player has a chance to see "pre-switched" state and see the new Jarl's plot  arc.
int property playerJoinedCampaginWhiterun auto conditional Hidden	
int property playerJoinedCampaginRift auto conditional Hidden
int Property PlayerJoinedCurrentCampaign auto Hidden	 ;used for determining salary, set in CWMissionScript PlayerAcceptsMission()

int Property TutorialMissionComplete Auto Conditional Hidden		;0 = unset, 1 = player completed the tutorial mission -- this changes the behavior of the resolution phase. (See CWCampaignScript StartMissions()) Until the player completes the tutorial, resolution phase will finish offscreen immediately. 

int Property PlayerGotIntro Auto Conditional hidden 					;player got the "do i know you? I was at helgen? Oh, you were at helgen" stuff from one of the factions, used to make the other faction recognize you right away so you don't have go through all that again

int property playerInvolved auto conditional Hidden					;0 = unset, 1 = the player is now involved in the Civil War
int Property WarIsActive	Auto Conditional Hidden						;0 = not set, 1 = active and player can get missions from field cos, -1 = paused and should not start new missions

bool Property EnemyFortsAddedBackToWar auto conditional Hidden	;see AddEnemyFortsBackToWar()

int property playerReport auto conditional	 Hidden					;See FinishCampaign() - 0 = un/reset, 1 = player should report, 2 = player reported to faction head after campaign

bool Property WhiterunSiegeStarted	Auto Hidden						;used by CWFieldCOScript if the whiterun siege has started, don't try starting it again
bool Property WhiterunSiegeFinished Auto conditional Hidden			;means the initial siege of whiterun has either been won, or lost

int property contestedHoldWinner auto conditional Hidden				;1 = Imperials, 2 = Sons
int Property contestedHoldWinType auto Conditional Hidden 			;0 = unset, 1 = Attacker won, 2 Defender won

float property attackerCoinToss auto conditional	Hidden			;0 = unset, 1 = imperials, 2=Sons of Skyrim (see CW Stage 10)
int property previousAttacker auto conditional Hidden					;0 = unset, 1 = Imperials, 2=Sons of Skyrim
int property consecutiveAttacks auto conditional	Hidden			;0 = unset/reset, # = number of times the same side attacked (used to force change if randomly picks the same one too many times in arow)

;ints representing each side, corresponds to other variables that store 1 or 2 to mean Imperials or Sons... for testing things like: "if attacker == iImperials"
int Property iImperials 		= 1 		Auto Hidden
int Property iSons			= 2 		Auto Hidden
int Property iBothFactions 	= 3			Auto Hidden

int Property iCurrentOwner  	= -999 	Auto Hidden	;used by SetOwner and it's related functions (means just reset the garrison, don't change the owner)

int property attacker auto conditional	Hidden						;0 = unset, 1 = Imperials, 2=Sons of Skyrim
int property defender auto conditional	Hidden						;0 = unset, 1 = Imperials, 2=Sons of Skyrim
int property choosingHold auto conditional	 Hidden					;0 = unset, ;N = iteration of trying to chose a hold to attack, -N means successful after N tries (see game mode block)

;properties representing holds as ints
int Property iHaafingar 		= 1 auto Hidden 	;* can't be contested
int Property iReach 			= 2 auto Hidden
int Property iHjaalmarch		= 3 auto Hidden
int Property iWhiterun 		= 4 auto Hidden
int Property iFalkreath 		= 5 auto Hidden
int Property iPale 			= 6 auto Hidden
int Property iWinterhold 	= 7 auto Hidden
int Property iEastmarch 		= 8 auto Hidden	;* can't ne contested
int Property iRift 			= 9 auto Hidden
;list for ease of copying and pasting:
;iHaafingar iReach iHjaalmarch iWhiterun iFalkreath iPale iWinterhold iEastmarch iRift

;list of hold names
;Haafingar Reach Hjaalmarch Whiterun Falkreath Pale Winterhold Eastmarch Rift

int property contestedHold auto conditional Hidden
int property previousContestedHold auto conditional Hidden
;enums meaning which hold is contested - these are same values as assigned to iHaafinager, iReach, etc. so you can test 'contestedHold == iReach', etc.
;0 = unset
;1 = Haafingar*
;2 = Reach
;3 = Hjaalmarch
;4 = Whiterun
;5 = Falkreath
;6 = Pale
;7 = Winterhold
;8 = Eastmarch*
;9 = Rift
;* can't be contested

;Current Owner of Holds 										;0 = unset, 1 = Imperial controlled, 2 = Sons of Skyrim controlled
int property OwnerHaafingar auto conditional Hidden
int property OwnerReach auto conditional Hidden	
int property OwnerHjaalmarch auto conditional Hidden
int property OwnerWhiterun auto conditional Hidden
int property OwnerFalkreath auto conditional Hidden
int property OwnerPale auto conditional Hidden
int property OwnerWinterhold auto conditional Hidden
int property OwnerEastmarch auto conditional Hidden
int property OwnerRift auto conditional Hidden

int property ownerContestedHold auto conditional Hidden		;0 = unset, 1 = Imperial controlled, 2 = Sons of Skyrim controlled

int property countHoldsImperial auto Conditional Hidden	;how many holds do the Imperials currently control
int property countHoldsSons auto Conditional Hidden	;how many holds to the Sons currently control


;Adjacency info (if any of this changes, make sure the function that compute Strength Values is changed accordingly)
;Haafingar		Reach, Hjaalmarch
;Reach		 	Haafingar, Hjaalmarch, Whiterun, Falkreath
;Hjaalmarch		Haafingar, Reach, Whiterun, Pale
;Whiterun		Reach, Hjaalmarch, Falkreath, Pale, Eastmarch, Rift
;Falkreath		Reach, Whiterun, Rift
;Pale				Hjaalmarch, Whiterun, Winterhold, Eastmarch
;Winterhold		Pale, Eastmarch
;Eastmarch		Winterhold, Pale, Whiterun, Rift
;Rift				Whiterun, Falkreath, Eastmarch



;Strength Value of Holds										;0 = unset, N = number of Strength Value points this hold is worth when adjacent to contested hold
int property StrValueHaafingar auto Hidden
int property StrValueReach auto Hidden
int property StrValueHjaalmarch auto Hidden 
int property StrValueWhiterun auto Hidden 
int property StrValueFalkreath auto Hidden
int property StrValuePale auto Hidden
int property StrValueWinterhold auto Hidden
int property StrValueEastmarch auto Hidden
int property StrValueRift auto Hidden


;Strength Points per hold for each faction	(used by setStrengthPoints())	0 = doesn't own adjacent holds, N= total of Strength Value points contributed by adjacent holds controlled by faction
int property strHaafingarImperial auto conditional Hidden
int property strHaafingarSons auto conditional Hidden
int property strReachImperial auto conditional Hidden
int property strReachSons auto conditional Hidden
int property strHjaalmarchImperial auto conditional Hidden
int property strHjaalmarchSons auto conditional Hidden
int property strWhiterunImperial auto conditional Hidden
int property strWhiterunSons auto conditional Hidden
int property strFalkreathImperial auto conditional Hidden
int property strFalkreathSons auto conditional Hidden
int property strPaleImperial auto conditional Hidden		 		
int property strPaleSons auto conditional Hidden
int property strWinterholdImperial auto conditional Hidden
int property strWinterholdSons auto conditional Hidden
int property strEastmarchImperial auto conditional Hidden
int property strEastmarchSons auto conditional Hidden
int property strRiftImperial auto conditional Hidden
int property strRiftSons auto conditional Hidden

int property strContestedHoldImperial auto conditional Hidden	;same as above, but localized for currently Contested Hold
int property strContestedHoldSons auto conditional Hidden

int property strAttacker auto conditional Hidden				;same as above, but localized for the current Attacker
int property strDefender auto conditional Hidden				;same as above, but localized for the current Defender

int property MaxAttackDelta auto conditional Hidden			;the max attack delta can be
int property AttackDelta auto conditional Hidden				;Current Relative Attacker Strength - initally equal to (strAttacker - strDefender), it is modified by completing objectives in free form game play and missions
int property PurchaseDelta auto conditional Hidden			;The AttackDelta in a form that can be subtracted from to "pay for" locations in the contested hold (see each Campaign Quest Stage 20)


;Costs associated with Garrison types (see SetGarrisonCost() and SetInitialGarrisonCosts())
int Property iCostNonContestable Auto Hidden
int Property iCostFort Auto Hidden
int Property iCostSmall Auto Hidden
int Property iCostMedium Auto Hidden
int Property iCostLarge Auto Hidden
int Property iCostPatrol Auto Hidden

;Holds the location that was last "attacked" in the civil war... attack, sabotaged, etc. Used primarily by MQ302 scene dialogue, but could be useful elsewhere (general rumors, etc.)
;Set by CWMissionScript->RegisterLocationWasRaidedByAttacker()
Location Property LastLocAttackedByImperials Auto Hidden
Location Property LastLocAttackedBySons Auto Hidden
Location Property LastLocAttacked Auto Hidden


bool Property WinHoldAndSetOwnerAlreadySetKeyword Auto Hidden		;used in conjunction with WinHoldAndSetOwnerKeywordDataOnly and WinHoldAndSetOwner
bool Property WinningHoldAndSettingOwnerPleaseWait Auto Hidden		;used in conjunction with WinHoldAndSetOwnerKeywordDataOnly and WinHoldAndSetOwner

Bool Property WaitingForCWResetGarrisonQuest1 auto Hidden		;SEE SetOwner() function below - set in SetOwner() cleared in CWResetGarrison1 shutdown stage
Bool Property WaitingForCWResetGarrisonQuest2 auto Hidden		;SEE SetOwner() function below - set in SetOwner() cleared in CWResetGarrison2 shutdown stage
Bool Property WaitingForCWResetGarrisonQuest3 auto Hidden		;SEE SetOwner() function below - set in SetOwner() cleared in CWResetGarrison3 shutdown stage
Bool Property WaitingForCWResetGarrisonQuest4 auto Hidden		;SEE SetOwner() function below - set in SetOwner() cleared in CWResetGarrison4 shutdown stage
Bool Property WaitingForCWResetGarrisonQuest5 auto Hidden		;SEE SetOwner() function below - set in SetOwner() cleared in CWResetGarrison5 shutdown stage
Bool Property WaitingForCWResetGarrisonQuest6 auto Hidden		;SEE SetOwner() function below - set in SetOwner() cleared in CWResetGarrison6 shutdown stage
Bool Property WaitingForCWResetGarrisonQuest7 auto Hidden		;SEE SetOwner() function below - set in SetOwner() cleared in CWResetGarrison7 shutdown stage
Bool Property WaitingForCWResetGarrisonQuest8 auto Hidden		;SEE SetOwner() function below - set in SetOwner() cleared in CWResetGarrison8 shutdown stage


int property init auto Hidden									;the 1 = OnInit() event was called
;int initvar
;int property init Hidden									;the 1 = OnInit() event was called
;function set(int value)
; ;	debug.tracestack("*init = "+value)
;	initvar = value
;EndFunction
;int function get()
;	return initvar
;EndFunction
;endproperty



;Player Rank

int Property PlayerRank Auto Conditional Hidden				;the rank the player is in the Faction
int property CountMissionSuccess Auto Conditional Hidden		;the number of successful missions
Float Property baseSalary Auto hidden							;amount in gold the player's base campaign salary is
Float Property SalaryMultRank1 Auto	 hidden					;multiplier to baseSalary based on player rank
Float Property SalaryMultRank2 Auto	 hidden	 				;multiplier to baseSalary based on player rank
Float Property SalaryMultRank3 Auto	 hidden					;multiplier to baseSalary based on player rank
Float Property SalaryMultRank4 Auto	 hidden					;multiplier to baseSalary based on player rank
int Property Salary Auto conditional Hidden					;holds the total of uncollected player salary see ContributeSalaryPool() and PaySalary(), used as condition on dialogue


Bool Property BuddyDialogueAllowed auto conditional hidden		;set in stage 30 of CW02A/B and conditioned in buddy dialogue so you don't get the dialogue before Korvanjund


int Property CWMission03Done auto Conditional Hidden   ;used by story manager, set in mission quest stage results
int Property CWMission04Done auto Conditional Hidden	;used by story manager, set in mission quest stage results
int Property CWMission07Done auto Conditional Hidden	;used by story manager, set in mission quest stage results

bool Property HaafingarFortBattleComplete auto hidden		;set in CWFortSiegeFort stage 9000
bool Property EastmarchFortBattleComplete auto hidden		;set in CWFortSiegeFort stage 9000

;##### Properties with pointers to things in the master file:
;###

;## Globals ##
GlobalVariable Property CWMaxConsecutiveAttacks  Auto  		;this is a global variable so we can more easily tweak this setting as we play
GlobalVariable Property GameDaysPassed	Auto					;Pointer to GameDaysPassed
GlobalVariable Property CWAttacker	Auto						;set in StartNewCampaign() same as Attacker property
GlobalVariable Property CWDefender	Auto						;set in StartNewCampaign() same as Defender property
GlobalVariable Property CWPlayerAllegiance Auto				;Global value that holds the playerAllegiance property value
GlobalVariable Property TimeScale Auto
GlobalVariable Property CWCountHoldsImperial Auto				;Holds countHoldsImperial property, set in SetHoldsImperial() function, called by SetHoldsProperty() function
GlobalVariable Property CWCountHoldsSons Auto					;Holds countHoldsImperial property, set in SetHoldsImperial() function, called by SetHoldsProperty() function
GlobalVariable Property CWContestedHold Auto					;Holds the same value as ContestedHold, used for conditions in dialogue, packages, etc.
GlobalVariable Property CWReinforcementPoolAttacker auto 	;Holds the CWReinforcementControllerScript.PoolAttacker value for the current siege.
GlobalVariable Property CWReinforcementPoolDefender Auto		;Holds the CWReinforcementControllerScript.PoolAttacker value for the current siege.
GlobalVariable Property CWMissionFailDay Auto					;Holds the timestamp left before the active mission fails. Used mission journal. See CWMissionPollForFailDayScript
GlobalVariable Property CWMissionsForRank1 Auto				;Holds the number of successful missions needed for increasing the player's faction rank
GlobalVariable Property CWMissionsForRank2 Auto				;Holds the number of successful missions needed for increasing the player's faction rank
GlobalVariable Property CWMissionsForRank3 Auto				;Holds the number of successful missions needed for increasing the player's faction rank
GlobalVariable Property CWMissionsForRank4 Auto				;Holds the number of successful missions needed for increasing the player's faction rank

GlobalVariable Property CWCountMissionsDone Auto		;DEPRECATED/OBSOLETE -- used to conditionalize story manager to allow each quest 

GlobalVariable property CWThreatBridgeImperial Auto
GlobalVariable property CWThreatBridgeSons Auto
GlobalVariable property CWThreatFenceImperial Auto
GlobalVariable property CWThreatFenceImperialArcher Auto
GlobalVariable property CWThreatFenceImperialMage Auto
GlobalVariable property CWThreatFenceSons Auto
GlobalVariable property CWThreatFenceSonsArcher Auto
GlobalVariable property CWThreatFenceSonsMage Auto
GlobalVariable property CWThreatHouseImperial Auto
GlobalVariable property CWThreatHouseSons Auto
GlobalVariable property CWThreatRockImperial Auto
GlobalVariable property CWThreatRockSons Auto
GlobalVariable property CWThreatStablesImperial Auto
GlobalVariable property CWThreatStablesSons Auto
GlobalVariable property CWThreatTowerImperial Auto
GlobalVariable property CWThreatTowerImperialArcher Auto
GlobalVariable property CWThreatTowerImperialMage Auto
GlobalVariable property CWThreatTowerSons Auto
GlobalVariable property CWThreatTowerSonsArcher Auto
GlobalVariable property CWThreatTowerSonsMage Auto
GlobalVariable property CWThreatTreeImperial Auto
GlobalVariable property CWThreatTreeSons Auto
GlobalVariable property CWThreatWallImperial Auto
GlobalVariable property CWThreatWallImperialArcher Auto
GlobalVariable property CWThreatWallImperialMage Auto
GlobalVariable property CWThreatWallSons Auto
GlobalVariable property CWThreatWallSonsArcher Auto
GlobalVariable property CWThreatWallSonsMage Auto
GlobalVariable property CWThreatWindowImperial Auto
GlobalVariable property CWThreatWindowImperialArcher Auto
GlobalVariable property CWThreatWindowImperialMage Auto
GlobalVariable property CWThreatWindowSons Auto
GlobalVariable property CWThreatWindowSonsArcher Auto
GlobalVariable property CWThreatWindowSonsMage Auto

GlobalVariable Property CWBattlePhase Auto

GlobalVariable Property CWPercentPoolRemainingAttacker Auto		;for use with CWReinforcementControllerScript
GlobalVariable Property CWPercentPoolRemainingDefender Auto		;for use with CWReinforcementControllerScript

;Globals for CWObj
GlobalVariable Property CWObjEastmarch Auto
GlobalVariable Property CWObjFalkreath Auto
GlobalVariable Property CWObjHaafingar Auto
GlobalVariable Property CWObjHjaalmarch Auto
GlobalVariable Property CWObjPale Auto
GlobalVariable Property CWObjReach Auto
GlobalVariable Property CWObjRift Auto
GlobalVariable Property CWObjWhiterun Auto
GlobalVariable Property CWObjWinterhold Auto


;Globals for Combat Dialogue
GlobalVariable Property CWStateAttackStarted Auto
GlobalVariable Property CWStateAttackerAtGate  Auto  
GlobalVariable Property CWStateAttackerBrokeThrough  Auto  
GlobalVariable Property CWStateAttackerLowReinforcements  Auto  
GlobalVariable Property CWStateAttackerOutOfReinforcements  Auto  
GlobalVariable Property CWStateDefenderFallingBack  Auto  
GlobalVariable Property CWStateDefenderLastStand  Auto  
GlobalVariable Property CWStateDefenderLowReinforcements  Auto  
GlobalVariable Property CWStateDefenderOutOfReinforcements  Auto  

;## Quests ##
Quest Property CWObj Auto

Quest property CWCampaign auto
CWCampaignScript property CWCampaignS auto
Quest property CWReset auto
Quest property CWResetGarrison1 auto
Quest property CWResetGarrison2 auto
Quest property CWResetGarrison3 auto
Quest property CWResetGarrison4 auto
Quest property CWResetGarrison5 auto
Quest property CWResetGarrison6 auto
Quest property CWResetGarrison7 auto
Quest property CWResetGarrison8 auto
Quest property CWCampaignObj auto
Quest Property CWMiscObj Auto

Quest Property CWSiegeAttackObj Auto
Quest Property CWSiegeDefendObj Auto

CWSiegeScript Property CWSiegeS Auto
CWAlliesScript Property CWAlliesS Auto

Quest Property CWSiegeObj Auto
Quest Property CWPrepareCity Auto

Quest Property CWCitizensFlee Auto

;NOTE: there used to be only one quest that was a CWFortSiege... there may be old things pointing to that specific quest, that will need to change.
;There are two because the minor capitals are using the fort siege system
Quest Property CWFortSiegeCapital Auto
Quest Property CWFortSiegeFort Auto

Quest Property CWMission03 Auto
Quest Property CWMission04 Auto
Quest Property CWMission07 Auto

Quest Property CWFinale Auto

Quest Property CW00A Auto	
Quest Property CW00B Auto	

Quest Property CW01A Auto	
Quest Property CW01B Auto	
	
Quest Property CW03 Auto		;used by the CWFieldCOScript to test the quest stage to start the siege of whiterun

Quest Property CWFin Auto

Quest Property MQ302 Auto		;peace treaty - need to stop this if taking the second to last holds


WIFunctionsScript Property WIs Auto
{Pointer to WIFunctionsScript attached to WI quest}

;## Quest Scripts ##
FavorDialogueScript Property DialogueFavorGenericS auto

CWThreatCombatBarksScript Property CWThreatCombatBarksS Auto


;## Aliases ##
LocationAlias Property CWObjQuestNameLocation Auto		;see stage 1 and 2


ReferenceAlias property AliasFactionLeader Auto
ReferenceAlias property AliasTullius Auto
ReferenceAlias property AliasUlfric Auto

ReferenceAlias property ImperialFactionHQMarker Auto
ReferenceAlias property SonsFactionHQMarker Auto

ReferenceAlias property ExiledImperialMarker Auto
ReferenceAlias property ExiledSonsMarker Auto

ReferenceAlias Property Tullius Auto
ReferenceAlias Property Rikke Auto

ReferenceAlias Property Ulfric Auto
ReferenceAlias Property Galmar Auto


ReferenceAlias Property FieldCO Auto

ReferenceAlias Property Alias_FieldCOImperialEastmarchCamp Auto
ReferenceAlias Property Alias_FieldCOImperialEastmarchHQ Auto
ReferenceAlias Property Alias_FieldCOImperialFalkreathCamp Auto
ReferenceAlias Property Alias_FieldCOImperialFalkreathHQ Auto
ReferenceAlias Property Alias_FieldCOImperialHaafingarCamp Auto
ReferenceAlias Property Alias_FieldCOImperialHaafingarHQ Auto
ReferenceAlias Property Alias_FieldCOImperialHjaalmarchCamp Auto
ReferenceAlias Property Alias_FieldCOImperialHjaalmarchHQ Auto
ReferenceAlias Property Alias_FieldCOImperialPaleCamp Auto
ReferenceAlias Property Alias_FieldCOImperialPaleHQ Auto
ReferenceAlias Property Alias_FieldCOImperialReachCamp Auto
ReferenceAlias Property Alias_FieldCOImperialReachHQ Auto
ReferenceAlias Property Alias_FieldCOImperialRiftCamp Auto
ReferenceAlias Property Alias_FieldCOImperialRiftHQ Auto
ReferenceAlias Property Alias_FieldCOImperialWhiterunCamp Auto
ReferenceAlias Property Alias_FieldCOImperialWhiterunHQ Auto
ReferenceAlias Property Alias_FieldCOImperialWinterholdCamp Auto
ReferenceAlias Property Alias_FieldCOImperialWinterholdHQ Auto
ReferenceAlias Property Alias_FieldCOSonsEastmarchCamp Auto
ReferenceAlias Property Alias_FieldCOSonsEastmarchHQ Auto
ReferenceAlias Property Alias_FieldCOSonsFalkreathCamp Auto
ReferenceAlias Property Alias_FieldCOSonsFalkreathHQ Auto
ReferenceAlias Property Alias_FieldCOSonsHaafingarCamp Auto
ReferenceAlias Property Alias_FieldCOSonsHaafingarHQ Auto
ReferenceAlias Property Alias_FieldCOSonsHjaalmarchCamp Auto
ReferenceAlias Property Alias_FieldCOSonsHjaalmarchHQ Auto
ReferenceAlias Property Alias_FieldCOSonsPaleCamp Auto
ReferenceAlias Property Alias_FieldCOSonsPaleHQ Auto
ReferenceAlias Property Alias_FieldCOSonsReachCamp Auto
ReferenceAlias Property Alias_FieldCOSonsReachHQ Auto
ReferenceAlias Property Alias_FieldCOSonsRiftCamp Auto
ReferenceAlias Property Alias_FieldCOSonsRiftHQ Auto
ReferenceAlias Property Alias_FieldCOSonsWhiterunCamp Auto
ReferenceAlias Property Alias_FieldCOSonsWhiterunHQ Auto
ReferenceAlias Property Alias_FieldCOSonsWinterholdCamp Auto
ReferenceAlias Property Alias_FieldCOSonsWinterholdHQ Auto

;# Aliases in OTHER quests #
LocationAlias Property CWSiegeCity Auto

LocationAlias Property CWFortSiegeCapitalFort Auto ;fort alias in CWFortSiegeCapital

;## Factions ##
Faction Property PlayerFaction Auto

Faction Property CWBuddies Auto

faction Property CWImperialFaction Auto
faction Property CWSonsFaction Auto
faction Property CWImperialFactionNPC Auto
faction Property CWSonsFactionNPC Auto

Faction Property CWDisaffectedSoldierFaction Auto		;used for soldiers who will switch sides in CWMissions (see CWMission06 for an example)

faction Property CrimeFactionImperial Auto		;general crime group for faction, soldiers who are attacking in a campagin should have this faction - sends criminals to faction HQ
faction Property CrimeFactionSons Auto			;general crime group for faction, soldiers who are attacking in a campagin should have this faction - sends criminals to faction HQ

faction Property IsGuardFaction Auto

faction Property CrimeFactionHaafingar Auto					
faction Property CrimeFactionReach Auto					
faction Property CrimeFactionHjaalmarch Auto					
faction Property CrimeFactionWhiterun Auto					
faction Property CrimeFactionFalkreath Auto					
faction Property CrimeFactionPale Auto					
faction Property CrimeFactionWinterhold Auto					
faction Property CrimeFactionEastmarch Auto					
faction Property CrimeFactionRift Auto					

faction Property CWDialogueSoldierFaction Auto
faction Property CWDialogueSoldierWaitingToAttackFaction Auto
faction Property CWDialogueSoldierWaitingToDefendFaction Auto

faction Property CWJobFortCommanderFaction Auto
faction Property CWJobFortGatekeeperFaction Auto
faction Property CWJobFortJailorFaction Auto
faction Property CWJobFortPatrolExteriorFaction Auto

Faction Property CWSoldierAttackerFaction Auto
Faction Property CWSoldierDefenderFaction Auto

Faction Property CWSoldierArcherFaction Auto
Faction Property CWSoldierMageFaction Auto

Faction Property CWSurrenderTemporaryAllies Auto

Faction Property GovImperial Auto
Faction Property GovSons Auto

Faction Property CWFieldCOActiveMissionFaction Auto
Faction Property CWFieldCOFailedMissionFaction Auto
Faction Property CWFieldCOHooksAcceptedFaction Auto
Faction Property CWFieldCOPotentialMission1Faction Auto
Faction Property CWFieldCOPotentialMission2Faction Auto
Faction Property CWFieldCOSuccessfulMissionFaction Auto

Faction Property FavorAllowBribeFaction Auto

faction Property CWRewardFactionFalkreath Auto
faction Property CWRewardFactionHjaalmarch Auto
faction Property CWRewardFactionPale Auto
faction Property CWRewardFactionReach Auto
faction Property CWRewardFactionRift Auto
faction Property CWRewardFactionWhiterun Auto
faction Property CWRewardFactionWinterhold Auto



;## Locations ##

;# Haafingar
Location property HaafingarHoldLocation auto

Location property FortHraggstadLocation auto
Location property SolitudeLocation auto	;capital

Location property SolitudeSawmillLocation auto
Location property KatlasFarmLocation auto
Location property DragonBridgeLocation auto

;Location Property MilitaryCampHaafingarImperialLocation Auto
Location Property MilitaryCampHaafingarSonsLocation Auto


;# Reach
Location property ReachHoldLocation auto

Location property FortSungardLocation auto
Location property MarkarthLocation auto	;capital

Location property CidhnaMineLocation auto
Location property LeftHandMineLocation auto
Location property SalviusFarmLocation auto
Location property KarthwastenLocation auto
Location property OldHroldanLocation auto
Location property KolskeggrMineLocation auto

Location Property MilitaryCampReachImperialLocation auto
Location Property MilitaryCampReachSonsLocation Auto

;# Hjaalmarch
Location property HjaalmarchHoldLocation auto

Location property FortSnowhawkLocation auto
Location property MorthalLocation auto	;capital

Location property StonehillsLocation auto	
;Location property FrostRiverFarmLocation auto ;OBSOLETE -- GONE NOT IN GAME

Location Property MilitaryCampHjaalmarchImperialLocation auto
Location Property MilitaryCampHjaalmarchSonsLocation Auto

;# Whiterun
Location property WhiterunHoldLocation auto

Location property FortGreymoorLocation auto
Location property WhiterunLocation auto	;capital

Location property BattleBornFarmLocation auto
Location property ChillfurrowFarmLocation auto
Location property PelagiaFarmLocation auto
Location property RoriksteadLocation auto
Location property RiverwoodLocation auto
;Location property BarleydarkFarmLocation auto   ;OBOSETE GONE CUT FROM GAME

Location Property MilitaryCampWhiterunImperialLocation auto
Location Property MilitaryCampWhiterunSonsLocation Auto

;# Falkreath
Location property FalkreathHoldLocation auto

Location property FortNeugradLocation auto
Location property FalkreathLocation auto	;capital

;Location property GraniteHillLocation auto   CUT FROM GAME
Location property HelgenLocation auto
;Location property BearsCaveMillLocation auto   CUT FROM GAME
Location property HalfmoonMillLocation auto

Location Property MilitaryCampFalkreathImperialLocation auto
Location Property MilitaryCampFalkreathSonsLocation Auto

;# Pale
Location property PaleHoldLocation auto

Location property FortDunstadLocation auto
Location property DawnstarLocation auto	;capital

;Location property HeljarchenLocation auto OBSOLETE CUT FROM GAME
Location property AngasMillLocation auto
Location property LoreiusFarmLocation auto

Location Property MilitaryCampPaleImperialLocation auto
Location Property MilitaryCampPaleSonsLocation Auto

;# Winterhold
Location property WinterholdHoldLocation auto

Location property FortKastavLocation auto
Location property WinterholdLocation auto 	;capital

Location property WhistlingMineLocation auto

Location Property MilitaryCampWinterholdImperialLocation auto
Location Property MilitaryCampWinterholdSonsLocation Auto

;# Eastmarch
Location property EastmarchHoldLocation auto

Location property FortAmolLocation auto
Location property WindhelmLocation auto ;capital

Location property BrandyMugFarmLocation auto
Location property HlaaluFarmLocation auto
Location property HollyfrostFarmLocation auto
Location property KynesgroveLocation auto
Location property DarkwaterCrossingLocation auto
Location property MixwaterMillLocation auto

Location Property MilitaryCampEastmarchImperialLocation auto
;Location Property MilitaryCampEastmarchSonsLocation Auto

;# Rift
Location property RiftHoldLocation auto

Location property FortGreenwallLocation auto
Location property RiftenLocation auto	;capital

Location property SnowShodFarmLocation auto
;Location property GoldenglowFarmLocation auto  -- GoldenGlowFarm is NOT a normal location. It's quest specific area spawning it's own guards, and should not be part of the Civil War.
Location property MerryfairFarmLocation auto
Location property IvarsteadLocation auto
Location property ShorsStoneLocation auto
Location property HeartwoodMillLocation auto
Location property SarethiFarmLocation auto

Location Property MilitaryCampRiftImperialLocation auto
Location Property MilitaryCampRiftSonsLocation Auto


;# ActorBases #

;These are used by CWMissionScript which is used by all the CWMission quests so it's more convenient if they live here
ActorBase Property CWSoldierImperial Auto
ActorBase Property CWSoldierImperialNotGuard Auto
ActorBase Property CWSoldierSons Auto
ActorBase Property CWSoldierSonsNotGuard Auto

ActorBase Property CWSoldierImperialNonNPCFaction Auto
ActorBase Property CWSoldierImperialNotGuardNonNPCFaction Auto
ActorBase Property CWSoldierSonsNonNPCFaction Auto
ActorBase Property CWSoldierSonsNotGuardNonNPCFaction Auto


ActorBase Property CWCourierImperial Auto
ActorBase Property CWCourierSons Auto
ActorBase Property CWPrisonerImperial Auto
ActorBase Property CWPrisonerSons Auto

ActorBase Property CWPrisonerImperialA Auto
ActorBase Property CWPrisonerImperialB Auto
ActorBase Property CWPrisonerImperialC Auto
ActorBase Property CWPrisonerImperialD Auto


ActorBase Property CWPrisonerSonsA Auto
ActorBase Property CWPrisonerSonsB Auto
ActorBase Property CWPrisonerSonsC Auto
ActorBase Property CWPrisonerSonsD Auto

;## Outfits ##
Outfit Property CWSoldierImperialSoldierOutfit Auto
Outfit Property CWSoldierSonsSoldierOutfit Auto

;## MiscObjects ##
MiscObject Property Gold001 Auto		;pointer to Gold001 object


;## Leveled Item lists ##
LeveledItem Property CWCourierDocumentsImperial Auto		;until we have LeveledItem objects that I can point at in the editor, these are being set with GetForm() in the OnInit() block below... that needs to be removed from OnInit() block as soon as these are LeveledItem that I can set in the editor.
LeveledItem Property CWCourierDocumentsSons Auto			;until we have LeveledItem objects that I can point at in the editor, these are being set with GetForm() in the OnInit() block below... that needs to be removed from OnInit() block as soon as these are LeveledItem that I can set in the editor.

LeveledItem Property CWRank1RewardImperial Auto					;reward player gets when gaining faction rank	
LeveledItem Property CWRank2RewardImperial Auto					;reward player gets when gaining faction rank
LeveledItem Property CWRank3RewardImperial Auto					;reward player gets when gaining faction rank
LeveledItem Property CWRank4RewardImperial Auto					;reward player gets when gaining faction rank


LeveledItem Property CWRank1RewardSons Auto	;-intially same as imperial reward, flavored as taken from an imperial officer				;reward player gets when gaining faction rank	
LeveledItem Property CWRank2RewardSons Auto					;reward player gets when gaining faction rank
LeveledItem Property CWRank3RewardSons Auto					;reward player gets when gaining faction rank
LeveledItem Property CWRank4RewardSons Auto					;reward player gets when gaining faction rank

LeveledItem Property CWMissionReward Auto	;reward player gets after each successful mission

LeveledItem Property CWSoldierImperialGear auto
LeveledItem Property CWSoldierSonsGear auto

LeveledItem Property CWBearArmorPlayerReward Auto


;## Packages ##
Package Property CWGalmarAtCampFalkreath Auto
Package Property CWGalmarAtCampHaafingar Auto
Package Property CWGalmarAtCampHjaalmarch Auto
Package Property CWGalmarAtCampPale Auto
Package Property CWGalmarAtCampReach Auto
Package Property CWGalmarAtCampRift Auto
Package Property CWGalmarAtCampWinterhold Auto

Package Property CWRikkeAtCampEastmarch Auto
Package Property CWRikkeAtCampFalkreath Auto
Package Property CWRikkeAtCampHjaalmarch Auto
Package Property CWRikkeAtCampPale Auto
Package Property CWRikkeAtCampReach Auto
Package Property CWRikkeAtCampRift Auto
Package Property CWRikkeAtCampWinterhold Auto


;## ObjectReferences ##
ObjectReference Property CWFieldCOMapTableMarkerEastmarchCampImperial Auto
ObjectReference Property CWFieldCOMapTableMarkerFalkreathCampImperial Auto
ObjectReference Property CWFieldCOMapTableMarkerHjaalmarchCampImperial Auto
ObjectReference Property CWFieldCOMapTableMarkerPaleCampImperial Auto
ObjectReference Property CWFieldCOMapTableMarkerReachCampImperial Auto
ObjectReference Property CWFieldCOMapTableMarkerRiftCampImperial Auto
ObjectReference Property CWFieldCOMapTableMarkerWhiterunCampImperial Auto
ObjectReference Property CWFieldCOMapTableMarkerWinterholdCampImperial Auto

ObjectReference Property CWFieldCOMapTableMarkerFalkreathCampSons Auto
ObjectReference Property CWFieldCOMapTableMarkerHaafingarCampSons Auto
ObjectReference Property CWFieldCOMapTableMarkerHjaalmarchCampSons Auto
ObjectReference Property CWFieldCOMapTableMarkerPaleCampSons Auto
ObjectReference Property CWFieldCOMapTableMarkerReachCampSons Auto
ObjectReference Property CWFieldCOMapTableMarkerRiftCampSons Auto
ObjectReference Property CWFieldCOMapTableMarkerWhiterunCampSons Auto
ObjectReference Property CWFieldCOMapTableMarkerWinterholdCampSons Auto

ObjectReference Property CWGarrisonEnableMarkerSonsCampFalkreath Auto

;#### Actors ####
Actor Property UlfricRef Auto
Actor Property GeneralTulliusRef Auto

Actor Property HadvarRef Auto
Actor Property RalofRef Auto


;# CWCampaignStart SendStoryEvent references

;!!! *** !!! *** Don't forget to actually hook these up in the editor when they come on line !!! *** !!! *** 
ObjectReference property CWCampaignStartMarkerReach auto
ObjectReference property CWCampaignStartMarkerHjaalmarch auto
ObjectReference property CWCampaignStartMarkerWhiterun auto
ObjectReference property CWCampaignStartMarkerFalkreath auto
ObjectReference property CWCampaignStartMarkerPale auto
ObjectReference property CWCampaignStartMarkerWinterhold auto
ObjectReference property CWCampaignStartMarkerRift auto

ObjectReference property CWCampaignStartMarkerHaafingar auto
ObjectReference property CWCampaignStartMarkerEastmarch auto


;# Map Markers
;Military Camps
ObjectReference property MilitaryCampEastmarchImperialMapMarker auto 
ObjectReference property MilitaryCampFalkreathImperialMapMarker auto 
ObjectReference property MilitaryCampFalkreathSonsMapMarker auto 
ObjectReference property MilitaryCampHaafingarSonsMapMarker auto 
ObjectReference property MilitaryCampHjaalmarchImperialMapMarker auto 
ObjectReference property MilitaryCampHjaalmarchSonsMapMarker auto 
ObjectReference property MilitaryCampPaleImperialMapMarker auto 
ObjectReference property MilitaryCampPaleSonsMapMarker auto 
ObjectReference property MilitaryCampReachImperialMapMarker auto 
ObjectReference property MilitaryCampReachSonsMapMarker auto 
ObjectReference property MilitaryCampRiftImperialMapMarker auto 
ObjectReference property MilitaryCampRiftSonsMapMarker auto 
ObjectReference property MilitaryCampWhiterunImperialMapMarker auto 
ObjectReference property MilitaryCampWhiterunSonsMapMarker auto 
ObjectReference property MilitaryCampWinterholdImperialMapMarker auto 
ObjectReference property MilitaryCampWinterholdSonsMapMarker auto 

ObjectReference Property CWGarrisonEnableMarkerImperialCampEastmarch Auto
ObjectReference Property CWGarrisonEnableMarkerSonsCampHaafingar Auto



;## Keywords ##

Keyword Property CWMissionStart Auto

Keyword Property CWGarrison Auto
Keyword Property CWGarrisonDefenderOnly Auto

Keyword Property CWFort Auto

Keyword Property CWDiplomaticVictory Auto
Keyword Property CWOwner Auto
Keyword Property CWCampaignStart Auto
Keyword Property CWGovernmentStart  Auto
Keyword Property CWCost Auto
Keyword Property CWCampImperial Auto
Keyword Property CWCampSons Auto
Keyword Property CWCapital Auto


keyword Property CWResetGarrisonStart1 Auto
keyword Property CWResetGarrisonStart2 Auto
keyword Property CWResetGarrisonStart3 Auto
keyword Property CWResetGarrisonStart4 Auto
keyword Property CWResetGarrisonStart5 Auto
keyword Property CWResetGarrisonStart6 Auto
keyword Property CWResetGarrisonStart7 Auto
keyword Property CWResetGarrisonStart8 Auto

keyword Property CWAttackCityStart Auto
keyword Property CWEscapeCityStart Auto
keyword Property CWPrepareCityStart Auto

keyword Property CW1PrioritySpawn Auto 	;for use with CWReinforcementControllerScript
keyword Property CW2PrioritySpawn Auto 	;for use with CWReinforcementControllerScript
keyword Property CW3PrioritySpawn Auto 	;for use with CWReinforcementControllerScript
keyword Property CW4PrioritySpawn Auto 	;for use with CWReinforcementControllerScript
keyword Property CW5PrioritySpawn Auto 	;for use with CWReinforcementControllerScript

keyword Property CW1ForcedSpawn Auto 		;for use with CWReinforcementControllerScript
keyword Property CW2ForcedSpawn Auto 		;for use with CWReinforcementControllerScript
keyword Property CW3ForcedSpawn Auto 		;for use with CWReinforcementControllerScript
keyword Property CW4ForcedSpawn Auto 		;for use with CWReinforcementControllerScript
keyword Property CW5ForcedSpawn Auto 		;for use with CWReinforcementControllerScript

Keyword Property LocTypeCity Auto
Keyword Property CWSiegeStart Auto
Keyword Property CWSiegeRunning Auto
Keyword Property CWFortSiegeSpecialStart Auto
Keyword Property CWFinaleStart Auto
Keyword Property CWFortSiegeMinorCapitalStart Auto

Keyword Property CWResolution01Start Auto		;OBSOLETE
Keyword Property CWResolution02Start Auto		;OBSOLETE

Keyword Property CWCitizensFleeStart Auto

Keyword Property CWEventHappening Auto

;## LocationRefTypes ##
LocationRefType Property CWSoldier Auto

LocationRefType Property CWResolutionJarlMarker Auto			;used to find markers in CWAttackCity resolution quest to place Jarl, House carl, and body guards to meet the player's attempt to surrender
LocationRefType Property CWResolutionHouseCarlMarker Auto	;used to find markers in CWAttackCity resolution quest to place Jarl, House carl, and body guards to meet the player's attempt to surrender
LocationRefType Property CWResolutionJarlGuardMarker Auto	;used to find markers in CWAttackCity resolution quest to place Jarl, House carl, and body guards to meet the player's attempt to surrender


;## Messages ##

;OBSOLETE:
Message Property CWCampaignWonFalkreathImperials Auto
Message Property CWCampaignWonFalkreathSons Auto
Message Property CWCampaignWonHjaalmarchImperials Auto
Message Property CWCampaignWonHjaalmarchSons Auto
Message Property CWCampaignWonPaleImperials Auto
Message Property CWCampaignWonPaleSons Auto
Message Property CWCampaignWonReachImperials Auto
Message Property CWCampaignWonReachSons Auto
Message Property CWCampaignWonRiftImperials Auto
Message Property CWCampaignWonRiftSons Auto
Message Property CWCampaignWonWhiterunImperials Auto
Message Property CWCampaignWonWhiterunSons Auto
Message Property CWCampaignWonWinterholdImperials Auto
Message Property CWCampaignWonWinterholdSons Auto
;endOBSOLETE

Message Property CWCampaignOutcomeLostAttackMsgImperial Auto
Message Property CWCampaignOutcomeLostAttackMsgSons Auto
Message Property CWCampaignOutcomeLostDefenseMsgImperial Auto
Message Property CWCampaignOutcomeLostDefenseMsgSons Auto
Message Property CWCampaignOutcomeWonAttackMsgImperial Auto
Message Property CWCampaignOutcomeWonAttackMsgSons Auto
Message Property CWCampaignOutcomeWonDefenseMsgImperial Auto
Message Property CWCampaignOutcomeWonDefenseMsgSons Auto


Message Property CWCampaignTruce Auto

;################################ ----------- Events ----------- ################################

Event OnInit()	;I COULD SET THESE WHEN I DECLARE THE PROPERTIES HOWEVER, MANY OF THESE ARE "DEBUG SETTINGS" AND "GAME SETTINGS" SO I PREFER TO SET THEM ALL HERE
; 		debug.trace("CWScript OnInit()")
		log("CWScript", "OnInit()")

		;DEBUG MODE?
		debugOn.value = 0						;Global CWDebugOn, turns on warnings
		
		;OBSOLETE
			;CWDebugForceAttacker.value = 0 ;2 = Sons		;forces an attacker regardless of coin toss and # of consecutive attacks
			;CWDebugForceHold.value = 0 ;4	= Whiterun		;forces a hold to picked to be contested... might be unforced if this results in a failure to pick the hold because it breaks the rules
			;debugAllowNonAdjacentHolds = 0; 	;allows attacker to attack non-adjacent holds		
			;debugForceOffscreenResult = 0 ;1	;forces each campaign to process it's result immediately offscreen
			;debugDBTraces = 1
			;debugStartingCampaignPhase = 1 ;4 = resolution phase 	;the phase that the campaign starts in, for example, you could force the campaign to always start in the resolution phase if you need to test a resolution quest
											;note: setting this to 4 and doing two consecutive campaigns may break until "DeleteWhenAble()" becomes threaded because it won't be able to start the resolution quest because it might still be running. PCB (purge cell buffers) will get around the problem
			;setting these to 1 will cause the major holds to be winable offscreen immediately
			;playerJoinedCampaginReach = 0
			;playerJoinedCampaginWhiterun = 0
			;playerJoinedCampaginRift = 0
			
			
		;debugSkipSetOwnerCalls = 0			;skips set owner calls, causes campaign to start much faster, will break things and is for speeding up certain kinds of playtesting
		
		;debugTreatCityCapitalsAsTowns = 0 ;1					;NOTE: FUNCTIONALITY MIGHT NO LONGER WORK -- causes Cities such as Whiterun, to be considered towns and start minor hold resolution quests
		
		
		;More or less obsolete... not sure if I use these anywhere, so I'm keeping them just in case
		MaxAttackDelta = 20		;-20 is treated as max in the negative as well
		resolutionAttackDeltaMultiplier = 1.5

		;set Hold ownership at the start of the game 
		OwnerHaafingar = 1
		OwnerReach = 1
		OwnerHjaalmarch = 1
		OwnerWhiterun = 1	
		OwnerFalkreath = 1
		OwnerPale = 2
		OwnerWinterhold = 2
		OwnerEastmarch = 2
		OwnerRift = 2
		
		setInitalOwnerKeywordDataOnly()	;sets CWOwner keyword data to the numbers above
		
		
		;Sets the CountHoldsImperial and CountHoldsSons properties and associated globals
		setCountHoldProperties()
		
		;OBSOLETE?? -- set Attack Strength Value each Hold grants an adjacent contested hold (used by setStrengthPoints()) 
		StrValueHaafingar = 5
		StrValueReach	 = 5
		StrValueHjaalmarch = 3
		StrValueWhiterun = 5
		StrValueFalkreath = 3
		StrValuePale = 3
		StrValueWinterhold = 3
		StrValueEastmarch = 5
		StrValueRift = 5

		;set costs associated with CWCost keyword data for garrisons
		iCostNonContestable = 9999
		iCostFort = 9999	;*** I've decided to make it impossible to start off owning the fort if you are attacking the hold. The defender will not always start with the fort regardless of the attack delta. Resist the urge to change this. CWFortSiege quest (the quest you get to attack/defend a fort) makes use of the CWReinforcementControllerScript system, which ASSUMES that the attacker is the same as CW.Attacker and the defender is the same as CW.Defender. If it was possible to own the fort and be the attacker of the hold, then the CWFortSiege quest will break because it will assume the wrong thing about who is attacking/defending.
		iCostSmall = 1
		iCostMedium = 2
		iCostLarge = 3
		iCostPatrol = 1
		
		;OBSOLETE? MAYBE NOT?
		;I have a vague feeling I'm using the iCostNonContestable somewhere still, so I probably shouldn't comment out this function call
		setInitialCosts();establish CWCost keyword values
		
		;set player campaign salary
		baseSalary = 100
		SalaryMultRank1 = 1.25
		SalaryMultRank2 = 1.5
		SalaryMultRank3 = 2.0
		SalaryMultRank4 = 3.0
	
		
		;OBSOLETE?
		;used by CWHoldManagerScript attached to this quest
		;RegisterForUpdate(5)		

		;*** I'm commenting this out to prevent seeing the initial log spam generated by the CWReset quest. When I can trace to seperate logs I should turn this back on
		;Note: It's strictly not needed since the original state of the game should be set up with how the enable markers are set in the esm... however, it seems safer to do a once through in Script.
		;set up the original owners of all the holds
		;setInitialOwners()
		
		;needed especially if we aren't calling setInitialOwners()
		initializeFortOwnerKeywordData()
		
		;this starts off overrun with Forsworn there's a quest that will add it back to the war
		RemoveGarrisonFromWar(KolskeggrMineLocation)
		
		;starts without guards for Main Quest
		RemoveGarrisonFromWar(RiverwoodLocation)
		
		;Forts start with enemies in them that need to be cleared out
		RemoveGarrisonFromWar(FortHraggstadLocation)
		RemoveGarrisonFromWar(FortSungardLocation)
		RemoveGarrisonFromWar(FortSnowhawkLocation)
		RemoveGarrisonFromWar(FortGreymoorLocation)
		RemoveGarrisonFromWar(FortNeugradLocation)
		RemoveGarrisonFromWar(FortDunstadLocation)
		RemoveGarrisonFromWar(FortKastavLocation)
		RemoveGarrisonFromWar(FortAmolLocation)
		RemoveGarrisonFromWar(FortGreenWallLocation)
		
		EnemyFortsAddedBackToWar = False	;false by default, here as a reminder
		
		
		
		;turn off dragon attacks at Whiterun city, will be turned back on after the siege
		;WIs.DisallowDragons(WhiterunLocation)
		;** NOW HAPPENS IN WIFunctions attached to WI quest, and we won't be turning it back on
		
		
		init += 1		;this should never be more than 1, if > 1 it means the OnInit() has run more than once unexpectedly
EndEvent

;auto State WaitingToStartNewCampaign
;	Event OnUpdate()
;		log("CWScript", "State WaitingToStartNewCampaign OnUpdate()")
;	
;		if debugForceOffscreenResult == 1 && WarIsActive == 1
;			GoToState("StartingNewCampaignOffscreenMode")
;			log("CWScript", "WaitingToStartNewCampaign, WarIsActive == 1 & CWCampaign.IsRunning() == False, going to state StartingNewCampaignOffscreenMode.")
;			
;				;### START NEW CAMPAIGN
;				StartNewCampaign()
;			
;		elseif WarIsActive == 1
;			if CWCampaign.IsRunning() == False
;				GoToState("StartingNewCampaign")
;				log("CWScript", "WaitingToStartNewCampaign, WarIsActive == 1 & CWCampaign.IsRunning() == False, going to state StartingNewCampaign.")
;				
;				;### START NEW CAMPAIGN
;				StartNewCampaign()
;			
;			EndIf
;		
;		Else
;			log("CWScript", "WaitingToStartNewCampaign, WarIsActive == 0, keep waiting.")
;		
;		EndIf
;	
;	EndEvent
;
;
;EndState
;
;State StartingNewCampaign
;	Event OnUpdate()
;			if CWCampaign.IsRunning() == True 
;				GoToState("WaitingForCampaignToFinish")
;
;				log("CWScript", "StartingNewCampaign, CWCampaign.isRunning == True, going to state WaitingForCampaignToFinish.")
;							
;			Else
;				log("CWScript", "StartingNewCampaign, CWCampaign.isRunning == False, waiting for CWCampaign to start.")
;				
;			endif
;		
;	EndEvent
;
;EndState
;
;State StartingNewCampaignOffscreenMode
;	Event OnUpdate()
;		log("CWScript", "StartingNewCampaignOffscreenMode state OnUpdate() is doing nothing until StartNewCampaign() function call has called ResolveOffscreen() and that function call has finished.")
;
;
;	EndEvent
;
;EndState
;
;State WaitingForCampaignToFinish
;	Event OnUpdate()
;	
;		if CWCampaign.IsRunning() == False
;			GoToState("WaitingToStartNewCampaign")
;
;			log("CWScript", "WaitingForCampaignToFinish, CWCampaign.IsRunning() == False, going to state WaitingToStartNewCampaign.")
;
;
;			
;		Else
;			log("CWScript", "WaitingForCampaignToFinish, CWCampaign.IsRunning() == True, waiting for CWCampaign quest to stop.")
;		
;		endif
;
;	EndEvent
;EndState
;
;
;State ResolvingCampaignOffscreen
;	Event OnUpdate()
;		log("CWScript", "ResolvingCampaignOffscreen state OnUpdate() is doing nothing until ResolveOffscreen() function call has finished.")
;
;
;	EndEvent
;
;EndState






;################################ ----------- FUNCTIONS ----------- ################################

function log(string fileName, string stringToPrint, int severity = 0, bool AlwaysPrintLog = false, bool AlwaysPrintToMainLog = false) Global
{Will print to main papyrus log and the specified file if CWDebugOn global is true, or optional pararms are true}

	bool success 
	int debugMode = (Game.GetForm(0X0003F7D2) as GlobalVariable).GetValue() as Int	;this is the CWDebugOn global variable in the ESM.
			
	;print to specified log	
	if debugMode == 1 || AlwaysPrintLog 
		debug.OpenUserLog(fileName) 
	
; 		success = debug.traceUser(fileName, " " + stringToPrint, severity)
	
		if success == False
; 			debug.trace("CWScript  WARNING: log() Failed to print to " + FileName + ": " + stringToPrint, 2)
		EndIf
		
	EndIf
	
	;print to main log
	if debugMode == 1 || AlwaysPrintToMainLog
; 		debug.trace(fileName + "-> " + stringToPrint, severity)
	EndIf
	
EndFunction



function AddCivilWarAchievment(int whichCivilWarAchivement, Location AssociatedLocation = None)
{1 = Join a side, 2 =  Take a fort in Reach or Rift, 3 = Win the war}

	log("CWScript", "AddCivilWarAchievment(" + whichCivilWarAchivement + ")")

	if whichCivilWarAchivement == 1		;JOIN A SIDE
		Game.AddAchievement(21)
	elseif whichCivilWarAchivement == 2		;TAKE FORT IN REACH OR RIFT
		if AssociatedLocation == FortSungardLocation || AssociatedLocation == FortGreenwallLocation
			Game.AddAchievement(22)
		EndIf
	
	elseif whichCivilWarAchivement == 3		;WIN THE WAR
		Game.AddAchievement(23)
	EndIf

EndFunction


;OBSOLETE - from when there was multiple campaigns running at the same time
function modObjectiveByEnemySoldierDeath(Actor DeadSoldier, int AmountToMod = 1, Location Hold = None)
	log("CWScript", "modObjectiveByEnemySoldierDeath(" + DeadSoldier + ")")

	if IsPlayerInMyFaction(DeadSoldier)
		log("CWScript", "modObjectiveByEnemySoldierDeath(" + DeadSoldier + ") is in same faction as player. Ignored.")
	
	Else
		log("CWScript", "modObjectiveByEnemySoldierDeath(" + DeadSoldier + ") Will find the hold, mod the appropriate CWObjXXX, and update the approprirate objective")

		location myHold 

		if Hold == None
			myHold = GetMyCurrentHoldLocation(DeadSoldier)
		
		Else
			MyHold = Hold
		EndIf
		
		int myHoldID = GetHoldID(myHold)
		GlobalVariable myCWObjGlobal = GetCWObjGlobal(myHoldID)
		
		modCWObjGlobal(myCWObjGlobal, AmountToMod)
		
		log("CWScript", "modObjectiveByEnemySoldierDeath(" + DeadSoldier + ") Calling updateObjective with the hold location found for " + DeadSoldier)
		updateObjective(myHold)
		
	EndIf
	
EndFunction

;OBSOLETE - from when there was multiple campaigns running at the same time
function modObjectiveBySabotage(ResourceObjectScript ResourceObject, int AmountToMod = 5)
	log("CWScript", "modObjectiveBySabotage(" + ResourceObject + ")")

	location myHold = GetMyCurrentHoldLocation(ResourceObject)
	
	if myHold.GetKeywordData(CWOwner) == PlayerAllegiance
		log("CWScript", "modObjectiveBySabotage(" + ResourceObject + ") is in hold owned by faction the player is allied to. Ignored.")
	
	Else
		log("CWScript", "modObjectiveBySabotage(" + ResourceObject + ") Will mod the appropriate CWObjXXX, and update the approprirate objective")

		
		int myHoldID = GetHoldID(myHold)
		GlobalVariable myCWObjGlobal = GetCWObjGlobal(myHoldID)
		
		modCWObjGlobal(myCWObjGlobal, AmountToMod)
		
		log("CWScript", "modObjectiveBySabotage(" + ResourceObject + ") Calling updateObjective with the hold location found for " + ResourceObject)
		updateObjective(myHold)
		
	EndIf
	
EndFunction

;OBSOLETE - from when there was multiple campaigns running at the same time
function modObjectiveByMissionSuccess(Location HoldLocation, int AmountToMod = 25)
	log("CWScript", "modObjectiveByMissionSuccess(" + HoldLocation + ", " + AmountToMod + ")")

	;bailout if the hold is owned by the players Faction 
	;this way you can still get missions in holds you control - we will try this, might not ship with it
	if GetOwner(HoldLocation) == PlayerAllegiance
		log("CWScript", "modObjectiveByMissionSuccess(" + HoldLocation + ") hold is owned by player's faction, bailing out before modding the objective")
		Return
	EndIf
	
	
	int myHoldID = GetHoldID(HoldLocation)
	GlobalVariable myCWObjGlobal = GetCWObjGlobal(myHoldID)
	
	modCWObjGlobal(myCWObjGlobal, AmountToMod)
	
	log("CWScript", "modObjectiveByMissionSuccess() Calling updateObjective(" + HoldLocation +")" )
	updateObjective(HoldLocation)

	
EndFunction

;OBSOLETE - from when there was multiple campaigns running at the same time
function modCWObjGlobal(GlobalVariable GlobalToModify, float amountToAdd)
	float CWObjVal = (GlobalToModify.GetValue() as int + amountToAdd) as int
	
	;cap at 99%

	if CWObjVal > 99
		CWObjVal = 99.0
	EndIf
	
	log("CWScript", "modCWObjGlobal() Calling OBSOLETE NOT INCREMENTING GLOBAL()", 1 )
;	GlobalToModify.SetValue(CWObjVal)
	
EndFunction


function completeCWObj(Location HoldWhoseObjectiveToComplete)
	int myHoldID = GetHoldID(HoldWhoseObjectiveToComplete)
	GlobalVariable myCWObjGlobal = GetCWObjGlobal(myHoldID)
	
	;if this is the first Whiterun siege (we assume this because the whiterun siege is always the first one)
	if WhiterunSiegeFinished == False
		WhiterunSiegeFinished = True
		displayFactionLeaderObjective()
		
		;This is a little awkward, as it causes the objective to display for the first time completed
		;but it prevents the problem of getting the Whiterun Objective again in stage 4 of CW Script
		myCWObjGlobal.setValue(100)	
		updateObjective(HoldWhoseObjectiveToComplete, MarkObjectiveComplete = True)
		
	else
		myCWObjGlobal.setValue(100)	
		updateObjective(HoldWhoseObjectiveToComplete, MarkObjectiveComplete = True)
	
	EndIf
	
EndFunction

;OBSOLETE - from when there was multiple campaigns running at the same time
function failCWObj(Location HoldWhoseObjectiveToFail)
	int myHoldID = GetHoldID(HoldWhoseObjectiveToFail)
	GlobalVariable myCWObjGlobal = GetCWObjGlobal(myHoldID)

	;if this is the first Whiterun siege (we assume this because the whiterun siege because that is always the first one)
	if WhiterunSiegeFinished == False
		WhiterunSiegeFinished = True
		displayFactionLeaderObjective()
		
	else
		updateObjective(HoldWhoseObjectiveToFail, FailObjective = True, GlobalToResetDueToFailure = myCWObjGlobal)
		myCWObjGlobal.setValue(0)
		updateObjective(HoldWhoseObjectiveToFail)
		
	EndIf
	
EndFunction


function updateObjective(location HoldLocationWhoseObjectiveWeShouldUpdate, bool MarkObjectiveComplete = false, bool FailObjective = false, GlobalVariable GlobalToResetDueToFailure = None)
{This sets the global and flashes the objective for taking over the hold for the supplied location}

	if (PlayerInvolved == 1 && WarIsActive == 1) == false
		log("CWScript", "updateObjective() PlayerInvolved or WarIsActive, is not 1, NOT updating the objective." )
		
		Return
	
	EndIf


	;note: this works because in the CWObj quest are objectives with the following formula:
	;x0y where x is the number of the hold, and y is the number for the players Faction
	
	int HoldID = GetHoldID(HoldLocationWhoseObjectiveWeShouldUpdate) 
	
	int Obj = 100 * HoldID
	Obj += PlayerAllegiance

	if CWObj.IsObjectiveCompleted(Obj)
		;do nothing
	
	Else
	
		if MarkObjectiveComplete == True
			CWObj.SetObjectiveCompleted(Obj)
			displayFactionLeaderObjective()
		
		ElseIf FailObjective == True
		
			;Fail it
			CWObj.SetObjectiveFailed(Obj)
			
			;reset the percentage to completion
			GlobalToResetDueToFailure.SetValue(0)
			
			;reshow it
			CWObj.SetObjectiveFailed(Obj, True)
			CWObj.SetObjectiveDisplayed(Obj, abDisplayed = true, abForce = true)

			displayFactionLeaderObjective()
		
		else
		
			CWObj.UpdateCurrentInstanceGlobal(GetCWObjGlobal(HoldID))
			CWObj.SetObjectiveDisplayed(Obj, abDisplayed = true, abForce = true)
		
		EndIf
	endif

EndFunction


function displayFactionLeaderObjective()
	int talkToLeaderObj = 1000 + PlayerAllegiance		;objective 1001 / 1002 is Report to Tullius / Ulfric

	CWObj.setStage(1) ; for journal entry
	
	;because i want this to recur every time you finish taking a hold, set it not to be complete, then display it again	
	CWObj.SetObjectiveCompleted(talkToLeaderObj, false)	
	CWObj.SetObjectiveDisplayed(talkToLeaderObj, abDisplayed = true, abForce = true)
	
	CWObj.SetActive()

EndFunction

function DisplayHoldObjective()
;THIS HANDLES THE NEW LINEAR STYLE CAMPAIGN OBJECTIVES

	log("CWScript", "DisplayHoldObjective()")


	;***THIS LOGIC MUST BE IDENTICAL TO THE STACK OF DIALOGUE IN THE CW DIALOGUE WHERE Tullis/Ulfric TELL YOU WHERE TO GO NEXT ***
	if PlayerAllegiance == iImperials
		if getOwner(PaleHoldLocation) != iImperials
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(PaleHoldLocation) + iImperials, abDisplayed = true, abForce = true)
		
		Elseif getOwner(RiftHoldLocation) != iImperials
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(RiftHoldLocation) + iImperials, abDisplayed = true, abForce = true)
		
		Elseif getOwner(WinterholdHoldLocation) != iImperials
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(WinterholdHoldLocation) + iImperials, abDisplayed = true, abForce = true)			
		
		Elseif getOwner(HjaalmarchHoldLocation) != iImperials
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(HjaalmarchHoldLocation) + iImperials, abDisplayed = true, abForce = true)
		
		Elseif getOwner(FalkreathHoldLocation) != iImperials
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(FalkreathHoldLocation) + iImperials, abDisplayed = true, abForce = true)
		
		Elseif getOwner(ReachHoldLocation) != iImperials
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(ReachHoldLocation) + iImperials, abDisplayed = true, abForce = true)

		Elseif getOwner(EastmarchHoldLocation) != iImperials
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(EastmarchHoldLocation) + iImperials, abDisplayed = true, abForce = true)
		
		Else
		
		EndIf
	
	elseif PlayerAllegiance == iSons
			
		if getOwner(FalkreathHoldLocation) != iSons
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(FalkreathHoldLocation) + iSons, abDisplayed = true, abForce = true)
		
		Elseif getOwner(ReachHoldLocation) != iSons
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(ReachHoldLocation) + iSons, abDisplayed = true, abForce = true)
		
		Elseif getOwner(HjaalmarchHoldLocation) != iSons
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(HjaalmarchHoldLocation) + iSons, abDisplayed = true, abForce = true)
		
		Elseif getOwner(PaleHoldLocation) != iSons
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(PaleHoldLocation) + iSons, abDisplayed = true, abForce = true)
		
		Elseif getOwner(WinterholdHoldLocation) != iSons
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(WinterholdHoldLocation) + iSons, abDisplayed = true, abForce = true)
		
		Elseif getOwner(RiftHoldLocation) != iSons
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(RiftHoldLocation) + iSons, abDisplayed = true, abForce = true)
		
		Elseif getOwner(HaafingarHoldLocation) != iSons
			CWObj.SetObjectiveDisplayed(100 * GetHoldID(HaafingarHoldLocation) + iSons, abDisplayed = true, abForce = true)
		
		Else

		EndIf
		
	
	Else
	
	
	EndIf
	
	CWObj.SetActive()
	
EndFunction


string Function FactionName(int CWFaction)
	if CWFaction == iImperials
		return "Imperials"
	
	elseif CWFaction == iSons
		return "Sons"
	ElseIf CWFaction == iBothFactions
		return "Both Factions"
		
	Else
		return "unknown faction(" + CWFaction + ")"
	EndIf
	

EndFunction

string Function HoldName(int HoldNumber)
{Returns a string based on the HoldNumber. Corresponds with iWhiterun, iRift, etc. Not for use to display to player. Just for sending to debug traces where you have a number refering to a hold.}

	if HoldNumber == iHaafingar	;1
		return "Haafingar"
		
	elseif HoldNumber == iReach ;2
		return "Reach"
		
	elseif HoldNumber == iHjaalmarch ;3
		return "Hjaalmarch"
		
	elseif HoldNumber == iWhiterun ;4
		return "Whiterun"
		
	elseif HoldNumber == iFalkreath ;5
		return "Falkreath"
		
	elseif HoldNumber == iPale ;6
		return "Pale"
		
	elseif HoldNumber == iWinterhold ;7
		return "Winterhold"
		
	elseif HoldNumber == iEastmarch ;8
		return "Eastmarch"
		
	elseif HoldNumber == iRift ;9
		return "Rift"
	Else
		return "unknown hold"
	EndIf
   
EndFunction


faction Function getFaction(int FactionToReturn, bool ReturnNPCFaction = false)
{Takes an int and returns the appropriate faction (1 = Imperials, 2 = Sons), ReturnNPCFaction returns the NPC faction that makes them hostile to members of the opposite NPC faction}
	if FactionToReturn == iImperials
		if ReturnNPCFaction == false
			return CWImperialFaction
		else
			return CWImperialFactionNPC
		endif
		
	elseif FactionToReturn == iSons
		if ReturnNPCFaction == false
			return CWSonsFaction
		else
			return CWSonsFactionNPC
		endif	

	Else
		return None
		log("CWScript", "  WARNING: getFaction() encountered an unknown FactionToReturn. Expected 1 or 2, got " + FactionToReturn, 2, true, True)
		
	EndIf

EndFunction

faction function getPlayerAllegianceFaction(bool ReturnNPCFaction = false)
	return getFaction(PlayerAllegiance, ReturnNPCFaction)
EndFunction

faction Function getPlayerAllegianceEnemyFaction(bool ReturnNPCFaction = false)
	return getFaction(getOppositeFactionInt(PlayerAllegiance), ReturnNPCFaction)
EndFunction

int Function getOppositeFactionInt(int FactionWhoseOppositeYouWant)
	
	int returnVal
	
	if FactionWhoseOppositeYouWant == iImperials
		returnVal = iSons
		
	ElseIf FactionWhoseOppositeYouWant == iSons
		returnVal = iImperials
	Else
		log("CWScript", " WARNING: getOppositeFactionInt() encountered an unknown FactionWhoseOppositeYouWant. Expected 1 or 2, got " + FactionWhoseOppositeYouWant, 2, True, True)

	EndIf
	
	return returnVal
	
EndFunction

Actor Function GetRikkeOrGalmar(int iFaction = -1)
{Returns Rikke if iFaction == 1, or Galmar if iFaction == 2, uses PlayerAllegiance if iFaction == -1 (default)}

	Log("CWScript", "GetRikkeOrGalmar(" + iFaction +")")

	Actor ReturnRef

	if iFaction == -1
		iFaction = PlayerAllegiance
	EndIf
	
	if iFaction == 1
		ReturnRef = Rikke.GetActorReference()
	elseif iFaction == 2
		ReturnRef = Galmar.GetActorReference()
	Else
		log("CWScript", " WARNING: GetRikkeOrGalmar() encountered an unknown iFaction. Expected 1 or 2, got " + iFaction, 2, True, True)
	EndIf
	
	Log("CWScript", "GetRikkeOrGalmar() returning:" + ReturnRef)
	
	return returnRef
	


EndFunction

bool function CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(Actor ActorToCheck, Package PackageToCheck, Location LocationToCheck, ObjectReference MarkerToMoveTo)
	Log("CWScript", "CheckRikkeGalmarNotAtCampPackageLocation(" + ActorToCheck + PackageToCheck + LocationToCheck +")")

	bool returnVal
	
	if ActorToCheck.GetCurrentPackage() == PackageToCheck && ActorToCheck.IsInLocation(LocationToCheck) == False
		Log("CWScript", "CheckRikkeGalmarNotAtCampPackageLocation MOVING ACTOR and Returning TRUE because is in package but not in location" )
		ActorToCheck.MoveTo(MarkerToMoveTo)
		returnVal = True
	
	Else
		Log("CWScript", "CheckRikkeGalmarNotAtCampPackageLocation Returning FALSE because is either not in package, or in package and in location.")
		returnVal = False
	
	EndIf

	return returnVal
	
EndFunction

Function MoveRikkeGalmarToCampIfNeeded(bool CheckIfUnloaded = False)
{Moves them to the proper camp if not already there and, if not in the same location as the player.}
;When called by Rikke/Galmar's OnUnload block, CheckIfUnloaded == false, when called by their OnPackageChange block it is True

	Log("CWScript", "MoveRikkeGalmarToCampIfNeeded()")
	
	if WarIsActive == 1 && GetStageDone(4)

		if PlayerAllegiance == iImperials
			Log("CWScript", "MoveRikkeGalmarToCampIfNeeded() player is Imperial, checking Rikke")

			Actor RikkeActor = Rikke.GetActorReference()
			Package CurrentPackage =	RikkeActor.GetCurrentPackage()
			
			if CheckIfUnloaded
				If RikkeActor.Is3DLoaded()
					Log("CWScript", "MoveRikkeGalmarToCampIfNeeded() CheckIfUnloaded == true, and Rikke has 3D so skip this.")
					return
				EndIf
			EndIf
			
			if CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(RikkeActor, CWRikkeAtCampPale, MilitaryCampPaleImperialLocation, CWFieldCOMapTableMarkerPaleCampImperial)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(RikkeActor, CWRikkeAtCampRift, MilitaryCampRiftImperialLocation, CWFieldCOMapTableMarkerRiftCampImperial)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(RikkeActor, CWRikkeAtCampWinterhold, MilitaryCampWinterholdImperialLocation, CWFieldCOMapTableMarkerWinterholdCampImperial)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(RikkeActor, CWRikkeAtCampHjaalmarch, MilitaryCampHjaalmarchImperialLocation, CWFieldCOMapTableMarkerHjaalmarchCampImperial)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(RikkeActor, CWRikkeAtCampFalkreath, MilitaryCampFalkreathImperialLocation, CWFieldCOMapTableMarkerFalkreathCampImperial)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(RikkeActor, CWRikkeAtCampReach, MilitaryCampReachImperialLocation, CWFieldCOMapTableMarkerReachCampImperial)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(RikkeActor, CWRikkeAtCampEastmarch, MilitaryCampEastmarchImperialLocation, CWFieldCOMapTableMarkerEastmarchCampImperial)
			EndIf
			
			
		elseif PlayerAllegiance == iSons
			Log("CWScript", "MoveRikkeGalmarToCampIfNeeded() player is Sons, checking Galmar")
		
			Actor GalmarActor = Galmar.GetActorReference()
			Package CurrentPackage =	GalmarActor.GetCurrentPackage()
		
			if CheckIfUnloaded
				If GalmarActor.Is3DLoaded()
					Log("CWScript", "MoveGalmarGalmarToCampIfNeeded() CheckIfUnloaded == true, and Galmar has 3D so skip this.")
					return
				EndIf
			EndIf
		
			Log("CWScript", "MoveGalmarGalmarToCampIfNeeded() calling EvaluatePackage() on Galmar")
			GalmarActor.EvaluatePackage()
		
			if CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(GalmarActor, CWGalmarAtCampFalkreath, MilitaryCampFalkreathSonsLocation, CWFieldCOMapTableMarkerFalkreathCampSons)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(GalmarActor, CWGalmarAtCampReach, MilitaryCampReachSonsLocation, CWFieldCOMapTableMarkerReachCampSons)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(GalmarActor, CWGalmarAtCampHjaalmarch, MilitaryCampHjaalmarchSonsLocation, CWFieldCOMapTableMarkerHjaalmarchCampSons)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(GalmarActor, CWGalmarAtCampPale, MilitaryCampPaleSonsLocation, CWFieldCOMapTableMarkerPaleCampSons)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(GalmarActor, CWGalmarAtCampWinterhold, MilitaryCampWinterholdSonsLocation, CWFieldCOMapTableMarkerWinterholdCampSons)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(GalmarActor, CWGalmarAtCampRift, MilitaryCampRiftSonsLocation, CWFieldCOMapTableMarkerRiftCampSons)
			elseif CheckRikkeGalmarNotAtCampPackageLocationAndMoveIfNeeded(GalmarActor, CWGalmarAtCampHaafingar, MilitaryCampHaafingarSonsLocation, CWFieldCOMapTableMarkerHaafingarCampSons)
			EndIf
				
		Else
			Log("CWScript", "MoveRikkeGalmarToCampIfNeeded() player is Neither Imperial nor Sons, not checking Rikke or Galmar")
		
		EndIf

	Else
	
		Log("CWScript", "MoveRikkeGalmarToCampIfNeeded() WarIsActive == false or GetStageDone(4) == false, not checking.")
		
	EndIf



EndFunction



GlobalVariable Function GetCWObjGlobal(int HoldNumber)
{Returns a string based on the HoldNumber. Corresponds with iWhiterun, iRift, etc. Not for use to display to player. Just for sending to debug traces where you have a number refering to a hold.}

	if HoldNumber == iHaafingar	;1
		return CWObjHaafingar
		
	elseif HoldNumber == iReach ;2
		return CWObjReach
		
	elseif HoldNumber == iHjaalmarch ;3
		return CWObjHjaalmarch
		
	elseif HoldNumber == iWhiterun ;4
		return CWObjWhiterun
		
	elseif HoldNumber == iFalkreath ;5
		return CWObjFalkreath
		
	elseif HoldNumber == iPale ;6
		return CWObjPale
		
	elseif HoldNumber == iWinterhold ;7
		return CWObjWinterhold
		
	elseif HoldNumber == iEastmarch ;8
		return CWObjEastmarch
		
	elseif HoldNumber == iRift ;9
		return CWObjRift
	EndIf
   
EndFunction


int Function GetActorAllgeiance(Actor ActorToCheck)
{Returns an integer correlating to the Civil War faction the actor belongs 1 = in faction CWImperialFaction, 2 = in faction CWSonsFaction}

	if ActorToCheck.IsInFaction(CWImperialFaction) || ActorToCheck.IsInFaction(GovImperial) 
		return iImperials
		
	ElseIf ActorToCheck.IsInFaction(CWSonsFaction) || ActorToCheck.IsInFaction(GovSons) 
		return iSons
		
	Else
		log("CWScript", "GetActorAllgeiance() ActorToCheck(" + ActorToCheck + ") is neither in CWImperialFaction nor CWImperialFaction.", 1)
		return -1
	
	EndIf

EndFunction

bool function isImperial(Actor ActorToCheck)
	return GetActorAllgeiance(ActorToCheck) == iImperials

EndFunction

bool function isSons(Actor ActorToCheck)
	return GetActorAllgeiance(ActorToCheck) == iSons

EndFunction

bool function IsPlayerInMyFaction(Actor ActorToCheck)
{Returns true if the actor is in the same CW<Faction>Faction as the player}
	log("CWScript", "IsPlayerInMyFaction() ActorToCheck(" + ActorToCheck + ")")

	bool returnVal = GetActorAllgeiance(ActorToCheck) == GetActorAllgeiance(Game.GetPlayer())

	log("CWScript", "IsPlayerInMyFaction() returning: " + returnVal)
	
	return returnVal
	
EndFunction


Function SetPlayerAllegiance(int FactionToJoin, int MakePlayerInvolved = 0)
{Takes an int for which faction the player should join. 1 = Imperials, 2 = Sons. Swaps player in/out of factions, and sets the playerInvolved flag if the optional parameter is set to 1, and PlayerAllegiance properties.}

	;set quest properies
	playerInvolved = MakePlayerInvolved
	playerAllegiance = FactionToJoin
	CWPlayerAllegiance.value = FactionToJoin
	
	if FactionToJoin == iImperials
		;swap factions
		Game.GetPlayer().AddToFaction(getFaction(iImperials))
		Game.GetPlayer().RemoveFromFaction(getFaction(iSons))

		;swap FactionLeader alias
		AliasFactionLeader.ForceRefTo(AliasTullius.GetReference())
		
	elseif FactionToJoin == iSons
		Game.GetPlayer().AddToFaction(getFaction(iSons))
		Game.GetPlayer().RemoveFromFaction(getFaction(iImperials))

		;swap FactionLeader alias
		AliasFactionLeader.ForceRefTo(AliasUlfric.GetReference())
	Else
		log("CWScript", "SetPlayerAllegiance() encountered an unknown FactionToJoin. Expect 1 or 2, got " + FactionToJoin)
	EndIf
	
	log("CWScript", "SetPlayerAllegiance() setting players allegiance to " + FactionToJoin + "(" + FactionName(FactionToJoin) + ")")
	
EndFunction


function pacifyAliasForSurrender(ReferenceAlias RefAliasToPacify)
	
	;MAKE SURE YOU PUT THE PLAYER in CWSurrenderTemporaryAllies BEFORE YOU CALL THIS
	
	log("CWScript", "pacifyAliasForSurrender(" + RefAliasToPacify + ")")
	
	Actor ActorRef = RefAliasToPacify.GetActorReference()
	ClearActorsEnemyFlagOnCrimeFactions(ActorRef)
	ActorRef.AddToFaction(CWSurrenderTemporaryAllies)
	ActorRef.StopCombatAlarm()
	Game.GetPlayer().StopCombatAlarm()
	ActorRef.StopCombat()
	
EndFunction


function ClearAliasEnemyFlagOnCrimeFactions(ReferenceAlias AliasWhoseCrimeFactionShouldClearPlayerEnemyFlag)
	log("CWScript", "ClearActorsEnemyFlagOnCrimeFactions(" + AliasWhoseCrimeFactionShouldClearPlayerEnemyFlag + ") will call ClearActorsEnemyFlagOnCrimeFactions()")
	
	ClearActorsEnemyFlagOnCrimeFactions(AliasWhoseCrimeFactionShouldClearPlayerEnemyFlag.GetActorReference())

EndFunction


function ClearActorsEnemyFlagOnCrimeFactions(Actor ActorWhoseCrimeFactionShouldClearPlayerEnemyFlag)
	Faction myCrimeFaction = ActorWhoseCrimeFactionShouldClearPlayerEnemyFlag.GetCrimeFaction()

	log("CWScript", "ClearActorsEnemyFlagOnCrimeFactions(" + ActorWhoseCrimeFactionShouldClearPlayerEnemyFlag + ") clearing player enemy flag on faction: " + myCrimeFaction )

	if myCrimeFaction
		myCrimeFaction.SetPlayerEnemy(false)
	EndIf

EndFunction





Function PlayerTookOath(int iFaction)
	log("CWScript", "PlayerTookOath(" + iFaction + ")")

	if iFaction == iImperials
		CW00A.setObjectiveCompleted(1)
		
		CW00B.setObjectiveFailed(2)
		CW01B.setStage(999)
		
	
	elseif iFaction == iSons
		CW00B.setObjectiveCompleted(2)
		
		CW00A.setObjectiveFailed(1)
		CW01A.setStage(999)
	
	EndIf


	;turn off introductory quests:
	CW00A.stop()
	CW00B.stop()
	
	
EndFunction


Location Function GetMyCurrentHoldLocation(ObjectReference RefToGetCurrentHoldFor)
{Returns a location corresponding to the location of the hold the actor is currently in}
	
	Location returnLocation

	if RefToGetCurrentHoldFor.IsInLocation(HaafingarHoldLocation)
		returnLocation = HaafingarHoldLocation
	
	Elseif RefToGetCurrentHoldFor.IsInLocation(ReachHoldLocation)
		returnLocation = ReachHoldLocation
	
	Elseif RefToGetCurrentHoldFor.IsInLocation(HjaalmarchHoldLocation)
		returnLocation = HjaalmarchHoldLocation
	
	Elseif RefToGetCurrentHoldFor.IsInLocation(WhiterunHoldLocation)
		returnLocation = WhiterunHoldLocation
		
	Elseif RefToGetCurrentHoldFor.IsInLocation(FalkreathHoldLocation)
		returnLocation = FalkreathHoldLocation

	Elseif RefToGetCurrentHoldFor.IsInLocation(PaleHoldLocation)
		returnLocation = PaleHoldLocation

	Elseif RefToGetCurrentHoldFor.IsInLocation(WinterholdHoldLocation)
		returnLocation = WinterholdHoldLocation

	Elseif RefToGetCurrentHoldFor.IsInLocation(EastmarchHoldLocation)
		returnLocation = EastmarchHoldLocation

	Elseif RefToGetCurrentHoldFor.IsInLocation(RiftHoldLocation)
		returnLocation = RiftHoldLocation		

	Else
	
		log("CWScript", " WARNING: GetMyCurrentHoldLocation(" + RefToGetCurrentHoldFor + ") could NOT find the actor is in any hold location.", 2, true, true)	
		
	EndIf

	log("CWScript", "GetMyCurrentHoldLocation(" + RefToGetCurrentHoldFor + ") RETURNING: " + returnLocation)
	
	return returnLocation
	
	
EndFunction

Location Function GetMyEditorLocationHoldLocation(ObjectReference RefToGetEditorLocHoldFor)
{Returns a location corresponding to the location of the hold the actor's editor location currently in}

	Location EditorLocation = RefToGetEditorLocHoldFor.GetEditorLocation()
	Location returnLocation

	If HaafingarHoldLocation.IsChild(EditorLocation)
		returnLocation = HaafingarHoldLocation
	
	ElseIf ReachHoldLocation.IsChild(EditorLocation)
		returnLocation = ReachHoldLocation
	
	ElseIf HjaalmarchHoldLocation.IsChild(EditorLocation)
		returnLocation = HjaalmarchHoldLocation
	
	ElseIf WhiterunHoldLocation.IsChild(EditorLocation)
		returnLocation = WhiterunHoldLocation
		
	ElseIf FalkreathHoldLocation.IsChild(EditorLocation)
		returnLocation = FalkreathHoldLocation

	ElseIf PaleHoldLocation.IsChild(EditorLocation)
		returnLocation = PaleHoldLocation

	ElseIf WinterholdHoldLocation.IsChild(EditorLocation)
		returnLocation = WinterholdHoldLocation

	ElseIf EastmarchHoldLocation.IsChild(EditorLocation)
		returnLocation = EastmarchHoldLocation

	ElseIf RiftHoldLocation.IsChild(EditorLocation)
		returnLocation = RiftHoldLocation		

	Else
	
		log("CWScript", " WARNING: GetMyEditorLocationHoldLocation(" + RefToGetEditorLocHoldFor + ") could NOT find the actor's editor location is in any hold location.", 2, true, true)	
		
	EndIf

	log("CWScript", "GetMyEditorLocationHoldLocation(" + RefToGetEditorLocHoldFor + ") RETURNING: " + returnLocation)
	
	return returnLocation
	
	
EndFunction


Faction function GetCrimeFactionForActorFaction(Actor ActorToCheck)

	log("CWScript", "GetCrimeFactionForActorFaction(" + ActorToCheck + ") will GetActorAllgeiance() and the return crime faction based on what was returned")

	int myAllegiance = GetActorAllgeiance(ActorToCheck)

	Faction returnFaction
	
	if myAllegiance == iImperials
		returnFaction = CrimeFactionImperial
	
	elseif myAllegiance == iSons
		returnFaction = CrimeFactionSons
	
	Else
		log("CWScript", " WARNING: GetCrimeFactionForActorFaction(" + ActorToCheck + ") is neither Imperial nor Sons, returning NONE)" , 2, true, true)
		
	EndIf
	
	log("CWScript", "GetCrimeFactionForActorFaction(" + ActorToCheck + ") returning:" + returnFaction)
	
	return returnFaction

EndFunction

Faction Function GetCrimeFactionForHold(Location HoldLocation)
	{Returns the normal crime faction for the hold}

	log("CWScript", "GetCrimeFactionForHold(" + HoldLocation + ")")
		
	Faction ReturnFaction
	
	If HoldLocation == HaafingarHoldLocation
		returnFaction = CrimeFactionHaafingar
	ElseIf HoldLocation == ReachHoldLocation
		returnFaction = CrimeFactionReach
	ElseIf HoldLocation == HjaalmarchHoldLocation
		returnFaction = CrimeFactionHjaalmarch
	ElseIf HoldLocation == WhiterunHoldLocation
		returnFaction = CrimeFactionWhiterun
	ElseIf HoldLocation == FalkreathHoldLocation
		returnFaction = CrimeFactionFalkreath
	ElseIf HoldLocation == PaleHoldLocation
		returnFaction = CrimeFactionPale
	ElseIf HoldLocation == WinterholdHoldLocation
		returnFaction = CrimeFactionWinterhold
	ElseIf HoldLocation == EastmarchHoldLocation
		returnFaction = CrimeFactionEastmarch
	ElseIf HoldLocation == RiftHoldLocation		
		returnFaction = CrimeFactionRift
		
	Else
	
		log("CWScript", " WARNING: GetCrimeFactionForHold(" + HoldLocation + ") found an unexpected location that isn't a known hold.", 2, true, true)	
		
	EndIf

	log("CWScript", "GetCrimeFactionForHold(" + HoldLocation + ") RETURNING: " + ReturnFaction)
	
	return ReturnFaction

EndFunction

function ClearHoldCrimeGold(Location HoldLocation)

	log("CWScript", "ClearHoldCrimeGold(" + HoldLocation + ") clearing crime gold.")

	faction crimeFaction = GetCrimeFactionForHold(HoldLocation)
	
	crimeFaction.SetCrimeGold(0)
	crimeFaction.SetCrimeGoldViolent (0)
	

EndFunction

function setCrimeFactionOnActorForEditorLocationsHold(Actor ActorToSetCrimeFaction)
{Finds the hold of the actor's editor location, then adds and sets the appropriate crime faction}

	log("CWScript", "setCrimeFactionOnActorForEditorLocationsHold(" + ActorToSetCrimeFaction + ")")
	
	Location myHold = GetMyEditorLocationHoldLocation(ActorToSetCrimeFaction)
	Faction myCrimeFaction = GetCrimeFactionForHold(myHold)
	
	log("CWScript", "setCrimeFactionOnActorForEditorLocationsHold(" + ActorToSetCrimeFaction + ") will set crime faction to be " + myCrimeFaction)
	
	ActorToSetCrimeFaction.SetCrimeFaction(myCrimeFaction)
	
EndFunction

function DetermineAndSetCrimeFactionForSoldierActor(Actor ActorRef)

	log("CWScript", "DetermineAndSetCrimeFactionForSoldierActor(" + ActorRef + ") will determine my hold.")
	
	Location myHold = GetMyEditorLocationHoldLocation(ActorRef)

	log("CWScript", "DetermineAndSetCrimeFactionForSoldierActor(" + ActorRef + ") myHold = " + myHold + " now will determine if I am a defender or attacker and get my crime faction.")
	
	faction myCrimeFaction
	
	;DON'T SET CRIME FACTION FOR FORT SOLDIERS ANY MORE
	location ActorLocation = ActorRef.GetEditorLocation()
	if ActorLocation.HasKeyword(CWFort)
		log("CWScript", "DetermineAndSetCrimeFactionForSoldierActor(" + ActorRef + ") location is a CWFort, NOT CHANGING CRIME FACTION. Location: " + ActorLocation)
		RETURN
	endif
	
	
	if IsActorDefender(ActorRef, myHold)
		myCrimeFaction = GetCrimeFactionForHold(myHold)
	
	ElseIf IsActorAttacker(ActorRef, myHold)
		myCrimeFaction = GetCrimeFactionForActorFaction(ActorRef)
	
	Else
		log("CWScript", " WARNING: ActorRef is neither attacker nor defender!!! DetermineAndSetCrimeFactionForSoldierActor(" + ActorRef + ")", 2, true, true)
	
	EndIf

	log("CWScript", "DetermineAndSetCrimeFactionForSoldierActor(" + ActorRef + ") will set crime faction to: " + myCrimeFaction)
	
	ActorRef.SetCrimeFaction(myCrimeFaction)
		
	log("CWScript", "DetermineAndSetCrimeFactionForSoldierActor(" + ActorRef + ") double checking GetCrimeFaction():" + ActorRef.GetCrimeFaction())
	
EndFunction

Location Function GetMyParentHoldLocation(Location LocationToGetParentHoldFor)
{Returns a location corresponding to the location of the hold the actor is currently in}

	Location returnLocation

	If HaafingarHoldLocation.IsChild(LocationToGetParentHoldFor)
		returnLocation = HaafingarHoldLocation
	
	ElseIf ReachHoldLocation.IsChild(LocationToGetParentHoldFor)
		returnLocation = ReachHoldLocation
	
	ElseIf HjaalmarchHoldLocation.IsChild(LocationToGetParentHoldFor)
		returnLocation = HjaalmarchHoldLocation
	
	ElseIf WhiterunHoldLocation.IsChild(LocationToGetParentHoldFor)
		returnLocation = WhiterunHoldLocation
		
	ElseIf FalkreathHoldLocation.IsChild(LocationToGetParentHoldFor)
		returnLocation = FalkreathHoldLocation

	ElseIf PaleHoldLocation.IsChild(LocationToGetParentHoldFor)
		returnLocation = PaleHoldLocation

	ElseIf WinterholdHoldLocation.IsChild(LocationToGetParentHoldFor)
		returnLocation = WinterholdHoldLocation

	ElseIf EastmarchHoldLocation.IsChild(LocationToGetParentHoldFor)
		returnLocation = EastmarchHoldLocation

	ElseIf RiftHoldLocation.IsChild(LocationToGetParentHoldFor)
		returnLocation = RiftHoldLocation		

	Else
	
		log("CWScript", " WARNING: GetMyParentHoldLocation(" + LocationToGetParentHoldFor + ") could NOT find the actor's editor location is in any hold location.", 2, true, true)	
		
	EndIf

	log("CWScript", "GetMyParentHoldLocation(" + LocationToGetParentHoldFor + ") RETURNING: " + returnLocation)
	
	return returnLocation
		
EndFunction



Location Function GetCapitalLocationForHold(Location HoldLocation)
{Returns a location corresponding to the capital location of the hold location}
	
	Location returnLocation

	if HoldLocation == HaafingarHoldLocation
		returnLocation = SolitudeLocation
	
	elseif HoldLocation == ReachHoldLocation
		returnLocation = MarkarthLocation
	
	elseif HoldLocation == HjaalmarchHoldLocation
		returnLocation = MorthalLocation
	
	elseif HoldLocation == WhiterunHoldLocation
		returnLocation = WhiterunLocation
		
	elseif HoldLocation == FalkreathHoldLocation
		returnLocation = FalkreathLocation

	elseif HoldLocation == PaleHoldLocation
		returnLocation = DawnstarLocation

	elseif HoldLocation == WinterholdHoldLocation
		returnLocation = WinterholdLocation

	elseif HoldLocation == EastmarchHoldLocation
		returnLocation = WindhelmLocation

	elseif HoldLocation == RiftHoldLocation
		returnLocation = RiftenLocation		

	EndIf

	log("CWScript", "GetCapitalLocationForHold(" + HoldLocation + ") RETURNING: " + returnLocation)
	
	return returnLocation
	
EndFunction

location function GetCampLocationForHold(Location Hold, int GetCampForThisFaction)

	location ReturnVal

	if Hold == HaafingarHoldLocation
		if GetCampForThisFaction == iImperials
	;		returnVal = MilitaryCampHaafingarImperialLocation
		Else
			returnVal = MilitaryCampHaafingarSonsLocation
		EndIf

	elseif Hold == ReachHoldLocation
		if GetCampForThisFaction == iImperials
			returnVal = MilitaryCampReachImperialLocation
		Else
			returnVal = MilitaryCampReachSonsLocation
		endif

	elseif Hold == HjaalmarchHoldLocation
		if GetCampForThisFaction == iImperials
			returnVal = MilitaryCampHjaalmarchImperialLocation
		Else
			returnVal = MilitaryCampHjaalmarchSonsLocation
		endif
		
	elseif Hold == WhiterunHoldLocation
		if GetCampForThisFaction == iImperials
			returnVal = MilitaryCampWhiterunImperialLocation
		Else
			returnVal = MilitaryCampWhiterunSonsLocation
		endif
		
	elseif Hold == FalkreathHoldLocation
		if GetCampForThisFaction == iImperials
			returnVal = MilitaryCampFalkreathImperialLocation
		Else
			returnVal = MilitaryCampFalkreathSonsLocation
		endif

	elseif Hold == PaleHoldLocation
		if GetCampForThisFaction == iImperials
			returnVal = MilitaryCampPaleImperialLocation
		Else
			returnVal = MilitaryCampPaleSonsLocation
		endif

	elseif Hold == WinterholdHoldLocation
		if GetCampForThisFaction == iImperials
			returnVal = MilitaryCampWinterholdImperialLocation
		Else
			returnVal = MilitaryCampWinterholdSonsLocation
		endif

	elseif Hold == EastmarchHoldLocation
		if GetCampForThisFaction == iImperials
			returnVal = MilitaryCampEastmarchImperialLocation
		Else
	;		returnVal = MilitaryCampEastmarchSonsLocation
		endif
		
	elseif Hold == RiftHoldLocation
		if GetCampForThisFaction == iImperials
			returnVal = MilitaryCampRiftImperialLocation
		Else
			returnVal = MilitaryCampRiftSonsLocation
		endif

	EndIf	

	return returnVal

EndFunction


ObjectReference function GetReferenceHQFieldCOForHold(Location Hold, int FactionToCheck)
	
	log("CWScript", "GetReferenceHQFieldCOForHold(" + Hold + ") calling GetAliasHQFieldCOForHold()")

	ObjectReference returnVar = GetAliasHQFieldCOForHold(Hold, FactionToCheck).GetReference()

	log("CWScript", "GetReferenceHQFieldCOForHold(" + Hold + ") calling GetAliasHQFieldCOForHold() RETURN:" + returnVar)
		
	return returnVar

EndFunction

ObjectReference function GetReferenceCampFieldCOForHold(Location Hold, int FactionToCheck)
	
	log("CWScript", "GetReferenceCampFieldCOForHold(" + Hold + ") calling GetAliasCampFieldCOForHold()")

	ObjectReference returnVar = GetAliasCampFieldCOForHold(Hold, FactionToCheck).GetReference()

	log("CWScript", "GetReferenceCampFieldCOForHold(" + Hold + ") calling GetAliasCampFieldCOForHold() RETURN:" + returnVar)
		
	return returnVar

EndFunction

referenceAlias function GetAliasHQFieldCOForHold(Location Hold, int FactionToCheck)

	log("CWScript", "GetAliasHQFieldCOForHold(" + Hold + ")")

	ReferenceAlias returnVal

	if FactionToCheck == iImperials
	
	if Hold == EastmarchHoldLocation
		returnVal = Alias_FieldCOImperialEastmarchHQ
	elseif Hold == FalkreathHoldLocation
		returnVal = Alias_FieldCOImperialFalkreathHQ
	elseif Hold == HaafingarHoldLocation
		returnVal = Alias_FieldCOImperialHaafingarHQ
	elseif Hold == HjaalmarchHoldLocation
		returnVal = Alias_FieldCOImperialHjaalmarchHQ
	elseif Hold == PaleHoldLocation
		returnVal = Alias_FieldCOImperialPaleHQ
	elseif Hold == ReachHoldLocation
		returnVal = Alias_FieldCOImperialReachHQ
	elseif Hold == RiftHoldLocation
		returnVal = Alias_FieldCOImperialRiftHQ
	elseif Hold == WhiterunHoldLocation
		returnVal = Alias_FieldCOImperialWhiterunHQ
	elseif Hold == WinterholdHoldLocation
		returnVal = Alias_FieldCOImperialWinterholdHQ
	
	EndIf
	
	elseif FactionToCheck == iSons
	
		if Hold == EastmarchHoldLocation
			returnVal = Alias_FieldCOSonsEastmarchHQ
		elseif Hold == FalkreathHoldLocation
			returnVal = Alias_FieldCOSonsFalkreathHQ
		elseif Hold == HaafingarHoldLocation
			returnVal = Alias_FieldCOSonsHaafingarHQ
		elseif Hold == HjaalmarchHoldLocation
			returnVal = Alias_FieldCOSonsHjaalmarchHQ
		elseif Hold == PaleHoldLocation
			returnVal = Alias_FieldCOSonsPaleHQ
		elseif Hold == ReachHoldLocation
			returnVal = Alias_FieldCOSonsReachHQ
		elseif Hold == RiftHoldLocation
			returnVal = Alias_FieldCOSonsRiftHQ
		elseif Hold == WhiterunHoldLocation
			returnVal = Alias_FieldCOSonsWhiterunHQ
		elseif Hold == WinterholdHoldLocation
			returnVal = Alias_FieldCOSonsWinterholdHQ

		endif
	
	Else
		log("CWScript", " WARNING: GetAliasHQFieldCOForHold(" + Hold + ") expect 1 or 2 for FactionToCheck, intead got: " + FactionToCheck, 2, true, true)
	
	endif

	log("CWScript", "GetAliasHQFieldCOForHold(" + Hold + ") RETURNING: " + returnVal)
	
	return returnVal

EndFunction

ReferenceAlias Function GetAliasCampFieldCOForHold(Location Hold, int FactionToCheck)

	log("CWScript", "GetAliasCampFieldCOForHold(" + Hold + ")")

	ReferenceAlias returnVal

	if FactionToCheck == iImperials
	
		if Hold == EastmarchHoldLocation
			returnVal = Alias_FieldCOImperialEastmarchCamp
		elseif Hold == FalkreathHoldLocation
			returnVal = Alias_FieldCOImperialFalkreathCamp
		elseif Hold == HaafingarHoldLocation
			returnVal = Alias_FieldCOImperialHaafingarCamp
		elseif Hold == HjaalmarchHoldLocation
			returnVal = Alias_FieldCOImperialHjaalmarchCamp
		elseif Hold == PaleHoldLocation
			returnVal = Alias_FieldCOImperialPaleCamp
		elseif Hold == ReachHoldLocation
			returnVal = Alias_FieldCOImperialReachCamp
		elseif Hold == RiftHoldLocation
			returnVal = Alias_FieldCOImperialRiftCamp
		elseif Hold == WhiterunHoldLocation
			returnVal = Alias_FieldCOImperialWhiterunCamp
		elseif Hold == WinterholdHoldLocation
			returnVal = Alias_FieldCOImperialWinterholdCamp

		endif
	
	Elseif FactionToCheck == iSons
		
		if Hold == EastmarchHoldLocation
			returnVal = Alias_FieldCOSonsEastmarchCamp
		elseif Hold == FalkreathHoldLocation
			returnVal = Alias_FieldCOSonsFalkreathCamp
		elseif Hold == HaafingarHoldLocation
			returnVal = Alias_FieldCOSonsHaafingarCamp
		elseif Hold == HjaalmarchHoldLocation
			returnVal = Alias_FieldCOSonsHjaalmarchCamp
		elseif Hold == PaleHoldLocation
			returnVal = Alias_FieldCOSonsPaleCamp
		elseif Hold == ReachHoldLocation
			returnVal = Alias_FieldCOSonsReachCamp
		elseif Hold == RiftHoldLocation
			returnVal = Alias_FieldCOSonsRiftCamp
		elseif Hold == WhiterunHoldLocation
			returnVal = Alias_FieldCOSonsWhiterunCamp
		elseif Hold == WinterholdHoldLocation
			returnVal = Alias_FieldCOSonsWinterholdCamp
			
		endif
		
	Else
		log("CWScript", " WARNING: GetAliasCampFieldCOForHold(" + Hold + ") expect 1 or 2 for FactionToCheck, intead got: " + FactionToCheck, 2, true, true)
	
	EndIf

	log("CWScript", "GetAliasCampFieldCOForHold(" + Hold + ") RETURNING: " + returnVal)
	
	return returnVal

EndFunction

int Function GetHoldID(Location HoldToCheck)
{Returns an int specifying the ID of the specified hold; -1 = FAIL}
	int holdID = -1
	
	if HoldToCheck == HaafingarHoldLocation
		holdID = iHaafingar ;1
	elseif HoldToCheck == ReachHoldLocation
		holdID = iReach ;2
	elseif HoldToCheck == HjaalmarchHoldLocation
		holdID = iHjaalmarch ;3
	elseif HoldToCheck == WhiterunHoldLocation
		holdID = iWhiterun ;4
	elseif HoldToCheck == FalkreathHoldLocation
		holdID = iFalkreath ;5
	elseif HoldToCheck == PaleHoldLocation
		holdID = iPale ;6
	elseif HoldToCheck == WinterholdHoldLocation
		holdID = iWinterhold ;7
	elseif HoldToCheck == EastmarchHoldLocation
		holdID = iEastmarch ;8
	elseif HoldToCheck == RiftHoldLocation
		holdID = iRift ;9
	else
		log("CWScript", "GetHoldID(" + HoldToCheck + ") location unrecognized. Expected one of the nine holds, got something else.", 2)
		holdID = -1
	
	EndIf
	
	log("CWScript", "GetHoldID() HoldToCheck[" + HoldToCheck + "], ID = " + holdID)
	
	return holdID
EndFunction



int Function GetHoldOwner(int HoldToCheck)
{Returns an int specifying current owner of HoldToCheck. 1 = Imperials, 2 = Sons, -1 = FAIL}
	int owner	;1 = Imperials, 2 = Sons
	if HoldToCheck == iHaafingar ;1
		owner = ownerHaafingar
	elseif HoldToCheck == 	iReach ; 2
		owner = ownerReach
	elseif HoldToCheck == 	iHjaalmarch ;3
		owner = ownerHjaalmarch 
	elseif HoldToCheck == 	iWhiterun ;4
		owner = ownerWhiterun
	elseif HoldToCheck == 	iFalkreath ;5
		owner = ownerFalkreath
	elseif HoldToCheck == 	iPale ;6
		owner = ownerPale
	elseif HoldToCheck == 	iWinterhold ;7
		owner = ownerWinterhold
	elseif HoldToCheck == 	iEastmarch ;8
		owner = ownerEastmarch	
	elseif HoldToCheck == 	iRift ;9
		owner = ownerRift 
	else
		log("CWScript", "GetHoldOwner(" + HoldToCheck + ") parametered unrecognized. Expected an int 1-9 as HoldToCheck, got something else.", 2)
		owner = -1
	EndIf
	
	log("CWScript", "GetHoldOwner() HoldToCheck[" + HoldToCheck + "], owner = " + owner + "[" + FactionName(owner) + "]")
	
	return owner
EndFunction

bool function IsPlayerAttacking(Location LocationToCheck)
	bool returnVal
	
	if LocationToCheck.GetKeywordData(CWOwner) == PlayerAllegiance
		returnVal = False
	
	Else
		returnVal = True
	
	EndIf

	log("CWScript", "IsPlayerAttacking(" + LocationToCheck + ") returning: " + returnVal)

	return returnVal

EndFunction


function DiscoverMilitaryCampMarkers(int FactionID)

	if FactionID == iImperials

		;MilitaryCampEastmarchImperialMapMarker NOT ADDING THIS HERE BECAUSE THIS FUNCTION HAPPENS BEFORE YOU ARE ALLOWED TO GET MISSIONS IN THE FINAL HOLD
		MilitaryCampFalkreathImperialMapMarker.addToMap()
		MilitaryCampHjaalmarchImperialMapMarker.addToMap()
		MilitaryCampPaleImperialMapMarker.addToMap()
		MilitaryCampReachImperialMapMarker.addToMap()
		MilitaryCampRiftImperialMapMarker.addToMap()
		MilitaryCampWhiterunImperialMapMarker.addToMap()
		MilitaryCampWinterholdImperialMapMarker.addToMap()

	elseif FactionID == iSons
		MilitaryCampFalkreathSonsMapMarker.addToMap()
		;MilitaryCampHaafingarSonsMapMarker NOT ADDING THIS HERE BECAUSE THIS FUNCTION HAPPENS BEFORE YOU ARE ALLOWED TO GET MISSIONS IN THE FINAL HOLD
		MilitaryCampHjaalmarchSonsMapMarker.addToMap()
		MilitaryCampPaleSonsMapMarker.addToMap()
		MilitaryCampReachSonsMapMarker.addToMap()
		MilitaryCampRiftSonsMapMarker.addToMap()
		MilitaryCampWhiterunSonsMapMarker.addToMap()
		MilitaryCampWinterholdSonsMapMarker.addToMap()
		
	Else
			log("CWScript", " WARNING: DiscoverMilitaryCampMarkers(" + FactionID + ") FactionID parameter unrecognized. Expect 1 or 2. Got:" + FactionID, 2, True, True)

	EndIf


EndFunction


Bool Function FactionOwnsAll(int FactionToTest)
{Returns true if FactionToTest represents a faction that owns all the contestable holds.}
	
	;Note the use of \ to break the single if statement across multiple lines for ease of reading
	if 	GetHoldOwner(iReach) == FactionToTest && \
		GetHoldOwner(iHjaalmarch) == FactionToTest && \
		GetHoldOwner(iWhiterun) == FactionToTest && \
		GetHoldOwner(iFalkreath) == FactionToTest && \
		GetHoldOwner(iPale) == FactionToTest && \
		GetHoldOwner(iWinterhold) == FactionToTest && \
		GetHoldOwner(iRift) == FactionToTest
		return True
	Else
		return False
	EndIf

EndFunction

function RegisterEventHappening(Location LocationWhereEventIsHappening)
{set CWEventHappening keyword data to 1, this can be checked in conditions if designers want things to happen or not happen when civil war events are happening in their location}

	if LocationWhereEventIsHappening.HasKeyword(CWEventHappening)
		log("CWScript", " RegisterEventHappening(" + LocationWhereEventIsHappening + ") setting CWEventHappening keyword data to 1.")
		LocationWhereEventIsHappening.SetKeywordData(CWEventHappening, 1)
	Else
		log("CWScript", " WARNING: RegisterEventHappening(" + LocationWhereEventIsHappening + ") does not have CWEventHappening keyword", 2, True, True)
	EndIf

EndFunction

function UnregisterEventHappening(Location LocationWhereEventIsHappening)
{set CWEventHappening keyword data to 1, this can be checked in conditions if designers want things to happen or not happen when civil war events are happening in their location}

	if LocationWhereEventIsHappening.HasKeyword(CWEventHappening)
		log("CWScript", " RegisterEventHappening(" + LocationWhereEventIsHappening + ") setting CWEventHappening keyword data to 0.")
		LocationWhereEventIsHappening.SetKeywordData(CWEventHappening, 0)
	Else
		log("CWScript", " WARNING: RegisterEventHappening(" + LocationWhereEventIsHappening + ") does not have CWEventHappening keyword", 2, True, True)
	EndIf

EndFunction

	
function stopSiegeQuests()
	log("CWScript", "CW Script: stopSiegeQuests() NEED TO SHUT DOWN AND CLEAN UP SIEGE QUESTS", 1)
	debug.messageBox("CW Script: stopSiegeQuests() NEED TO SHUT DOWN AND CLEAN UP SIEGE QUESTS")
EndFunction

function StopCivilWar()	;called by CW STAGE 255
{Used to cut a campaign short so the Civil War can halt for the peace treaty signing scenes}
	WarIsActive = -1
	PlayerInvolved = 1

	;STOP ANY CIVIL WAR MISSION QUESTS / FORT BATTLES
	if CWFortSiegeFort.IsRunning()
		CWFortSiegeFort.setStage(9000)

		Rikke.GetActorReference().removeFromFaction(CWFieldCOActiveMissionFaction)
		Galmar.GetActorReference().removeFromFaction(CWFieldCOActiveMissionFaction)		
		Rikke.GetActorReference().removeFromFaction(CWFieldCOSuccessfulMissionFaction)
		Galmar.GetActorReference().removeFromFaction(CWFieldCOSuccessfulMissionFaction)
		
	EndIf
	
	if CWMission03.IsRunning()
		CWMission03.setStage(200)
		
		Rikke.GetActorReference().removeFromFaction(CWFieldCOActiveMissionFaction)
		Galmar.GetActorReference().removeFromFaction(CWFieldCOActiveMissionFaction)		
		Rikke.GetActorReference().removeFromFaction(CWFieldCOSuccessfulMissionFaction)
		Galmar.GetActorReference().removeFromFaction(CWFieldCOSuccessfulMissionFaction)		
	EndIf
	
	if CWMission04.IsRunning()
		CWMission04.setStage(200)
		
		Rikke.GetActorReference().removeFromFaction(CWFieldCOActiveMissionFaction)
		Galmar.GetActorReference().removeFromFaction(CWFieldCOActiveMissionFaction)		
		Rikke.GetActorReference().removeFromFaction(CWFieldCOSuccessfulMissionFaction)
		Galmar.GetActorReference().removeFromFaction(CWFieldCOSuccessfulMissionFaction)	
	EndIf	

	if CWMission07.IsRunning()
		CWMission07.setStage(200)
		
		Rikke.GetActorReference().removeFromFaction(CWFieldCOActiveMissionFaction)
		Galmar.GetActorReference().removeFromFaction(CWFieldCOActiveMissionFaction)		
		Rikke.GetActorReference().removeFromFaction(CWFieldCOSuccessfulMissionFaction)
		Galmar.GetActorReference().removeFromFaction(CWFieldCOSuccessfulMissionFaction)
	EndIf	
	
;		;If player's side is attacking "FAIL" the CWCampaign, if player's side is defending "COMPLETE" the CWCampaign
;		if playerAllegiance == Attacker
;			CWCampaignObj.setStage(300)
;		Else
;			CWCampaignObj.setStage(200)
;		EndIf
;		
;		CWCampaign.stop()
;			
;		(CWCampaign as CWCampaignScript).ResetCampaign()
;		(CWCampaign as CWCampaignPollForMissionAcceptScript).StopPolling()
;		setHoldOwner(ContestedHold, ownerContestedHold)
		
;		CWCampaignTruce.show()
		
EndFunction

function restartCivilWar() ;called in stage 256 of CW quest
	SetStage(playerAllegiance) ;sets stage 1 or 2, which calls setplayeAllegience and sets PlayerInvolved to be 1

	if getStageDone(4) ;makes sure the player has completed a campaign before setting warIsActive (in case you haven't finished the Whiterun battle yet)
		WarIsActive = 1
	
	Else
		WarIsActive = 0  ;in case it was set to -1 due to peace treaty
		
	endif
	
;	restartCivilWarCompleteObjectiveIfNeeded(102, HaafingarHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(201, ReachHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(202, ReachHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(301, HjaalmarchHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(302, HjaalmarchHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(401, WhiterunHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(402, WhiterunHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(501, FalkreathHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(502, FalkreathHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(601, PaleHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(602, PaleHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(701, WinterholdHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(702, WinterholdHoldLocation)
;	restartCivilWarCompleteObjectiveIfNeeded(801, Eastmarch HoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(901, RiftHoldLocation)
	restartCivilWarCompleteObjectiveIfNeeded(902, RiftHoldLocation)

	
EndFunction

function restartCivilWarCompleteObjectiveIfNeeded(int objectiveToCheck, Location HoldLocationToCheck)
	
	bool ObjDisplayed = CWObj.IsObjectiveDisplayed(objectiveToCheck) 
	bool ObjCompleted =  CWObj.IsObjectiveCompleted(objectiveToCheck)
	bool HoldOwnedByPlayersFaction = HoldLocationToCheck.GetKeywordData(CWOwner) == playerAllegiance
	
	bool ShouldCompleteObj = False
	
	if ObjDisplayed && ObjCompleted == False
		if HoldOwnedByPlayersFaction
			ShouldCompleteObj = true
		EndIf
	EndIf

	log("CWScript", " restartCivilWarCompleteObjectiveIfNeeded() COMPLETE OBJECTIVE? " + ShouldCompleteObj + "; Details: Objective: " + objectiveToCheck + ", Location: " + HoldLocationToCheck + " Objective Displayed?: " + ObjDisplayed + ", Objective Completed?: " + ObjCompleted + ", Location Owned by Player's faction?: " + HoldOwnedByPlayersFaction)
	
	if ShouldCompleteObj
		CWObj.SetObjectiveCompleted(objectiveToCheck)
	EndIf
	
EndFunction



Function SetCountWins()
{Sets various count variables for keeping track of how many times each faction won each hold... calls SetCountWinsImperials() and SetCountWinsSons()}

	if ContestedHoldWinner == iImperials
		SetCountWinsImperials()
	Elseif contestedHoldWinner == iSons
		SetCountWinsSons()
	EndIf
EndFunction


Function SetCountWinsImperials()
	CountWinImperials += 1
		
	if ContestedHold == iReach	;2
		CountWinReachImperials += 1
	
	elseif ContestedHold == iHjaalmarch ;3
		CountWinHjaalmarchImperials += 1
	
	elseif ContestedHold == iWhiterun ;4
		CountWinWhiterunImperials += 1
	
	elseif ContestedHold == iFalkreath ;5
		CountWinFalkreathImperials += 1
	
	elseif ContestedHold == iPale ;6
		CountWinPaleImperials += 1
	
	elseif ContestedHold == iWinterhold ;7
		CountWinWinterholdImperials += 1
	
	elseif ContestedHold == iRift ;9
		CountWinRiftImperials += 1
	
	EndIf
EndFunction

Function SetCountWinsSons()
	CountWinSons += 1
		
	if ContestedHold == iReach	;2
		CountWinReachSons += 1
	
	elseif ContestedHold == iHjaalmarch ;3
		CountWinHjaalmarchSons += 1
	
	elseif ContestedHold == iWhiterun ;4
		CountWinWhiterunSons += 1
	
	elseif ContestedHold == iFalkreath ;5
		CountWinFalkreathSons += 1
	
	elseif ContestedHold == iPale ;6
		CountWinPaleSons += 1
	
	elseif ContestedHold == iWinterhold ;7
		CountWinWinterholdSons += 1
	
	elseif ContestedHold == iRift ;9
		CountWinRiftSons += 1

	EndIf
EndFunction



Message Function getCampaignWonMessage()
{Returns the message object associated with the corresponding contestedHold and contestedHoldWinner property}
	
	Message messageToReturn
	
	if PlayerAllegiance == iImperials
		if contestedHoldWinner == iImperials
			if contestedHoldWinType == 1 ;took away
				messageToReturn = CWCampaignOutcomeWonAttackMsgImperial
			elseif contestedHoldWinType == 2 ;held onto
				messageToReturn = CWCampaignOutcomeWonDefenseMsgImperial
			Else
				Log("CWScript", " WARNING: getCampaignWonMessage() expected 1 or 2 for contestedHoldWinType, found: " + contestedHoldWinType, 2)
			EndIf
		
		elseif contestedHoldWinner == iSons
			if contestedHoldWinType == 1 ; Sons took away
				messageToReturn = CWCampaignOutcomeLostDefenseMsgImperial
			elseif contestedHoldWinType == 2 ;Sons held onto
				messageToReturn = CWCampaignOutcomeLostAttackMsgImperial
			Else
				Log("CWScript", " WARNING: getCampaignWonMessage() expected 1 or 2 for contestedHoldWinType, found: " + contestedHoldWinType, 2)
			EndIf
		
		Else
			Log("CWScript", " WARNING: getCampaignWonMessage() expected 1 or 2 for contestedHoldWinner, found: " + contestedHoldWinType, 2)
		
		EndIf
		
	elseif PlayerAllegiance == iSons
		if contestedHoldWinner == iSons
			if contestedHoldWinType == 1 ;took away
				messageToReturn = CWCampaignOutcomeWonAttackMsgSons
			elseif contestedHoldWinType == 2 ;held onto
				messageToReturn = CWCampaignOutcomeWonDefenseMsgSons
			Else
				Log("CWScript", " WARNING: getCampaignWonMessage() expected 1 or 2 for contestedHoldWinType, found: " + contestedHoldWinType, 2)
			EndIf
		
		elseif contestedHoldWinner == iImperials
			if contestedHoldWinType == 1 ; Imperials took away
				messageToReturn = CWCampaignOutcomeLostDefenseMsgSons
			elseif contestedHoldWinType == 2 ;Imperials held onto
				messageToReturn = CWCampaignOutcomeLostAttackMsgSons
			Else
				Log("CWScript", " WARNING: getCampaignWonMessage() expected 1 or 2 for contestedHoldWinType, found: " + contestedHoldWinType, 2)
			EndIf
		
		Else
			Log("CWScript", " WARNING: getCampaignWonMessage() expected 1 or 2 for contestedHoldWinner, found: " + contestedHoldWinner, 2)
		
		EndIf
	
	Else
		Log("CWScript", " WARNING: getCampaignWonMessage() expected 1 or 2 for PlayerAllegiance, found: " + PlayerAllegiance, 2)
	
	EndIf
	
	
	Log("CWScript", "getCampaignWonMessage() returning: " + messageToReturn)
	
	return messageToReturn 
	
	
;	If contestedHold == iReach
;		If contestedHoldWinner == iImperials
;			return CWCampaignWonReachImperials
;		Else ;== iSons
;			return CWCampaignWonReachSons
;		EndIf
;
;	ElseIf contestedHold == iHjaalmarch
;		If contestedHoldWinner == iImperials
;			return CWCampaignWonHjaalmarchImperials
;		Else ;== iSons
;			return CWCampaignWonHjaalmarchSons
;		EndIf
;		
;	ElseIf contestedHold == iWhiterun
;		If contestedHoldWinner == iImperials
;			return CWCampaignWonWhiterunImperials
;		Else ;== iSons
;			return CWCampaignWonWhiterunSons
;		EndIf
;
;	ElseIf contestedHold == iFalkreath
;		If contestedHoldWinner == iImperials
;			return CWCampaignWonFalkreathImperials
;		Else ;== iSons
;			return CWCampaignWonFalkreathSons
;		EndIf
;
;	ElseIf contestedHold == iPale
;		If contestedHoldWinner == iImperials
;			return CWCampaignWonPaleImperials
;		Else ;== iSons
;			return CWCampaignWonPaleSons
;		EndIf
;
;	ElseIf contestedHold == iWinterhold
;		If contestedHoldWinner == iImperials
;			return CWCampaignWonWinterholdImperials
;		Else ;== iSons
;			return CWCampaignWonWinterholdSons
;		EndIf
;
;	ElseIf contestedHold == iRift
;		If contestedHoldWinner == iImperials
;			return CWCampaignWonRiftImperials
;		Else ;== iSons
;			return CWCampaignWonRiftSons
;		EndIf		
;
;	EndIf

EndFunction


location Function getLocationForHold(int Hold)
{Returns a location corresponding to the integer Hold parameter}

	if Hold == iHaafingar	;1
		return HaafingarHoldLocation
	
	elseif Hold == iReach	;2
		return ReachHoldLocation
	
	elseif Hold == iHjaalmarch ;3
		return HjaalmarchHoldLocation
	
	elseif Hold == iWhiterun ;4
		return WhiterunHoldLocation
	
	elseif Hold == iFalkreath ;5
		return FalkreathHoldLocation
	
	elseif Hold == iPale ;6
		return PaleHoldLocation
	
	elseif Hold == iWinterhold ;7
		return WinterholdHoldLocation
	
	elseif Hold == iEastmarch ;8
		return EastmarchHoldLocation
	
	elseif Hold == iRift ;9
		return RiftHoldLocation
	
	EndIf

EndFunction

int function getIntForHoldLocation(Location LocationToGetIntFor)
	
	if LocationToGetIntFor == None
		log("CWScript", " WARNING! getIntForHoldLocation() returning -1 because it recieved an unexpected location that isn't a hold: " + LocationToGetIntFor)
		return -1
	EndIf


	if LocationToGetIntFor == HaafingarHoldLocation
		return iHaafingar
		
	ElseIf	LocationToGetIntFor == ReachHoldLocation
		return iReach
		
	ElseIf	LocationToGetIntFor == HjaalmarchHoldLocation
		return iHjaalmarch
		
	ElseIf	LocationToGetIntFor == WhiterunHoldLocation
		return iWhiterun
		
	ElseIf	LocationToGetIntFor == FalkreathHoldLocation
		return iFalkreath
		
	ElseIf	LocationToGetIntFor == PaleHoldLocation
		return iPale
		
	ElseIf	LocationToGetIntFor == WinterholdHoldLocation
		return iWinterhold
		
	ElseIf	LocationToGetIntFor == EastmarchHoldLocation
		return iEastmarch
		
	ElseIf	LocationToGetIntFor == RiftHoldLocation
		return iRift
		
	Else
		log("CWScript", " WARNING! getIntForHoldLocation() returning -1 because it recieved an unexpected location that isn't a hold: " + LocationToGetIntFor)
		return -1
	EndIf

EndFunction


ObjectReference Function getCampaignStartMarker(int Hold)
{Returns an objectReference (xmarker) corresponding to the integer Hold parameter}

	if Hold == iHaafingar	;1
		return CWCampaignStartMarkerHaafingar
	
	elseif Hold == iReach	;2
		return CWCampaignStartMarkerReach
	
	elseif Hold == iHjaalmarch ;3
		return CWCampaignStartMarkerHjaalmarch
	
	elseif Hold == iWhiterun ;4
		return CWCampaignStartMarkerWhiterun
	
	elseif Hold == iFalkreath ;5
		return CWCampaignStartMarkerFalkreath
	
	elseif Hold == iPale ;6
		return CWCampaignStartMarkerPale
	
	elseif Hold == iWinterhold ;7
		return CWCampaignStartMarkerWinterhold
	
	elseif Hold == iEastmarch ;8
		return CWCampaignStartMarkerEastmarch
	
	elseif Hold == iRift ;9
		return CWCampaignStartMarkerRift
	
	EndIf

EndFunction


function initializeFortOwnerKeywordData()
	;The main quest needs to find CWCampaignStartMarkers based on who owns the hold. The CWCampaignMarker objects live in all the forts, therefore I need to set the keyword data for these at game start so without question the Main Quest knows who owns what via keyword data

	FortHraggstadLocation.SetKeywordData(CWOwner, iImperials)
	FortSungardLocation.SetKeywordData(CWOwner, iImperials)
	FortSnowhawkLocation.SetKeywordData(CWOwner, iImperials)
	FortGreymoorLocation.SetKeywordData(CWOwner, iImperials)
	FortNeugradLocation.SetKeywordData(CWOwner, iImperials)

	FortDunstadLocation.SetKeywordData(CWOwner, iSons)
	FortKastavLocation.SetKeywordData(CWOwner, iSons)
	FortAmolLocation.SetKeywordData(CWOwner, iSons)
	FortGreenwallLocation.SetKeywordData(CWOwner, iSons)

EndFunction

int function getOwner(Location LocationToCheck)
{Returns an int representing the faction that controls the location. Checked the CWOwner keyword data on the location. 1 = Imperials, 2 = Sons}

	int owner = LocationToCheck.GetKeywordData(CWOwner) as Int

	Log("CWScript", "GetOwner(" + LocationToCheck + ") returning " + owner + "(" + FactionName(owner) + ")")

	return owner

EndFunction

int Function GetAttacker(Location LocationToCheck)
{Returns and int representing the faction that does not control the location}

	int returnVal

	if GetOwner(LocationToCheck) == iImperials
		returnVal = iSons
		
	Elseif GetOwner(LocationToCheck) == iSons
		returnVal = iImperials
		
	Else
	
		Log("CWScript", " WARNING: GetAttacker(" + LocationToCheck + ") found unexpected Owner. Expected 1 or 2, instead got " + returnVal, 2, true, true)

	EndIf
	
		Log("CWScript", "GetAttacker(" + LocationToCheck + ") returning: " + returnVal)
	
	return returnVal

EndFunction

int Function GetDefender(Location LocationToCheck)
{Returns and int representing the faction that does not control the location}

	int returnVal = GetOwner(LocationToCheck)
	
	Log("CWScript", "GetDefender(" + LocationToCheck + ") returning: " + returnVal)
	
	return returnVal

EndFunction


bool function PlayersFactionIsAttacker(Location LocationToCheck)
	bool returnVal
	
	returnVal = GetAttacker(LocationToCheck) == PlayerAllegiance
	
	Log("CWScript", "PlayersFactionIsAttacker(" + LocationToCheck + ") returning: " + returnVal)
	
	return returnVal

EndFunction

bool function PlayersFactionIsDefender(Location LocationToCheck)
	bool returnVal
	
	returnVal = GetDefender(LocationToCheck) == PlayerAllegiance
	
	Log("CWScript", "PlayersFactionIsDefender(" + LocationToCheck + ") returning: " + returnVal)
	
	return returnVal

EndFunction

bool function ImperialsAreAttacking(Location LocationToCheck)
	Log("CWScript", "ImperialsAreAttacking()")
	bool returnVal
	
	returnVal = GetAttacker(LocationToCheck) == iImperials
	
	Log("CWScript", "ImperialsAreAttacking() returning: " + returnVal)
		
	return returnVal

EndFunction

bool function SonsAreAttacking(Location LocationToCheck)
	Log("CWScript", "SonsAreAttacking()")
	bool returnVal
	
	returnVal = GetAttacker(LocationToCheck) == iSons
	
	Log("CWScript", "SonsAreAttacking() returning: " + returnVal)
		
	return returnVal

EndFunction

bool function IsActorAttacker(actor actorToCheck, Location locationOfBattle)
{Returns true if the actor is in the CWImperial/SonsFaction and that faction is currently the Attacker}
	
	bool returnVal = GetAttacker(locationOfBattle) == GetActorAllgeiance(actorToCheck)
	
	Log("CWScript", "IsActorAttacker(" + actorToCheck + ", " + locationOfBattle + ") returning: " + returnVal)
	
	return returnVal

EndFunction

bool function IsActorDefender(actor actorToCheck, Location locationOfBattle)
{Returns true if the actor is in the CWImperial/SonsFaction and that faction is currently the Defender}
	return GetDefender(locationOfBattle) == GetActorAllgeiance(actorToCheck)
	
EndFunction


int function GetWinner(Location LocationOfFinaleBattle, bool AttackerWon = false, bool DefenderWon = False)
	Log("CWScript", "GetWinner() LocationOfFinalBattle: " + LocationOfFinaleBattle + " AttackerWon: " + AttackerWon + ", DefenderWon:" + DefenderWon )
	
	int returnVar
	
	if AttackerWon
		returnVar = GetAttacker(LocationOfFinaleBattle)
		
	elseif DefenderWon
		returnVar = GetDefender(LocationOfFinaleBattle)
	
	Else
		Log("CWScript", " WARNING: GetWinner() called with NEITHER AtackerWon nor DefenderWon parameters being true!", 2, true, true )
		returnVar = -1
	EndIf

	Log("CWScript", "GetWinner() returning " + returnVar)
	
	return returnVar
	
EndFunction


;CALLED BY CWMissionScript
;Note: this should only be called for registering settlments and towns, not capitals
;it's used by main quest negotiations, flavored as "a massacre" with some question as to what happened. Everyone knows what happened at capital battles.
Function RegisterLocationAttacked(Location HoldLocation, location AttackedLocation, int iFaction = 0)
{Called by any mission where a settlement is attacked violently in such a way that people *could* condemn the action. Default iFaction doing the attacking is the CW.Attacker}
	if iFaction == 0
		iFaction = GetAttacker(HoldLocation)
	EndIf
		
	if iFaction == iImperials
		Log("CWScript", "RegisterLocationAttacked() setting LastLocAttackedByImperials to " + AttackedLocation)
		LastLocAttackedByImperials = AttackedLocation
		
	elseif iFaction == iSons
		Log("CWScript", "RegisterLocationAttacked() setting LastLocAttackedBySons to " + AttackedLocation)
		LastLocAttackedBySons = AttackedLocation
	Else
		Log("CWScript",  " WARNING: RegisterLocationAttack expected GetAttacker(HoldLocation) to be 1 or 2.", 2, true, true)
	EndIf

	LastLocAttacked = AttackedLocation
	
	Log("CWMissionScript", self + "RegisterLocationAttacked() setting LastLocAttacked to " + AttackedLocation)
	
EndFunction

function RemoveGarrisonFromWar(Location LocationToTurnOff)
	Log("CWMissionScript", self + "RemoveGarrisonFromWar(" + LocationToTurnOff + "), REMEMBER TO DISABLE THE ENABLE MARKERS YOURSELF")

	;-2 because GetKeyWordData() returns -1 if the keyword isn't present
	
	If LocationToTurnOff.HasKeyword(CWGarrison)
		Log("CWMissionScript", self + "RemoveGarrisonFromWar() setting CWGarrison to  -2 for location: " + LocationToTurnOff + " REMEMBER TO DISABLE THE ENABLE MARKERS YOURSELF")
		LocationToTurnOff.SetKeywordData(CWGarrison, -2)  	;NOTE!!! This ONLY works for things with the CWGarrison keyword, which are settlements and towns, etc. that aren't CWGarrisonDefenderOnly, or Camps, or Forts.
	
	elseif LocationToTurnOff.HasKeyword(CWFort)
		Log("CWMissionScript", self + "RemoveGarrisonFromWar() setting CWFort to  -2 for location: " + LocationToTurnOff + " REMEMBER TO DISABLE THE ENABLE MARKERS YOURSELF")
		LocationToTurnOff.SetKeywordData(CWFort, -2)  	;NOTE!!! This ONLY works for things with the CWFort keyword
	
	Else
		Log("CWMissionScript", self + " WARNING: RemoveGarrisonFromWar() found NEITHER CWGarrison NOR CWFort keyword for location : " + LocationToTurnOff + " THIS WILL CAUSE UNEXPECTED BEHAVIOR", 2, true, true)
	
	EndIf
	
	
EndFunction

function AddGarrisonBackToWar(Location LocationToTurnOn, int FactionToOwn = 0, bool SkipSetOwnerCall = False)
	Log("CWMissionScript", self + "AddGarrisonBackToWar(" + LocationToTurnOn + ") and will call setOwner() so it will get turned on.")
	
	If LocationToTurnOn.HasKeyword(CWGarrison)
		Log("CWMissionScript", self + "AddGarrisonBackToWar() setting CWGarrison to 0 for location: " + LocationToTurnOn + " and will call setOwner() so it will get turned on.")	
		LocationToTurnOn.SetKeywordData(CWGarrison, 0)
	
	elseif LocationToTurnOn.HasKeyword(CWFort)	
		Log("CWMissionScript", self + "AddGarrisonBackToWar() setting CWFort to 0 for location: " + LocationToTurnOn + " and will call setOwner() so it will get turned on")
		LocationToTurnOn.SetKeywordData(CWFort, 0)  	

	Else
		Log("CWMissionScript", self + " WARNING: AddGarrisonBackToWar() found NEITHER CWGarrison NOR CWFort keyword for location : " + LocationToTurnOn + " THIS WILL CAUSE UNEXPECTED BEHAVIOR", 2, true, true)
	
	EndIf
	
	if FactionToOwn == 0		;if it's not explicitly passed in, use the current owner
	
		FactionToOwn = LocationToTurnOn.GetKeywordData(CWOwner) as Int
	
		Log("CWMissionScript", self + "AddGarrisonBackToWar() setting FactionToOwn to current owner:" + FactionToOwn)
	
	endif
	
	if SkipSetOwnerCall == False
		setOwner(LocationToTurnOn, 	FactionToOwn)
	EndIf

EndFunction

function AddEnemyFortsToBackToWar(bool ShowDebugMessage = False)
	Log("CWMissionScript", self + "AddEnemyFortsToBackToWar()")
	
	if ShowDebugMessage == True
		debug.MessageBox("Setting Enemy Forts to be cleared of bandits and ready for missions. WAIT before testing civil war missions.")
	
	EndIf
	
	if EnemyFortsAddedBackToWar == True
		Log("CWMissionScript", self + "AddEnemyFortsToBackToWar() EnemyFortsAddedBackToWar == true, so skipping bailing out from adding forts back to war ")
		return
	EndIf
	
	if PlayerAllegiance == iImperials
		Log("CWMissionScript", self + "AddEnemyFortsToBackToWar() player is Imperial, adding Stormcloak forts (not Fort Greymoor regardless) back to the war by calling AddGarrisonBackToWar.")
		
		;AddGarrisonBackToWar(FortGreymoorLocation) - leaving this alone since I'm assuming the majority of players will own the hold, we want them to fight bandits here
		
		AddGarrisonBackToWar(FortKastavLocation)
		AddGarrisonBackToWar(FortDunstadLocation)
		AddGarrisonBackToWar(FortAmolLocation)
		AddGarrisonBackToWar(FortGreenWallLocation)
		
		EnemyFortsAddedBackToWar = True
	
	elseif PlayerAllegiance == iSons
		Log("CWMissionScript", self + "AddEnemyFortsToBackToWar() player is Sons, adding Imperial forts (not Fort Greymoor regardless) back to the war by calling AddGarrisonBackToWar().")

		;AddGarrisonBackToWar(FortGreymoorLocation) - leaving this alone since I'm assuming the majority of players will own the hold, we want them to fight bandits here
		
		AddGarrisonBackToWar(FortNeugradLocation)
		AddGarrisonBackToWar(FortHraggstadLocation)
		AddGarrisonBackToWar(FortSungardLocation)
		AddGarrisonBackToWar(FortSnowhawkLocation)
		
		
		EnemyFortsAddedBackToWar = True
		
	Else
		Log("CWMissionScript", self + " WARNING: AddEnemyFortsToBackToWar() expected PlayerAllegiance to be 1 or 2, instead got" + PlayerAllegiance, 2, true, true)
		
	EndIf

	if ShowDebugMessage == True
		debug.MessageBox("Done Setting Enemy Forts to be cleared of bandits and ready for missions. You may now test civil war missions.")
	
	EndIf
	
	Log("CWMissionScript", self + "AddEnemyFortsToBackToWar() FINSIHED")
	
EndFunction

function SetOwnerKeywordDataOnly(Location LocationToSet, int FactionToOwn)
{used by SetOwner() function... probably not a good idea to call on it's own, unless you know you will soon be following up with a setowner call}
		if LocationToSet
			LocationToSet.SetKeywordData(CWOwner, FactionToOwn)
		EndIf

EndFunction

Function setOwner(Location LocationToSet1, int FactionToOwn, Location LocationToSet2 = None, Location LocationToSet3 = None, Location LocationToSet4 = None, \
					Location LocationToSet5 = None, Location LocationToSet6 = None , Location LocationToSet7 = None , Location LocationToSet8 = None, \
					bool SetKeywordDataImmediately = False)
{Sets the CWOwner keyword on LocationToSet based on the FactionToOwn (takes 1,2, or 3, it sets the keyword data to -1, -2, -3 for Imperials, Sons, both factions (ie patrols) respectively). Note: If Faction to Own == -999 it means don't change the keyword, just reset the location - used to reset the guards without changing ownership}

	int SecondsSpentWaiting						;how many seconds spent waiting for callback from CWResetGarrisonQuest
	int MaxSecondsToWaitBeforeBailingOut = 600 ;wait 10 minutes for call back from CWResetGarrisonQuest, then give up

	if debugSkipSetOwnerCalls
		log("CWScript", "setOnwer() debugSkipSetOwnerCalls is turned on, so we are skipping calls to set owner. This will break things, but is convenient to start campaign faster for certain types of playtesting.", 1)
		return
	EndIf

	if setKeywordDataImmediately
		SetOwnerKeywordDataOnly(LocationToSet1, FactionToOwn)
		SetOwnerKeywordDataOnly(LocationToSet2, FactionToOwn)
		SetOwnerKeywordDataOnly(LocationToSet3, FactionToOwn)
		SetOwnerKeywordDataOnly(LocationToSet4, FactionToOwn)
		SetOwnerKeywordDataOnly(LocationToSet5, FactionToOwn)
		SetOwnerKeywordDataOnly(LocationToSet6, FactionToOwn)
		SetOwnerKeywordDataOnly(LocationToSet7, FactionToOwn)
		SetOwnerKeywordDataOnly(LocationToSet8, FactionToOwn)
	EndIf
	
	;trap any threads that have come in while we are already dealing with previous request(s)
	while WaitingForCWResetGarrisonQuest1 || WaitingForCWResetGarrisonQuest2 || WaitingForCWResetGarrisonQuest3 || WaitingForCWResetGarrisonQuest4
		log("CWScript", "setOwner() Wants to process new locations, but we are already processing another request and are still waiting for CWResetGarrison quests to call back.")	
		Utility.wait(5)
	EndWhile
	
	log("CWScript", "setOwner(), setting WaitingForCWResetGarrisonQuest1/2/3/4/5/6/7/8 to True")	
	WaitingForCWResetGarrisonQuest1 = true
	WaitingForCWResetGarrisonQuest2 = true
	WaitingForCWResetGarrisonQuest3 = true
	WaitingForCWResetGarrisonQuest4 = true
	WaitingForCWResetGarrisonQuest5 = true
	WaitingForCWResetGarrisonQuest6 = true
	WaitingForCWResetGarrisonQuest7 = true
	WaitingForCWResetGarrisonQuest8 = true
	
	;The IMPORTANT thing about this function, is that it does NOT return until after all the ResetGarrison quests are all finished running
	
	;Start ResetGarrisonX quests (returns false if not starting quest because LocationToSetX is empty)
	
	;the reason wrap this in a test if an if statement, is because it is possible that the quest sets the WaitingForCWResetGarrisonX property to false in it's shut down phase before this function returns and we don't want to overwrite that with true returned by this function)
	if !setOwnerStartResetQuest(LocationToSet1, FactionToOwn, CWResetGarrisonStart1)
		WaitingForCWResetGarrisonQuest1 = false
	EndIf
	
	if !setOwnerStartResetQuest(LocationToSet2, FactionToOwn, CWResetGarrisonStart2)
		WaitingForCWResetGarrisonQuest2 = false
	EndIf
	
	if !setOwnerStartResetQuest(LocationToSet3, FactionToOwn, CWResetGarrisonStart3)
		WaitingForCWResetGarrisonQuest3 = false
	EndIf

	if !setOwnerStartResetQuest(LocationToSet4, FactionToOwn, CWResetGarrisonStart4)
		WaitingForCWResetGarrisonQuest4 = false
	EndIf

	if !setOwnerStartResetQuest(LocationToSet5, FactionToOwn, CWResetGarrisonStart5)
		WaitingForCWResetGarrisonQuest5 = false
	EndIf

	if !setOwnerStartResetQuest(LocationToSet6, FactionToOwn, CWResetGarrisonStart6)
		WaitingForCWResetGarrisonQuest6 = false
	EndIf

	if !setOwnerStartResetQuest(LocationToSet7, FactionToOwn, CWResetGarrisonStart7)
		WaitingForCWResetGarrisonQuest7 = false
	EndIf

	if !setOwnerStartResetQuest(LocationToSet8, FactionToOwn, CWResetGarrisonStart8)
		WaitingForCWResetGarrisonQuest8 = false
	EndIf
		
	
	While WaitingForCWResetGarrisonQuest1 || WaitingForCWResetGarrisonQuest2 || WaitingForCWResetGarrisonQuest3 || WaitingForCWResetGarrisonQuest4 || \
			WaitingForCWResetGarrisonQuest5 || WaitingForCWResetGarrisonQuest6 || WaitingForCWResetGarrisonQuest7 || WaitingForCWResetGarrisonQuest8 || \
			CWResetGarrison1.IsStopped() == False || CWResetGarrison2.IsStopped() == False || CWResetGarrison3.IsStopped() == False || CWResetGarrison4.IsStopped() == False || \
			CWResetGarrison5.IsStopped() == False || CWResetGarrison6.IsStopped() == False || CWResetGarrison7.IsStopped() == False || CWResetGarrison8.IsStopped() == False
			
		if SecondsSpentWaiting >= MaxSecondsToWaitBeforeBailingOut
			log("CWScript", "setOwner(): ERROR!!! Have been waiting for call backs from CWResetGarrison1/2/3/4/5/6/7/8 quests for " + SecondsSpentWaiting + " seconds. Giving up." , 2)
			return
		
		Else
			log("CWScript", "setOwner() waiting for CWResetGarrison1/2/3/4/5/6/7/8 quests to call back. Have been waiting for " + SecondsSpentWaiting + " seconds.")	

; ;			debug.trace(WaitingForCWResetGarrisonQuest1 + " " + \
;				WaitingForCWResetGarrisonQuest2 + " " + \
;				WaitingForCWResetGarrisonQuest3 + " " + \
;				WaitingForCWResetGarrisonQuest4 + " " + \
;				WaitingForCWResetGarrisonQuest5 + " " + \
;				WaitingForCWResetGarrisonQuest6 + " " + \
;				WaitingForCWResetGarrisonQuest7 + " " + \
;				WaitingForCWResetGarrisonQuest8 + " " + \
;				CWResetGarrison1.IsStopped() + " " + \
;				CWResetGarrison2.IsStopped() + " " + \
;				CWResetGarrison3.IsStopped() + " " + \
;				CWResetGarrison4.IsStopped() + " " + \
;				CWResetGarrison5.IsStopped() + " " + \
;				CWResetGarrison6.IsStopped() + " " + \
;				CWResetGarrison7.IsStopped() + " " + \
;				CWResetGarrison8.IsStopped() + " " )
			
			SecondsSpentWaiting += 5
			Utility.Wait(5)
		
		EndIf
	EndWhile
	
	log("CWScript", "setOwner() is finsihed")	
	
EndFunction

bool function setOwnerStartResetQuest(Location LocationToSet, int FactionToOwn, Keyword KeywordForResetGarrisonQuest)
{Sub function of setOwner()}

	log("CWScript", "setOwnerStartResetQuest() called with: LocationToSet: " + LocationToSet + ", FactionToOwn: " + FactionToOwn + ", KeywordForResetGarrisonQuest: " + KeywordForResetGarrisonQuest)

	if locationToSet
		if FactionToOwn != iCurrentOwner
			;LocationToSet.SetKeyWordData(CWOwner, -(FactionToOwn)) NO LONGER SETTING IT TO NEGAITVE... i was using -1 for obsolete reasons... it's now possible to cause problems because my quest conditions for missions often are CWOwnner != PlayerAllegience (which -1 and -2 will always return true for, so it's possible to get a mission for some place that would be in the middle of switching over)
			LocationToSet.SetKeyWordData(CWOwner, FactionToOwn)
			log("CWScript", "setOwnerStartResetQuest() setting owner to " + FactionToOwn +"(" + FactionName(FactionToOwn) + ") for " + LocationToSet)
		Else
			log("CWScript", "setOwnerStartResetQuest() not changing owner, just resetting the garrison for whoever currently owns it.")
		EndIf

;		While Game.GetPlayer().IsInLocation(LocationToSet)	;do nothing until the player isn't in same location as the LocToReset
;			;DO NOTHING
;			log("CWScript", "setOwnerStartResetQuest() waiting until player is no longer in location:" + LocationToSet)
;			utility.wait(1)	;wait a second before checking if if player is in location again
;		EndWhile
;THE ABOVE WAY IS NOT AS GOOD BECAUSE IT COULD CAUSE THINGS TO POP IF YOU TECHNICALLY ARE NOT IN THE LOCATION BUT YOU CAN STILL "SEE INTO" IT -- commenting it out rather than deleting for now

		While LocationToSet.IsLoaded()	;do nothing until the player isn't in same area as the LocToReset
			;DO NOTHING
			log("CWScript", "setOwnerStartResetQuest() waiting until location is no longer loaded (ie out of the 5x5):" + LocationToSet)
			utility.wait(1)	;wait a second before checking if if player is in location again
		EndWhile

		log("CWScript", "setOwnerStartResetQuest() starting reset garrison quest, CWResetGarrissonX.SendStoryEvent(" + LocationToSet + ")")
		KeywordForResetGarrisonQuest.SendStoryEvent(LocationToSet)
	
	Else
		return False		;we aren't starting a quest
	EndIf

		log("CWScript", "setOwnerStartResetQuest() finished.")
	
	return True			;we are starting a quest -- NOTE don't do anything with this return value because it's POSSIBLE that the quest's shut down phase happens (setting the property in quest to false) before this returns true. We don't want to overwrite it: see note SetOwner() where this function is called)



EndFunction



function WinHoldOffScreenIfNotDoingCapitalBattles(Location HoldToWin, bool AttackersHaveWon = true, bool DefendersHaveWon = False)
;CALLED BY STAGE 9000 IN THE CWFortSiegeCaptial/Fort Quests for regular Fort Battles
;AND STAGE 200 in CWMission04 Quest - Rescue Prisoners from fort and take over
;REPLICATE WHAT USED TO HAPPEN AFTER BATTLES FOR CAPITAL CITIES AND MINOR HOLDS

	log("CWScript", "WinHoldOffScreen(HoldToWin:" + HoldToWin + ", AttackersHaveWon:" + AttackersHaveWon + ", DefendersHaveWon:" + DefendersHaveWon + ")")
	
	;IF WE LATER DECIDE TO REIMPLEMENT THE ATTACKS ON THE CAPITALS
	;THE LOGIC FOR WHICH WE WILL DO CAN GO HERE
	
	WinHoldAndSetOwnerKeywordDataOnly(HoldToWin, AttackersHaveWon, DefendersHaveWon)

	CompleteCWObj(HoldToWin)

	;if the peace treaty quest is running, shut it down, as it's now too late to have a peace treaty
	if HoldToWin == HjaalmarchHoldLocation || HoldToWin == WinterholdHoldLocation
		
		bool MQ302Running = MQ302.isRunning()
		int MQ302Stage = MQ302.getstage()
		
		log("CWScript", "WinHoldOffScreen(HoldToWin:" + HoldToWin + ") MQ302 is running? [" + MQ302Running  + "], MQ302 stage: " + MQ302Stage)
		
		if MQ302Running && MQ302Stage < 40
			log("CWScript", "WinHoldOffScreen(HoldToWin:" + HoldToWin + ") MQ302 is running and < stage 40, so calling it's stage 350 to shut it down.")
			MQ302.setStage(350)
		EndIf
	
	EndIf
	
	;GIVE OWNERSHIP - WAITS to return until player isn't in various locations in the hold
	WinHoldAndSetOwner(HoldToWin, AttackersHaveWon, DefendersHaveWon)

EndFunction


function WinHoldAndSetOwnerKeywordDataOnly(Location HoldLocationToSet, bool AttackersWon, bool DefendersWon)
{Call the moment one side has won a siege so faction leader has appropriate dialogue }
	
	WinningHoldAndSettingOwnerPleaseWait = True
	
	log("CWScript", "WinHoldAndSetOwnerKeywordDataOnly() HoldLocationToSet:" + HoldLocationToSet + ", AttackersWon: " + AttackersWon + ", DefendersWon: " + DefendersWon) 

	int winner = GetWinner(HoldLocationToSet, AttackersWon, DefendersWon)
	
	SetOwnerKeywordDataOnly(HoldLocationToSet, winner)
	WinHoldAndSetOwnerAlreadySetKeyword = True
	
	log("CWScript", "WinHoldAndSetOwnerKeywordDataOnly() Will call ClearHoldCrimeGold(" + HoldLocationToSet + ")")
	ClearHoldCrimeGold(HoldLocationToSet)
	
	WinningHoldAndSettingOwnerPleaseWait = False
	
EndFunction

function WinHoldAndSetOwner(Location HoldLocationToSet, bool AttackersWon, bool DefendersWon)
{Call at the end of a siege in shutdown stage}

	int waitingFor

	while WinningHoldAndSettingOwnerPleaseWait
		utility.wait(1)
		WaitingFor += 1
		log("CWScript", "WinHoldAndSetOwner(): WinningHoldAndSettingOwnerPleaseWait == true, meaning WinHoldAndSetOwnerKeywordOnly is currently processing... waiting for:" + waitingFor) 
	EndWhile

	log("CWScript", "WinHoldAndSetOwner() HoldLocationToSet:" + HoldLocationToSet + ", AttackersWon: " + AttackersWon + ", DefendersWon: " + DefendersWon) 

	int NewOwner
	
	if WinHoldAndSetOwnerAlreadySetKeyword == False
		log("CWScript", "WinHoldAndSetOwner() sees WinHoldAndSetOwnerAlreadySetKeyword == false, so we will determine the new owner with GetWinner()")
		NewOwner = GetWinner(HoldLocationToSet, AttackersWon, DefendersWon)
	Else
		log("CWScript", "WinHoldAndSetOwner() sees WinHoldAndSetOwnerAlreadySetKeyword == true, so we will determine the new owner with GetKeywordData()")
		NewOwner = HoldLocationToSet.GetKeywordData(CWOwner) as Int
		WinHoldAndSetOwnerAlreadySetKeyword = False
	EndIf
	
	log("CWScript", "WinHoldAndSetOwner() Will call ClearHoldCrimeGold(" + HoldLocationToSet + ")")
	ClearHoldCrimeGold(HoldLocationToSet)
	
	log("CWScript", "WinHoldAndSetOwner() Will call SetHoldOwner() for faction:" + NewOwner)
	SetHoldOwner(HoldLocationToSet, NewOwner)
	
EndFunction


function SetHoldOwner(Location HoldLocationToSet, int factionToOwn)
	log("CWScript", "SetHoldOwner(" + HoldLocationToSet + ", " + factionToOwn + ") calling SetOwner()")
	
	SetOwnerKeywordDataOnly(HoldLocationToSet, factionToOwn)
	
	SetHoldOwnerByInt(GetHoldID(HoldLocationToSet), factionToOwn)

EndFunction

;OLD VERSION - used by MQ
Function SetHoldOwnerByInt(int HoldToSet, int FactionToOwn, bool DiplomaticVictory = false	)
{Takes int HoldToSet and int FactionToOwn, and calls the appropriate setOwnerXXX(FactionToOwn) function - DiplomaticVictory is for if hold was won through MQ302, and sets keyword data which is used for conditions in dialogue with faction leader}

	if HoldToSet == iHaafingar ;1
		AddGarrisonBackToWar(FortHraggstadLocation, FactionToOwn, SkipSetOwnerCall = DiplomaticVictory)
		setOwnerHaafingar(FactionToOwn, DiplomaticVictory)
		
	elseif HoldToSet == 	iReach ; 2
		AddGarrisonBackToWar(FortSungardLocation, FactionToOwn, SkipSetOwnerCall = DiplomaticVictory)
		setOwnerReach(FactionToOwn, DiplomaticVictory)
		
	elseif HoldToSet == 	iHjaalmarch ;3
		AddGarrisonBackToWar(FortSnowhawkLocation, FactionToOwn, SkipSetOwnerCall = DiplomaticVictory)
		setOwnerHjaalmarch(FactionToOwn, DiplomaticVictory)
		
	elseif HoldToSet == 	iWhiterun ;4
		AddGarrisonBackToWar(FortGreymoorLocation, FactionToOwn, SkipSetOwnerCall = DiplomaticVictory)
		setOwnerWhiterun(FactionToOwn, DiplomaticVictory)
		
	elseif HoldToSet == 	iFalkreath ;5
		AddGarrisonBackToWar(FortNeugradLocation, FactionToOwn, SkipSetOwnerCall = DiplomaticVictory)
		setOwnerFalkreath(FactionToOwn, DiplomaticVictory)
		
	elseif HoldToSet == 	iPale ;6
		AddGarrisonBackToWar(FortDunstadLocation, FactionToOwn, SkipSetOwnerCall = DiplomaticVictory)
		setOwnerPale(FactionToOwn, DiplomaticVictory)
		
	elseif HoldToSet == 	iWinterhold ;7
		AddGarrisonBackToWar(FortKastavLocation, FactionToOwn, SkipSetOwnerCall = DiplomaticVictory)
		setOwnerWinterhold(FactionToOwn, DiplomaticVictory)
		
	elseif HoldToSet == 	iEastmarch ;8
		AddGarrisonBackToWar(FortAmolLocation, FactionToOwn, SkipSetOwnerCall = DiplomaticVictory)
		setOwnerEastmarch(FactionToOwn, DiplomaticVictory)
		
	elseif HoldToSet == 	iRift ;9
		AddGarrisonBackToWar(FortGreenwallLocation, FactionToOwn, SkipSetOwnerCall = DiplomaticVictory)
		setOwnerRift(FactionToOwn, DiplomaticVictory)
		
	else
		log("CWScript", "SetHoldOwnerByInt(" + HoldToSet + ") parametered unrecognized. Expected an int 1-9 as HoldToCheck, got something else.")
	EndIf

EndFunction



Function setCountHoldProperties()
{Calls setCountHoldsImperial() and setCountHoldsSons()}

	setCountHoldsImperial()
	setCountHoldsSons()

EndFunction

Function setCountHoldsImperial()
{Sets CountHoldsImperial property and associated CWCountHoldsImperial global... note, call this AFTER setting any new ownerXXX property values, such as in the setOwnerXXX() function.}
	int count = 0

	if OwnerHaafingar == iImperials
		count += 1
	EndIf
	if OwnerReach == iImperials
		count += 1
	EndIf
	if OwnerHjaalmarch == iImperials
		count += 1
	EndIf
	if OwnerWhiterun == iImperials
		count += 1
	EndIf
	if OwnerFalkreath == iImperials
		count += 1
	EndIf
	if OwnerPale == iImperials
		count += 1
	EndIf
	if OwnerWinterhold == iImperials
		count += 1
	EndIf
	if OwnerEastmarch == iImperials
		count += 1
	EndIf
	if OwnerRift == iImperials
		count += 1
	EndIf

	countHoldsImperial = count
	CWCountHoldsImperial.value = count
	
EndFunction

Function setCountHoldsSons()
{Sets CountHoldsSons property and associated CWCountHoldsSon global... note, call this AFTER setting any new ownerXXX property values, such as in the setOwnerXXX() function.}
	int count = 0

	if OwnerHaafingar == iSons
		count += 1
	EndIf
	if OwnerReach == iSons
		count += 1
	EndIf
	if OwnerHjaalmarch == iSons
		count += 1
	EndIf
	if OwnerWhiterun == iSons
		count += 1
	EndIf
	if OwnerFalkreath == iSons
		count += 1
	EndIf
	if OwnerPale == iSons
		count += 1
	EndIf
	if OwnerWinterhold == iSons
		count += 1
	EndIf
	if OwnerEastmarch == iSons
		count += 1
	EndIf
	if OwnerRift == iSons
		count += 1
	EndIf

	countHoldsSons = count
	CWCountHoldsSons.value = count
	
EndFunction



;bool function IsSiegeRunningHere(Location LocationToCheck)
;	
;	location SiegeLoc = CWSiegeCity.GetLocation()
;	
;	bool returnVar
;	
;	if CWSiegeS.IsStopped() == False && SiegeLoc == LocationToCheck
;		returnVar = True
;		
;	Else
;		returnVar = False
;	
;	EndIf
;	
;	log("CWScript", "IsSiegeRunningHere(" + LocationToCheck + ") returning: " + returnVar)
;	
;	return returnVar
;
;EndFunction


;POSSIBLY OBSOLETE
Function ResetHolds()
;called by CWHoldManagerScript attached to CW

	log("CWScript", "ResetHolds()")

	setOwnerHaafingar(iCurrentOwner)
	setOwnerReach(iCurrentOwner)
	setOwnerHjaalmarch(iCurrentOwner)
	setOwnerWhiterun(iCurrentOwner)
	setOwnerFalkreath(iCurrentOwner)
	setOwnerPale(iCurrentOwner)
	setOwnerWinterhold(iCurrentOwner)
	setOwnerEastmarch(iCurrentOwner)
	setOwnerRift(iCurrentOwner)

EndFunction

Function setInitalOwnerKeywordDataOnly()
{A quick way to initialize keyword data at game start only, so Civil War missions fill aliases correctly. The more "thorough" function is SetInitialOwners()}

	;# Haafingar
	HaafingarHoldLocation.SetKeywordData(CWOwner, iImperials)

	FortHraggstadLocation.SetKeywordData(CWOwner, iImperials)
	SolitudeLocation.SetKeywordData(CWOwner, iImperials)

	SolitudeSawmillLocation.SetKeywordData(CWOwner, iImperials)
	KatlasFarmLocation.SetKeywordData(CWOwner, iImperials)
	DragonBridgeLocation.SetKeywordData(CWOwner, iImperials)

	;# Reach
	ReachHoldLocation.SetKeywordData(CWOwner, iImperials)

	FortSungardLocation.SetKeywordData(CWOwner, iImperials)
	MarkarthLocation.SetKeywordData(CWOwner, iImperials)

	CidhnaMineLocation.SetKeywordData(CWOwner, iImperials)
	LeftHandMineLocation.SetKeywordData(CWOwner, iImperials)
	SalviusFarmLocation.SetKeywordData(CWOwner, iImperials)
	KarthwastenLocation.SetKeywordData(CWOwner, iImperials)
	OldHroldanLocation.SetKeywordData(CWOwner, iImperials)
	KolskeggrMineLocation.SetKeywordData(CWOwner, iImperials)

	;# Hjaalmarch
	HjaalmarchHoldLocation.SetKeywordData(CWOwner, iImperials)

	FortSnowhawkLocation.SetKeywordData(CWOwner, iImperials)
	MorthalLocation.SetKeywordData(CWOwner, iImperials)

	StonehillsLocation.SetKeywordData(CWOwner, iImperials)
;	FrostRiverFarmLocation.SetKeywordData(CWOwner, iImperials)

	;# Whiterun
	WhiterunHoldLocation.SetKeywordData(CWOwner, iImperials)

	FortGreymoorLocation.SetKeywordData(CWOwner, iImperials)
	WhiterunLocation.SetKeywordData(CWOwner, iImperials)

	BattleBornFarmLocation.SetKeywordData(CWOwner, iImperials)
	ChillfurrowFarmLocation.SetKeywordData(CWOwner, iImperials)
	PelagiaFarmLocation.SetKeywordData(CWOwner, iImperials)
	RoriksteadLocation.SetKeywordData(CWOwner, iImperials)
	RiverwoodLocation.SetKeywordData(CWOwner, iImperials)
;	BarleydarkFarmLocation.SetKeywordData(CWOwner, iImperials)

	;# Falkreath
	FalkreathHoldLocation.SetKeywordData(CWOwner, iImperials)

	FortNeugradLocation.SetKeywordData(CWOwner, iImperials)
	FalkreathLocation.SetKeywordData(CWOwner, iImperials)

;	GraniteHillLocation.SetKeywordData(CWOwner, iImperials)
	HelgenLocation.SetKeywordData(CWOwner, iImperials)
;	BearsCaveMillLocation.SetKeywordData(CWOwner, iImperials)
	HalfmoonMillLocation.SetKeywordData(CWOwner, iImperials)

	;# Pale
	PaleHoldLocation.SetKeywordData(CWOwner, iSons) 

	FortDunstadLocation.SetKeywordData(CWOwner, iSons) 
	DawnstarLocation.SetKeywordData(CWOwner, iSons) 

;	HeljarchenLocation.SetKeywordData(CWOwner, iSons) 
	AngasMillLocation.SetKeywordData(CWOwner, iSons) 
	LoreiusFarmLocation.SetKeywordData(CWOwner, iSons) 

	;# Winterhold
	WinterholdHoldLocation.SetKeywordData(CWOwner, iSons) 

	FortKastavLocation.SetKeywordData(CWOwner, iSons) 
	WinterholdLocation.SetKeywordData(CWOwner, iSons) 

	WhistlingMineLocation.SetKeywordData(CWOwner, iSons) 

	;# Eastmarch
	EastmarchHoldLocation.SetKeywordData(CWOwner, iSons) 

	FortAmolLocation.SetKeywordData(CWOwner, iSons) 
	WindhelmLocation.SetKeywordData(CWOwner, iSons) 

	BrandyMugFarmLocation.SetKeywordData(CWOwner, iSons) 
	HlaaluFarmLocation.SetKeywordData(CWOwner, iSons) 
	HollyfrostFarmLocation.SetKeywordData(CWOwner, iSons) 
	KynesgroveLocation.SetKeywordData(CWOwner, iSons) 
	DarkwaterCrossingLocation.SetKeywordData(CWOwner, iSons) 
	MixwaterMillLocation.SetKeywordData(CWOwner, iSons) 

	;# Rift
	RiftHoldLocation.SetKeywordData(CWOwner, iSons) 

	FortGreenwallLocation.SetKeywordData(CWOwner, iSons) 
	RiftenLocation.SetKeywordData(CWOwner, iSons) 

	SnowShodFarmLocation.SetKeywordData(CWOwner, iSons) 
	;GoldenglowFarmLocation  -- GoldenGlowFarm is NOT a normal location. It's quest specific area spawning it's own guards, and should not be part of the Civil War.
	MerryfairFarmLocation.SetKeywordData(CWOwner, iSons) 
	IvarsteadLocation.SetKeywordData(CWOwner, iSons) 
	ShorsStoneLocation.SetKeywordData(CWOwner, iSons) 
	HeartwoodMillLocation.SetKeywordData(CWOwner, iSons) 
	SarethiFarmLocation.SetKeywordData(CWOwner, iSons) 

EndFunction


Function setInitialOwners()
{Called in the OnInit block, one time set up of initial owners of all the locations.}

	setOwnerHaafingar(iImperials)
	setOwnerReach(iImperials)
	setOwnerHjaalmarch(iImperials)
	setOwnerWhiterun(iImperials)
	setOwnerFalkreath(iImperials)
	setOwnerPale(iSons)
	setOwnerWinterhold(iSons)
	setOwnerEastmarch(iSons)
	setOwnerRift(iSons)

EndFunction


Function setOwnerHaafingar(int FactionToOwn, bool DiplomaticVictory = false)
	log("CWScript", "CW Script setOwnerHaafingar() started." + "FactionToOwn: " + FactionToOwn + ", DiplomaticVictory: " + DiplomaticVictory)

	if DiplomaticVictory
		HaafingarHoldLocation.SetKeywordData(CWDiplomaticVictory, 1)
		ClearHoldCrimeGold(HaafingarHoldLocation)
	EndIf
	
	if FactionToOwn != iCurrentOwner
		ownerHaafingar = FactionToOwn
		HaafingarHoldLocation.SetKeywordData(CWOwner, FactionToOwn)
	EndIf
	
	setCountHoldProperties()
	setOwner(FortHraggstadLocation, FactionToOwn, MilitaryCampHaafingarSonsLocation, SolitudeLocation, SolitudeSawmillLocation, KatlasFarmLocation, DragonBridgeLocation)
	
	
	log("CWScript", "CW Script setOwnerHaafingar() finished.")
	
EndFunction

Function setOwnerReach(int FactionToOwn, bool DiplomaticVictory = false)
	log("CWScript", "CW Script setOwnerReach() started." + "FactionToOwn: " + FactionToOwn + ", DiplomaticVictory: " + DiplomaticVictory)
	
	if DiplomaticVictory
		ReachHoldLocation.SetKeywordData(CWDiplomaticVictory, 1)
		ClearHoldCrimeGold(ReachHoldLocation)
	EndIf
	
	if FactionToOwn != iCurrentOwner
		ownerReach = FactionToOwn
		ReachHoldLocation.SetKeywordData(CWOwner, FactionToOwn)
	EndIf
	
	setCountHoldProperties()
	
	setOwner(FortSungardLocation, FactionToOwn, MilitaryCampReachImperialLocation, MilitaryCampReachSonsLocation)
	setOwner(MarkarthLocation, FactionToOwn, CidhnaMineLocation, LeftHandMineLocation, SalviusFarmLocation, KarthwastenLocation, OldHroldanLocation, KolskeggrMineLocation)
	
	log("CWScript", "CW Script setOwnerReach() finished.")
	
EndFunction

Function setOwnerHjaalmarch(int FactionToOwn, bool DiplomaticVictory = false)
	log("CWScript", "CW Script setOwnerHjaalmarch() started." + "FactionToOwn: " + FactionToOwn + ", DiplomaticVictory: " + DiplomaticVictory)

	if DiplomaticVictory
		HjaalmarchHoldLocation.SetKeywordData(CWDiplomaticVictory, 1)
		ClearHoldCrimeGold(HjaalmarchHoldLocation)
	EndIf
	
	if FactionToOwn != iCurrentOwner
		ownerHjaalmarch = FactionToOwn
		HjaalmarchHoldLocation.SetKeywordData(CWOwner, FactionToOwn)
	EndIf
	
	setCountHoldProperties()

	setOwner(FortSnowhawkLocation, FactionToOwn, MilitaryCampHjaalmarchImperialLocation, MilitaryCampHjaalmarchSonsLocation, MorthalLocation, StonehillsLocation)
	
	log("CWScript", "CW Script setOwnerHjaalmarch() finished.")	
	
EndFunction

Function setOwnerWhiterun(int FactionToOwn, bool DiplomaticVictory = false)
	log("CWScript", "CW Script setOwnerWhiterun() started." + "FactionToOwn: " + FactionToOwn + ", DiplomaticVictory: " + DiplomaticVictory)

	if DiplomaticVictory
		WhiterunHoldLocation.SetKeywordData(CWDiplomaticVictory, 1)
		ClearHoldCrimeGold(WhiterunHoldLocation)
	EndIf
	
	if FactionToOwn != iCurrentOwner
		ownerWhiterun = FactionToOwn
		WhiterunHoldLocation.SetKeywordData(CWOwner, FactionToOwn)
	EndIf
	
	setCountHoldProperties()

	setOwner(FortGreymoorLocation, FactionToOwn, MilitaryCampWhiterunImperialLocation, MilitaryCampWhiterunSonsLocation)
	setOwner(WhiterunLocation, FactionToOwn, BattleBornFarmLocation, ChillfurrowFarmLocation, PelagiaFarmLocation, RoriksteadLocation, RiverwoodLocation)

	log("CWScript", "CW Script setOwnerWhiterun() finished.")
	
EndFunction

Function setOwnerFalkreath(int FactionToOwn, bool DiplomaticVictory = false)
	log("CWScript", "CW Script setOwnerFalkreath() started." + "FactionToOwn: " + FactionToOwn + ", DiplomaticVictory: " + DiplomaticVictory)
	
	if DiplomaticVictory
		FalkreathHoldLocation.SetKeywordData(CWDiplomaticVictory, 1)
		ClearHoldCrimeGold(FalkreathHoldLocation)
	EndIf
	
	if FactionToOwn != iCurrentOwner
		ownerFalkreath = FactionToOwn
		FalkreathHoldLocation.SetKeywordData(CWOwner, FactionToOwn)
	EndIf
	
	setCountHoldProperties()

	setOwner(FortNeugradLocation, FactionToOwn, MilitaryCampFalkreathImperialLocation, MilitaryCampFalkreathSonsLocation, FalkreathLocation, HelgenLocation, HalfmoonMillLocation)
	
	log("CWScript", "CW Script setOwnerFalkreath() finished.")
		
EndFunction

Function setOwnerPale(int FactionToOwn, bool DiplomaticVictory = false)
	log("CWScript", "CW Script setOwnerPale() started." + "FactionToOwn: " + FactionToOwn + ", DiplomaticVictory: " + DiplomaticVictory)
	
	if DiplomaticVictory
		PaleHoldLocation.SetKeywordData(CWDiplomaticVictory, 1)
		ClearHoldCrimeGold(PaleHoldLocation)
	EndIf
	
	if FactionToOwn != iCurrentOwner
		ownerPale = FactionToOwn
		PaleHoldLocation.SetKeywordData(CWOwner, FactionToOwn)
	EndIf
	
	setCountHoldProperties()

	setOwner(FortDunstadLocation, FactionToOwn, MilitaryCampPaleImperialLocation, MilitaryCampPaleSonsLocation, DawnstarLocation, AngasMillLocation, LoreiusFarmLocation)

	log("CWScript", "CW Script setOwnerPale() finished.")
	
EndFunction

Function setOwnerWinterhold(int FactionToOwn, bool DiplomaticVictory = false)
	log("CWScript", "CW Script setOwnerWinterhold() started." + "FactionToOwn: " + FactionToOwn + ", DiplomaticVictory: " + DiplomaticVictory)
	
	if DiplomaticVictory
		WinterholdHoldLocation.SetKeywordData(CWDiplomaticVictory, 1)
		ClearHoldCrimeGold(WinterholdHoldLocation)
	EndIf
	
	if FactionToOwn != iCurrentOwner
		ownerWinterhold = FactionToOwn
		WinterholdHoldLocation.SetKeywordData(CWOwner, FactionToOwn)
	EndIf
	
	setCountHoldProperties()

	setOwner(FortKastavLocation, FactionToOwn, MilitaryCampWinterholdImperialLocation, MilitaryCampWinterholdSonsLocation, WinterholdLocation, WhistlingMineLocation)
	
	log("CWScript", "CW Script setOwnerWinterhold() finished.")
	
EndFunction

Function setOwnerEastmarch(int FactionToOwn, bool DiplomaticVictory = false)
	log("CWScript", "CW Script setOwnerEastmarch() started." + "FactionToOwn: " + FactionToOwn + ", DiplomaticVictory: " + DiplomaticVictory)

	if DiplomaticVictory
		EastmarchHoldLocation.SetKeywordData(CWDiplomaticVictory, 1)
		ClearHoldCrimeGold(EastmarchHoldLocation)
	EndIf
	
	if FactionToOwn != iCurrentOwner
		ownerEastmarch = FactionToOwn
		EastmarchHoldLocation.SetKeywordData(CWOwner, FactionToOwn)
	EndIf
	
	setCountHoldProperties()

	setOwner(FortAmolLocation, FactionToOwn, MilitaryCampEastmarchImperialLocation)
	setOwner(WindhelmLocation, FactionToOwn, BrandyMugFarmLocation, HlaaluFarmLocation, HollyfrostFarmLocation, KynesgroveLocation, DarkwaterCrossingLocation, MixwaterMillLocation)
	
	log("CWScript", "CW Script setOwnerEastmarch() finished.")
	
	EndFunction

Function setOwnerRift(int FactionToOwn, bool DiplomaticVictory = false)
	log("CWScript", "CW Script setOwnerRift() started." + "FactionToOwn: " + FactionToOwn + ", DiplomaticVictory: " + DiplomaticVictory)

	if DiplomaticVictory
		RiftHoldLocation.SetKeywordData(CWDiplomaticVictory, 1)
		ClearHoldCrimeGold(RiftHoldLocation)
	EndIf
	
	if FactionToOwn != iCurrentOwner
		ownerRift = FactionToOwn
		RiftHoldLocation.SetKeywordData(CWOwner, FactionToOwn)
	EndIf
	
	setCountHoldProperties()
	
	setOwner(FortGreenwallLocation, FactionToOwn, MilitaryCampRiftImperialLocation, MilitaryCampRiftSonsLocation)
	setOwner(RiftenLocation, FactionToOwn, SnowShodFarmLocation, MerryfairFarmLocation, IvarsteadLocation, ShorsStoneLocation, HeartwoodMillLocation, SarethiFarmLocation)
	
	;Reminder: -- GoldenGlowFarm is NOT a normal location. It's quest specific area spawning it's own guards, and should not be part of the Civil War.
		
	log("CWScript", "CW Script setOwnerRift() finished.")
	
EndFunction


Function CreateMissions(Location HoldLocation, ObjectReference CurrentFieldCO, bool ForceFinalSiege = False, ObjectReference CampaignStartMarker = None)
	
	if WarIsActive == -1
		log("CWScript", "CreateMissions(" + HoldLocation + ", " + CurrentFieldCO + ") WarIsActive != 1, so we are NOT creating story events", 1, 1, true)
	
		return
	
	EndIf
	
	log("CWScript", "CreateMissions(" + HoldLocation + ", " + CurrentFieldCO + ") creating story events.")
	
	int HoldID = GetHoldID(HoldLocation) 
	GlobalVariable myCWObjGlobal = GetCWObjGlobal(HoldID)
	

;	;*** THIS IS A HACK FOR NEW PARADIGM TO FIT BACKWARDS COMPATIBLE WITH THE OLDER SYSTEM. RATHER THAN DOING RANDOM MISSIONS UNTIL THE READINESS REACHES 99%, WE ARE SIMPLY COUNTING THE NUMBER OF MISSIONS
;	if HoldLocation == FalkreathHoldLocation && CWCountMissionsDone.GetValue() == 1
;		myCWObjGlobal.SetValue(99) 
;	
;	elseif HoldLocation == ReachHoldLocation && CWCountMissionsDone.GetValue() == 3
;		myCWObjGlobal.SetValue(99) 
;
;	elseif HoldLocation == HjaalmarchHoldLocation && CWCountMissionsDone.GetValue() == 5
;		myCWObjGlobal.SetValue(99) 
;
;	elseif HoldLocation == HaafingarHoldLocation && CWCountMissionsDone.GetValue() == 6
;		myCWObjGlobal.SetValue(99) 
;	
;	elseif HoldLocation == PaleHoldLocation && CWCountMissionsDone.GetValue() == 2
;		myCWObjGlobal.SetValue(99) 
;
;	elseif HoldLocation == RiftHoldLocation && CWCountMissionsDone.GetValue() == 4
;		myCWObjGlobal.SetValue(99) 		
;
;	elseif HoldLocation == WinterholdHoldLocation && CWCountMissionsDone.GetValue() == 5
;		myCWObjGlobal.SetValue(99) 		
;
;	elseif HoldLocation == EastmarchHoldLocation && CWCountMissionsDone.GetValue() == 6
;		myCWObjGlobal.SetValue(99) 	
;		
;		
;	Else
;		myCWObjGlobal.SetValue(0)
;	
;	EndIf
;	
;	;***


	;*** THIS IS A HACK FOR NEW PARADIGM TO FIT BACKWARDS COMPATIBLE WITH THE OLDER SYSTEM. 
	if HoldLocation == HaafingarHoldLocation && HaafingarFortBattleComplete ;set in CWFortSiegeFort stage 9000
		log("CWScript", "CreateMissions() HaafingarHoldLocation and HaafingarFortBattleComplete, setting CWObjHaafingar to 99")	
		myCWObjGlobal.SetValue(99)	
		
	elseif HoldLocation == EastmarchHoldLocation && EastmarchFortBattleComplete ;set in CWFortSiegeFort stage 9000
		log("CWScript", "CreateMissions() EastmarchHoldLocation and EastmarchFortBattleComplete, setting CWObjEastmarch to 99")	
		myCWObjGlobal.SetValue(99) 
		
	else
		log("CWScript", "CreateMissions() Not a final hold, or not ready for final battle, setting CWObjxxx to 0")	
		myCWObjGlobal.SetValue(0)
		
	endif
	;***
	
	
	if myCWObjGlobal.GetValue() >= 99 || ForceFinalSiege == true
		log("CWScript", "CreateMissions() myCWObjGlobal >= 100, will start resolution mission, checking to see if the capital is a city")	
		
		Location Capital = GetCapitalLocationForHold(HoldLocation)
		
		if Capital.HasKeyword(LocTypeCity)
			
			;ITS POSSIBLE YOU CAN TRIGGER "DEFENSE" SIEGES IF THE CWOBJ IS 99 (which for ease of implementation Haagingar and Eastmarch are set to)
			;WE DON'T WANT THAT TO HAPPEN THUS THIS CHECK:
			if (Capital == SolitudeLocation && PlayerAllegiance == iImperials) || (Capital == WindhelmLocation && PlayerAllegiance == iSons)
				log("CWScript", "CreateMissions() Capital is final hold capital, owned by player's faction, not generating defense siege:" + Capital + ", playerAllegiance =" + PlayerAllegiance, 1)
		
			Else 
				log("CWScript", "CreateMissions() Capital is a city, will start CWSiege quest")
				CWSiegeStart.SendStoryEvent(Capital, CurrentFieldCO)
		
			EndIf
			
			
		Else
			if HoldLocation.GetKeywordData(CWOwner) == PlayerAllegiance
				log("CWScript", " WARNING: CreateMissions() Capital is not a city AND player's faction owns the hold, not implemented fully", 2, true, true)
				;CWFortSiegeMinorCapitalStart.SendStoryEvent(Capital, CurrentFieldCO, CurrentFieldCO) 
				
			Else
				log("CWScript", "CreateMissions() Capital is not a city, player's faction does not own the hold, will start a CWFortSiege quest using CWFortSiegeMinorCapitalStart keyword")		
				
				;safety check, in case you just finished a capital siege, and before it finished shutting down, you get another one - highly unlikely, put I can envision happening
				int waitingFor
				
				
				While CWFortSiegeCapital.IsStopped() == False
					waitingFor += 1
					utility.wait(1)
				
					Log("CWScript", self + "CreateMissions(" +HoldLocation + ") WAITING for CWFortSiegeCapital.IsStopped() == false. Have been waiting for:" + waitingFor, 1, true, true)
					
					;this is important enough to make sure even if we aren't explicitly testing in Civil War debug mode we get a message about it
; 					debug.trace(self + "CreateMissions(" + HoldLocation + ") WAITING for CWFortSiegeCapital.IsStopped() == false. Have been waiting for:" + waitingFor, 1)
					
					
					;!!!NEED A CHECK HERE TO MAKE SURE THAT THE CWFortSiegeCapital ISN'T FILLED ALREADY WITH THIS Capital...
					if CWFortSiegeCapitalFort.GetLocation() != Capital
						log("CWScript", "CreateMissions(" + HoldLocation + ") sees the Capital " + Capital + " is already in CWFortSiegeCapital Fort Aliases, BAILING OUT of CreateMissions().", 1 )
						return
					EndIf
					
					
				EndWhile
				
				log("CWScript", "CreateMissions() Calling CWFortSiegeMinorCapitalStart.SendStoryEvent(" + Capital + ", " + CurrentFieldCO + ", " + CampaignStartMarker + ")")
				CWFortSiegeMinorCapitalStart.SendStoryEvent(Capital, CurrentFieldCO, CampaignStartMarker) 
				
			EndIf
				
		endif
		
	Else
		log("CWScript", "CreateMissions() myCWObjGlobal < 100, will start normal missions")	
	
		CWMissionStart.SendStoryEvent(HoldLocation, CurrentFieldCO, CampaignStartMarker, aiValue1 = 1)
	
	EndIf
	

	log("CWScript", "CreateMissions(" + HoldLocation + ", " + CurrentFieldCO + "," + CampaignStartMarker + ") done creating story events.")

EndFunction

function SetFieldCOAlias(ObjectReference RefToForceIntoFieldCOAlias)
		log("CWScript", "SetFieldCOAlias(" + RefToForceIntoFieldCOAlias + ")")

		FieldCO.ForceRefTo(RefToForceIntoFieldCOAlias)
EndFunction

function GiveMissionReward()
	log("CWScript", "GiveMissionReward()")
	Game.GetPlayer().AddItem(CWMissionReward)

EndFunction


function setPlayerFactionRank(int RankToSetTo)
	log("CWScript", "setPlayerFactionRank([" + RankToSetTo + "]) and adding reward.")
	
	PlayerRank = RankToSetTo
	
	Actor PlayerRef = Game.GetPlayer()
	
	if PlayerAllegiance == iImperials
	
		if RankToSetTo == 1
			Game.GetPlayer().AddItem(CWRank1RewardImperial)
		Elseif RankToSetTo == 2
			Game.GetPlayer().AddItem(CWRank2RewardImperial)
		ElseIf RankToSetTo == 3
			Game.GetPlayer().AddItem(CWRank3RewardImperial)
		elseif RankToSetTo == 4
			Game.GetPlayer().AddItem(CWRank4RewardImperial)
		Else
			log("CWScript", "setPlayerFactionRank() expected RankToSetTo to be 1,2,3 or 4. Instead got:" + RankToSetTo, 2, true)
		EndIf
		
	Elseif PlayerAllegiance == iSons
		
		if RankToSetTo == 1
			Game.GetPlayer().AddItem(CWRank1RewardSons)
			UlfricRef.SetRelationshipRank(PlayerRef, 1)
		Elseif RankToSetTo == 2
			Game.GetPlayer().AddItem(CWRank2RewardSons)
			UlfricRef.SetRelationshipRank(PlayerRef, 2)
		ElseIf RankToSetTo == 3
			Game.GetPlayer().AddItem(CWRank3RewardSons)
		elseif RankToSetTo == 4
			Game.GetPlayer().AddItem(CWRank4RewardSons)
		Else
			log("CWScript", "setPlayerFactionRank() expected RankToSetTo to be 1,2,3 or 4. Instead got:" + RankToSetTo, 2, True)
		EndIf
	
	Else
	
		log("CWScript", "setPlayerFactionRank() expected PlayerAllegiance to be 1, or 2. Instead got:" + PlayerAllegiance, 2, True)
	
	EndIf
	
	
	
EndFunction

function RewardPlayerForReclaimingHold()
	if PlayerAllegiance == iImperials
		Game.GetPlayer().AddItem(CWRank2RewardImperial)
	Elseif PlayerAllegiance == iSons
		Game.GetPlayer().AddItem(CWRank2RewardSons)
	Else
		log("CWScript", "RewardPlayerForReclaimingHold() expected PlayerAllegiance to be 1, or 2. Instead got:" + PlayerAllegiance, 2, True)
	
	EndIf			
	
EndFunction

function SetSoldierAliasDialogueFactions(ReferenceAlias SoldierAlias, bool AddToWaitingToAttack = False, bool AddToWaitingToDefend = False)
{Adds the passed in Alias's actor to the appropriate CWDialogueSoldierWaitingToAttack/DefendFaction.}

	Actor SoldierActor = SoldierAlias.GetActorReference()
	
	log("CWScript", "SetSoldierAliasDialogueFactions() adding " + SoldierActor + " to faction CWDialogueSoldierFaction")
	
	;Always add to the soldier dialogue faction:
	SoldierActor.AddToFaction(CWDialogueSoldierFaction)
	
	if AddToWaitingToAttack
		log("CWScript", "SetSoldierAliasDialogueFactions() adding " + SoldierActor + " to faction CWDialogueSoldierWaitingToAttackFaction")
		SoldierActor.AddToFaction(CWDialogueSoldierWaitingToAttackFaction)
	EndIf
	
	if AddToWaitingToDefend
		log("CWScript", "SetSoldierAliasDialogueFactions() adding " + SoldierActor + " to faction CWDialogueSoldierWaitingToDefendFaction")
		SoldierActor.AddToFaction(CWDialogueSoldierWaitingToDefendFaction)
	EndIf


EndFunction

Function ContributeToSalaryPool()
	if PlayerRank == 0
		salary += (BaseSalary) as int
	elseif PlayerRank == 1
		salary += (BaseSalary * SalaryMultRank1) as int
	elseif PlayerRank == 2
		salary += (BaseSalary * SalaryMultRank2) as int
	elseif PlayerRank == 3
		salary += (BaseSalary * SalaryMultRank3) as int
	elseif PlayerRank >= 4
		salary += (BaseSalary * SalaryMultRank4) as int
	EndIf

EndFunction

function paySalary()
{Pay player a salary after campaign based on his rank}
	Game.GetPlayer().AddItem(Gold001, salary)
	salary = 0
EndFunction

Function donateSalary()
{player has donated his salary to the cause... right now this is just flavor, we may want it to contribute something to the attack delta, increase favor points, etc.}
	salary = 0
EndFunction

ObjectReference Function GetFactionHQMarkerForActor(Actor ActorToCheck)
{Returns the marker in the alias corresponding to the FactionHQ based on whether the actor is in CWImperialFaction or CWSonsFaction.}
;Used by CWEscapeCityEscapeDoorScript on EscapeDoor alias in CWEscapeCity Quest
	int ActorFaction = GetActorAllgeiance(ActorToCheck)
	
	ObjectReference FactionHQMarker
	
	if ActorFaction == iImperials
		FactionHQMarker = ImperialFactionHQMarker.GetReference()
	
	elseif ActorFaction == iSons
			FactionHQMarker = SonsFactionHQMarker.GetReference()
	Else
		log("CWScript",  " WARNING: GetFactionHQForActor() can't determine which faction this actor belongs to:"  + ActorToCheck, 2)
	EndIf

	log("CWScript",  "GetFactionHQForActor(" + ActorToCheck + ") returning " + FactionHQMarker)

	return FactionHQMarker
	
EndFunction


ObjectReference Function GetExiledMarkerForActor(Actor ActorToCheck)
{Returns the marker in the alias corresponding to the ExiledMarker based on whether the actor is in GovImperial or GovSons factions.}
;Used by CWEscapeCityEscapeDoorScript on EscapeDoor alias in CWEscapeCity Quest
;NOTE THIS DUPLICATES SOME FUNCTIONALITY ALSO FOUND IN CWGovernmentScript and CWGovernment quest.
	
	ObjectReference ExileMarker
	
	if ActorToCheck.IsInFaction(GovImperial)
		ExileMarker = ExiledImperialMarker.GetReference()
	
	elseif ActorToCheck.IsInFaction(GovSons)
		ExileMarker = ExiledSonsMarker.GetReference()
	Else
		log("CWScript",  " WARNING: GetExiledMarkerForActor() can't determine which faction this actor belongs to:"  + ActorToCheck, 2)
	EndIf

	log("CWScript",  "GetExiledMarkerForActor(" + ActorToCheck + ") returning " + ExileMarker)

	return ExileMarker
	
EndFunction

function StartCWCitizensFlee(Location LocationOfBattle)
	log("CWScript",  "StartCWCitizensFlee(" + LocationOfBattle + ")")

	int waitTime = 0
	bool bailOut = False
	
	if CWCitizensFlee.IsStopped() == False
		log("CWScript",  " WARNING: StartCWCitizensFlee() the CWCitizensFlee quest is currently running, stopping it and starting a new one."  , 2, true, true)

		CWCitizensFlee.Stop()
		
		while CWCitizensFlee.IsStopped() == false && bailOut == False
			log("CWScript",  " WARNING: StartCWCitizensFlee() the CWCitizensFlee quest is currently running, waiting for it to stop completely. Have been waiting for " +waitTime , 1)
			utility.wait(1)
			
			waitTime +=1
			
			if waitTime > 30
			
				log("CWScript",  " WARNING: StartCWCitizensFlee() the CWCitizensFlee quest is currently running, have been waiting too long. Bailing out." , 1)
				bailOut = True
				
			EndIf
		
		EndWhile

	EndIf

	CWCitizensFleeStart.SendStoryEvent(LocationOfBattle)
	
	
EndFunction

function StopCWCitizensFlee()
	log("CWScript",  "StopCWCitizensFlee() calling Stop() on CWCitizensFlee quest")
	CWCitizensFlee.Stop()
	
EndFunction

function Persuade(Actor Target)
{Calls the favor script function}
	log("CWScript",  "Persuade(" + Target + ") calling Persuade() on DialogueFavorGeneric quest's FavorDialogueScript")
	DialogueFavorGenericS.Persuade(Target)

EndFunction

function Bribe(Actor Target)
{Calls the favor script function}
	log("CWScript",  "Bribe(" + Target + ") calling Bribe() on DialogueFavorGeneric quest's FavorDialogueScript")
	DialogueFavorGenericS.Bribe(Target)

EndFunction

function Intimidate(Actor Target)
{Calls the favor script function}
	log("CWScript",  "Intimidate(" + Target + ") calling Intimidate() on DialogueFavorGeneric quest's FavorDialogueScript")
	DialogueFavorGenericS.Intimidate(Target)

EndFunction

function Brawl(Actor Target)
{Calls the favor script function}
	log("CWScript",  "Brawl(" + Target + ") calling Brawl() on DialogueFavorGeneric quest's FavorDialogueScript")
	DialogueFavorGenericS.Brawl(Target)

EndFunction

function GiveGift(Actor Target)
{Calls the favor script function}
	log("CWScript",  "GiveGift(" + Target + ") calling GiveGift() on DialogueFavorGeneric quest's FavorDialogueScript")
	DialogueFavorGenericS.GiveGift(Target)

EndFunction

function ToggleOffComplexWIInteractions(LocationAlias LocationAliasToToggle)
	Log("CWMissionScript", self + "ToggleOffComplexWIInteractions(" + LocationAliasToToggle + ") calling function on WIFunctionScript")
	WIs.DisallowComplexInteractions(LocationAliasToToggle.GetLocation())

EndFunction

function ToggleOnComplexWIInteractions(LocationAlias LocationAliasToToggle)
	Log("CWMissionScript", self + "ToggleOnComplexWIInteractions(" + LocationAliasToToggle + ") calling function on WIFunctionScript")
	WIs.AllowComplexInteractions(LocationAliasToToggle.GetLocation())

EndFunction

function ToggleOffWIDragons(LocationAlias LocationAliasToToggle)
	Log("CWMissionScript", self + "ToggleOffWIDragons(" + LocationAliasToToggle + ") calling function on WIFunctionScript")
	WIs.DisallowDragons(LocationAliasToToggle.GetLocation())

EndFunction

function ToggleOnWIDragons(LocationAlias LocationAliasToToggle)
	Log("CWMissionScript", self + "ToggleOnWIDragons(" + LocationAliasToToggle + ") calling function on WIFunctionScript")
	WIs.AllowDragons(LocationAliasToToggle.GetLocation())

EndFunction









;************************************************************************************************************
;*********************************** OBSOLETE FUNCTIONS *****************************************************
;************************************************************************************************************
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***
;***



 Function OutputXMLRowOpenTag(string RowName)
	log("CWScript",  "CW XML: <" + RowName + ">" )
EndFunction

 Function OutputXMLRowCloseTag(string RowName)
	log("CWScript",   "CW XML: </" + RowName + ">" )
EndFunction

 Function OutputXMLField(string FieldName, string fieldValue)
	log("CWScript",   "CW XML: <" + FieldName + ">" + fieldValue + "</" + FieldName + ">" )
EndFunction

Function OutputCampaignStatsXMLRow()
		;NOTE: You'll need to a) filter the warnings for "CW xml:"
		;b) remove "[Timestamp] CW XML:" from each line,
		;c) add <Game> </Game> tag at head and foot of document
		
		
		OutputXMLRowOpenTag("CampaignStats")

		outputCampaignStatsXMLRowA()
		outputCampaignStatsXMLRowB()

		OutputXMLRowCloseTag("CampaignStats")

EndFunction

;<outputCampaignStatsXMLRow Sub-functions> to get around large function compiler bug. These should go back inside the maine outputCampaignStatsXMLRow function when that bug is fixed
Function outputCampaignStatsXMLRowA()
		OutputXMLField("countCampaigns", countCampaigns as string)

		OutputXMLField("ContestedHold", HoldName(ContestedHold)) 
		OutputXMLField("Attacker", FactionName(Attacker)) 
		OutputXMLField("Defender", FactionName(Defender)) 

		OutputXMLField("OwnerHaafingar", FactionName(OwnerHaafingar))
		OutputXMLField("OwnerReach", FactionName(OwnerReach))
		OutputXMLField("OwnerHjaalmarch", FactionName(OwnerHjaalmarch))
		OutputXMLField("OwnerWhiterun", FactionName(OwnerWhiterun))
		OutputXMLField("OwnerFalkreath", FactionName(OwnerFalkreath))
		OutputXMLField("OwnerPale", FactionName(OwnerPale))
		OutputXMLField("OwnerWinterhold", FactionName(OwnerWinterhold))
		OutputXMLField("OwnerEastmarch", FactionName(OwnerEastmarch))
		OutputXMLField("OwnerRift", FactionName(OwnerRift))
EndFunction


Function outputCampaignStatsXMLRowB()
		OutputXMLField("countWinImperials", countWinImperials as string)
		OutputXMLField("countWinSons", countWinSons as string)
		OutputXMLField("countWinReachImperials", countWinReachImperials as string)
		OutputXMLField("countWinReachSons", countWinReachSons as string)
		OutputXMLField("countWinHjaalmarchImperials", countWinHjaalmarchImperials as string)
		OutputXMLField("countWinHjaalmarchSons", countWinHjaalmarchSons as string)
		OutputXMLField("countWinWhiterunImperials", countWinWhiterunImperials as string)
		OutputXMLField("countWinWhiterunSons", countWinWhiterunSons as string)
		OutputXMLField("countWinFalkreathImperials", countWinFalkreathImperials as string)
		OutputXMLField("countWinFalkreathSons", countWinFalkreathSons as string)
		OutputXMLField("countWinPaleImperials", countWinPaleImperials as string)
		OutputXMLField("countWinPaleSons", countWinPaleSons as string)
		OutputXMLField("countWinWinterholdImperials", countWinWinterholdImperials as string)
		OutputXMLField("countWinWinterholdSons", countWinWinterholdSons as string)
		OutputXMLField("countWinRiftImperials", countWinRiftImperials as string)
		OutputXMLField("countWinRiftSons", countWinRiftSons as string)
EndFunction
;</outputCampaignStatsXMLRow Sub-functions>

function resetStrengthPoints()
{Clears the strHOLDImperial/Sons properties.}
	strHaafingarImperial = 0
	strHaafingarSons = 0
	strReachImperial = 0
	strReachSons = 0
	strHjaalmarchImperial = 0
	strHjaalmarchSons = 0
	strWhiterunImperial = 0
	strWhiterunSons = 0
	strFalkreathImperial = 0
	strFalkreathSons = 0
	strPaleImperial = 0		
	strPaleSons = 0
	strWinterholdImperial = 0
	strWinterholdSons = 0
	strEastmarchImperial = 0
	strEastmarchSons = 0
	strRiftImperial = 0
	strRiftSons = 0

	EndFunction

 function setStrengthPoints()
{Sets the strXXXHoldImperials strXXXHoldSons values for all the holds for each faction.}

	;clear properties
	resetStrengthPoints()

	;these next functions are broken into seperate functions rather than living directly in this function to get around a bug running large functions in game. I probably will leave it this way even after the bug is fixed.
	setStrengthPointsHaafingar()
	setStrengthPointsReach()
	setStrengthPointsHjaalmarch()
	setStrengthPointsWhiterun()
	setStrengthPointsFalkreath()
	setStrengthPointsPale()
	setStrengthPointsWinterhold()
	setStrengthPointsEastmarch()
	setStrengthPointsRift()

EndFunction

;<SetStrengthPoints() SUB-FUNCTIONS>
;Note for self:
;These functions setSrengthPointsHOLDxxx() functions exist solely to get around a bug dealing with a long function. They all used to live in the setStrengthPoints() function. Once that bug is dealt with, I could copy these back into that function. But that won't serve much purpose.
;If I had an array, I could set up arrays for adjacent hold data, and then abstract these into a single function. But I'm not sure when/if we'll get arrays in the scripting language
function setStrengthPointsHaafingar()
	;Haafingar -- adj holds = Reach, Hjaalmarch
	if OwnerHaafingar == iImperials
	  strReachImperial = strReachImperial + StrValueHaafingar
	  strHjaalmarchImperial = strHjaalmarchImperial + StrValueHaafingar
	else	;owner is iSons
	   strReachSons = strReachSons + StrValueHaafingar
	   strHjaalmarchSons = strHjaalmarchSons + StrValueHaafingar
	endif
EndFunction

function setStrengthPointsReach()
	;Reach -- adj holds = Haafingar, Hjaalmarch, Whiterun, Falkreath
	if OwnerReach == iImperials
	  strHaafingarImperial = strHaafingarImperial + StrValueReach
	  strHjaalmarchImperial = strHjaalmarchImperial + StrValueReach
	  strWhiterunImperial = strWhiterunImperial + StrValueReach
	  strFalkreathImperial = strFalkreathImperial + StrValueReach
	else	;owner is iSons
	   strHaafingarSons = strHaafingarSons + StrValueReach
	   strHjaalmarchSons = strHjaalmarchSons + StrValueReach
	   strWhiterunSons = strWhiterunSons + StrValueReach
	   strFalkreathSons = strFalkreathSons + StrValueReach
	endif
EndFunction

function setStrengthPointsHjaalmarch()
	;Hjaalmarch -- adj holds = Haafingar, Reach, Whiterun, Pale
	if OwnerHjaalmarch == iImperials
	  strHaafingarImperial = strHaafingarImperial + StrValueHjaalmarch
	  strReachImperial = strReachImperial + StrValueHjaalmarch
	  strWhiterunImperial = strWhiterunImperial + StrValueHjaalmarch
	  strPaleImperial = strPaleImperial + StrValueHjaalmarch
	else	;owner is iSons
	   strHaafingarSons = strHaafingarSons + StrValueHjaalmarch
	   strReachSons = strReachSons + StrValueHjaalmarch
	   strWhiterunSons = strWhiterunSons + StrValueHjaalmarch
	   strPaleSons = strPaleSons + StrValueHjaalmarch
	endif
endFunction

function setStrengthPointsWhiterun()
	;Whiterun -- adj holds = Reach, Hjaalmarch, Falkreath, Pale, Eastmarch, Rift
	if OwnerWhiterun== iImperials
	  strReachImperial = strReachImperial + StrValueWhiterun
	  strHjaalmarchImperial = strHjaalmarchImperial + StrValueWhiterun
	  strFalkreathImperial = strFalkreathImperial + StrValueWhiterun
	  strPaleImperial = strPaleImperial + StrValueWhiterun
	  strEastmarchImperial = strEastmarchImperial + StrValueWhiterun
	  strRiftImperial = strRiftImperial + StrValueWhiterun
	else	;owner is iSons
	   strReachSons = strReachSons + StrValueWhiterun
	   strHjaalmarchSons = strHjaalmarchSons + StrValueWhiterun
	   strFalkreathSons = strFalkreathSons + StrValueWhiterun
	   strPaleSons = strPaleSons + StrValueWhiterun
	   strEastmarchSons = strEastmarchSons + StrValueWhiterun
	   strRiftSons = strRiftSons + StrValueWhiterun
	endif
EndFunction

function setStrengthPointsFalkreath()
	;Falkreath -- adj holds = Reach, Whiterun, Rift
	if OwnerFalkreath== iImperials
	  strReachImperial = strReachImperial + StrValueFalkreath
	  strWhiterunImperial = strWhiterunImperial + StrValueFalkreath
	  strRiftImperial = strRiftImperial + StrValueFalkreath
	else	;owner is iSons
	   strReachSons = strReachSons + StrValueFalkreath
	   strWhiterunSons = strWhiterunSons + StrValueFalkreath
	   strRiftSons = strRiftSons + StrValueFalkreath
	endif
EndFunction

function setStrengthPointsPale()
	;Pale -- adj holds = Hjaalmarch, Whiterun, Winterhold, Eastmarch
	if OwnerPale == iImperials
	  strHjaalmarchImperial = strHjaalmarchImperial + StrValuePale
	  strWhiterunImperial = strWhiterunImperial + StrValuePale
	  strWinterholdImperial = strWinterholdImperial + StrValuePale
	  strEastmarchImperial = strEastmarchImperial + StrValuePale
	else	;owner is iSons
	   strHjaalmarchSons = strHjaalmarchSons + StrValuePale
	   strWhiterunSons = strWhiterunSons + StrValuePale
	   strWinterholdSons = strWinterholdSons + StrValuePale
	   strEastmarchSons = strEastmarchSons + StrValuePale
	endif
EndFunction

function setStrengthPointsWinterhold()
	;Winterhold -- adj holds = Pale, Eastmarch
	if OwnerWinterhold == iImperials
	  strPaleImperial = strPaleImperial + StrValueWinterhold
	  strEastmarchImperial = strEastmarchImperial + StrValueWinterhold
	else	;owner is iSons
	   strPaleSons = strPaleSons + StrValueWinterhold
	   strEastmarchSons = strEastmarchSons + StrValueWinterhold
	endif
EndFunction
	
function setStrengthPointsEastmarch()
	;Eastmarch -- adj holds = Winterhold, Pale, Whiterun, Rift
	if OwnerEastmarch == iImperials
	  strWinterholdImperial = strWinterholdImperial + StrValueEastmarch
	  strPaleImperial = strPaleImperial + StrValueEastmarch
	  strWhiterunImperial = strWhiterunImperial + StrValueEastmarch
	  strRiftImperial = strRiftImperial + StrValueEastmarch
	else	;owner is iSons
	   strWinterholdSons = strWinterholdSons + StrValueEastmarch
	   strPaleSons = strPaleSons + StrValueEastmarch
	   strWhiterunSons = strWhiterunSons + StrValueEastmarch
	   strRiftSons = strRiftSons + StrValueEastmarch
	endif	
EndFunction

function setStrengthPointsRift()
	;Rift -- adj holds = Whiterun, Falkreath, Eastmarch
	if OwnerRift == iImperials
	  strWhiterunImperial = strWhiterunImperial + StrValueRift
	  strFalkreathImperial = strFalkreathImperial + StrValueRift
	  strEastmarchImperial = strEastmarchImperial + StrValueRift
	else	;owner is iSons
	   strWhiterunSons = strWhiterunSons + StrValueRift
	   strFalkreathSons = strFalkreathSons + StrValueRift
	   strEastmarchSons = strEastmarchSons + StrValueRift
	endif
EndFunction
;</SetStrengthPoints() SUB-FUNCTIONS>

function StartNewCampaign()
{Sets Attacker, Defender, Contested Hold, and strHOLDXXX properties.}
	
	log("CWScript", "StartNewCampagin() will set CWScript properties for new campaign.")

	SetStrengthPoints()
	attacker = ChooseAttackingFaction(CWDebugForceAttacker.Value as int)
	if attacker == iImperials
		defender = iSons
	Else
		defender = iImperials
	EndIf
	
	;set the CWAttacker and CWDefender globals for use in condition functions where you want to check against their value
	CWAttacker.value = attacker
	CWDefender.value = defender
	
	contestedHold = ChooseHoldToAttack(attacker, CWDebugForceHold.value as int)
	CWContestedHold.value = contestedHold
	setAttackDelta()
	purchaseDelta = AttackDelta
	countCampaigns += 1
	
	log("CWScript", "StartNewCampagin() finished setting CWScript properties for new campaign.")
	log("CWScript", "StartNewCampagin() Attacker=" + Attacker + ", Defender=" + Defender + ", ContestedHold=" + ContestedHold + ", AttackDelta=" +AttackDelta)

	if DebugDBTraces == 1
		outputCampaignStatsXMLRow()
	endif
	
	;Start the campaign quest
	if debugForceOffscreenResult == 0			
		startCampaignQuest(ContestedHold)
	
	Else	;we are in forced offscreen mode
		resolveOffscreen()
		
	EndIf
	
EndFunction




int Function GetStrengthPoints(int FactionToCheck, int HoldToCheck)
{Returns an int specifying the strength points of the FactionToCheck (1 = Imperial, 2 = Sons) in HoldToCheck(1-9), -1 = FAIL}
	int strImperial		;the strength points of the faction in the hold
	int strSons			;the strength points of the faction in the hold
	
	;get each factions strength points for the hold in question
	if HoldToCheck == iHaafingar ;1
		strImperial = strHaafingarImperial
		strSons = strHaafingarSons
	elseif HoldToCheck == 	iReach ; 2
		strImperial = strReachImperial
		strSons = strReachSons
	elseif HoldToCheck == 	iHjaalmarch ;3
		strImperial = strHjaalmarchImperial
		strSons = strHjaalmarchSons
	elseif HoldToCheck == 	iWhiterun ;4
		strImperial = strWhiterunImperial
		strSons = strWhiterunSons
	elseif HoldToCheck == 	iFalkreath ;5
		strImperial = strFalkreathImperial
		strSons = strFalkreathSons
	elseif HoldToCheck == 	iPale ;6
		strImperial = strPaleImperial
		strSons = strPaleSons
	elseif HoldToCheck == 	iWinterhold ;7
		strImperial = strWinterholdImperial
		strSons = strWinterholdSons
	elseif HoldToCheck == 	iEastmarch ;8
		strImperial = strEastmarchImperial
		strSons = strEastmarchSons
	elseif HoldToCheck == 	iRift ;9
		strImperial = strRiftImperial
		strSons = strRiftSons
	else
		log("CWScript", "GetStrengthPoints() HoldToCheck parametered unrecognized. Expected an int 1-9: got " + HoldToCheck)
		return -1
	EndIf
	
	;return the strength points of the hold for the faction in question
	If FactionToCheck == iImperials
		return strImperial
	ElseIf FactionToCheck == iSons
		return strSons
	Else
		log("CWScript", "GetStrengthPoints() FactionToCheck parameter unrecognized. Expected 1 or 2: got " + FactionToCheck)
		return -1
	EndIf

EndFunction


int Function ChooseAttackingFaction(int FactionToForce = 0)
{Returns an int representing a random faction to be the attacker in the next campaign, unless rules dictate the attacker should be forced to a particular faction.}

	int ChosenFaction = FactionToForce

	previousAttacker = attacker		;set the previous attacker
	
	log("CWScript", "ChooseAttackingFaction() FactionToForce =" +FactionToForce)
	
	;if either factions owns all the contestable holds, force the attacker to the other faction
	if FactionOwnsAll(iImperials)
		ChosenFaction = iSons
		log("CWScript", "Imperials own all, forcing attacker to be Sons")

	ElseIf FactionOwnsAll(iSons)
		ChosenFaction = iImperials
		log("CWScript", "Sons own all, forcing attacker to be Imperials")

	;If either side has attacked more than the allowable # of attacks, force the other side
	ElseIf ConsecutiveAttacks > CWMaxConsecutiveAttacks.value	;this is a global so we can more easily tweak this setting as we play
		if PreviousAttacker == iImperials
			ChosenFaction = iSons
		Else ;Previous attacker was iSons
			ChosenFaction = iImperials
		EndIf
		
		ConsecutiveAttacks = 0
		log("CWScript", "ConsecutiveAttacks > CWMaxConsecutiveAttacks.value, forcing attacker to be " + FactionName(ChosenFaction))
		
	ElseIf ChosenFaction == 0		;we aren't forcing it
		ChosenFaction = utility.RandomInt(1,2)		;1 = Imperials, 2 = Sons
	EndIf

	if previousAttacker == ChosenFaction
		consecutiveAttacks += 1
	EndIf
	
	log("CWScript", "ChooseAttackingFaction() is returning  " + ChosenFaction + "(" + FactionName(ChosenFaction) + ")")
	return ChosenFaction
EndFunction
	

int Function ValidateHoldToAttack(int Hold, int HoldOwner, int AttackingFaction, int AttackerStengthPoints)
{Sub function for ChooseHoldToAttack, returns an int with the failure code, or 0 if there is no failure }
	;VERIFY this is a valid Hold to attack. Otherwise, FAILURE: 1 = impossible to attack this hold (Haafingar/Eastmarch), 2 = Attacker already owns, 3 = Attacker owns no adjacent holds
	;Check for non-contestable holds

	int failure = 0

	if (Hold == iHaafingar) || (Hold == iEastmarch) && CWDebugAllowCampaignsInFinalHolds.GetValue() == 0
		;FAIL
		failure = 1	
		log("CWScript", "ChooseHoldToAttack tried to attack Haafingar or Eastmarch.")
		
	elseif AttackingFaction == HoldOwner
		;FAIL
		failure = 2
		log("CWScript", "ChooseHoldToAttack tried to attack a hold already owned by the AttackingFaction.")
		
	elseif AttackerStengthPoints == 0
		;FAIL
		failure = 3
		log("CWScript", "ChooseHoldToAttack tried to attack a hold where attacking faction has no AttackPoints in hold (owns no adjacent holds).")
		
	Else
		;SUCCESS!!
		log("CWScript", "ChooseHoldToAttack picked a valid hold to attack (" + HoldName(Hold) +").")
		
	EndIf

	return failure


EndFunction
	
int Function ChooseHoldToAttack(int AttackingFaction, int HoldToForce = 0)
{Takes int AttackingFaction (1 = Imperials, 2 = Sons). It SETS various PROPERTIES and RETURNS an INT corresponding to the hold that should be attacked next. -1 == FAIL}
	;param int AttackingFaction		Which faction is attacking? 1 = Imperials, 2 = Sons
	;param int HoldToForce	 		Default = 0; sets Hold to this value
	
	bool FoundHold		;0 =  keep trying, 1 = found a hold that passed the validity check, return HoldToAttack
	int Hold				;1-9 = which hold to attack (if valid)
	int HoldOwner			;who owns the hold? 1 = Imperials, 2 = Sons
	int strImperials		;the strength points of the Imperials in the hold
	int strSons			;the strength points of the Sons in the hold
	int StrAtkr			;the strength points of the attacker
	int strDfdr			;the strength points of the defender
	
	int failure			;1 = impossible to attack this hold (Haafingar/Eastmarch), 2 = Attacker already owns, 3 = Attacker owns no adjacent holds
	
	
	int TriesLeftBeforeAllowingPreviousContestedHold = 5 	;try to pick something else, if nothing else is valid, go ahead and pick the same hold as last campaign, counts down multiple attempts before giving up - see "While FoundHold == 0" loop below
	
	;set the previousContestedHold -- note is redundant. It is set in FinishCampaign() but setting it again shouldn't hurt.
	previousContestedHold = contestedHold
	
	If HoldToForce > 0
		log("CWScript", "Running chooseHoldToAttack() with HoldToForce =" + HoldToForce + ". ")
		Hold = HoldToForce
	EndIf
			
	While FoundHold == 0
		
		;If we haven't rolled for a hold yet, roll a 9 sided die (for 9 holds to try)
		if Hold == 0
			Hold = utility.randomInt(1,9)
			
		EndIf
		
		log("CWScript", "ChooseHoldToAttack Attacking faction =" + AttackingFaction + "(" + FactionName(AttackingFaction)+ ")")
		
		log("CWScript", "ChooseHoldToAttack chose hold # " + Hold + "(" + HoldName(Hold) +")")
		
		HoldOwner = GetHoldOwner(Hold)

		log("CWScript", "ChooseHoldToAttack HoldOwner =" + HoldOwner + "(" +FactionName(HoldOwner) + ")")
		
		strImperials = GetStrengthPoints(iImperials, Hold)

		log("CWScript", "ChooseHoldToAttack strImperials =" + strImperials)
		
		strSons = GetStrengthPoints(iSons, Hold)

		log("CWScript", "ChooseHoldToAttack strSons =" + strSons)
		
		;Establish the attacker/defender strength points
		if AttackingFaction == iImperials
			strAtkr = strImperials
			strDfdr = strSons
			
		elseif AttackingFaction == iSons
			strAtkr = strSons
			strDfdr = strImperials
		
		Else
			log("CWScript", "ChooseHoldToAttack expecting 1 or 2 for AttackingFaction parameter. Got " + AttackingFaction + " this will break the civil war system.")
			debug.MessageBox("ChooseHoldToAttack expecting 1 or 2 for AttackingFaction parameter. Got " + AttackingFaction + " this will break the civil war system.")
			return -1
		EndIf
		
		;VERIFY this is a valid Hold to attack. Otherwise, FAILURE: 1 = impossible to attack this hold (Haafingar/Eastmarch), 2 = Attacker already owns, 3 = Attacker owns no adjacent holds
		failure = ValidateHoldToAttack(Hold, HoldOwner, AttackingFaction, strAtkr)

		if failure > 0 && !(failure == 3 && debugAllowNonAdjacentHolds == 1)	;if we have a failure that a debug variable isn't allowing
			FoundHold = 0
			Hold = 0			
			Failure = 0		

			log("CWScript", "ChooseHoldToAttack picked an invalid hold, re-rolling a new hold to try to attack.")
		
		elseif Hold == previousContestedHold && TriesLeftBeforeAllowingPreviousContestedHold > 0
			TriesLeftBeforeAllowingPreviousContestedHold -= 1
			FoundHold = 0
			Hold = 0	

			log("CWScript", "ChooseHoldToAttack picked the previously contested hold, re-rolling a new hold to try to attack. Tries left before allowing previous hold: " + TriesLeftBeforeAllowingPreviousContestedHold)
					
		else ;success

			if failure == 3 && debugAllowNonAdjacentHolds == 1
				log("CWScript", "ChooseHoldToAttack() Ignoring Adjacent Hold requirement and allowing the attack.", 1)
			endif
		
			;SET CWSCRIPT PROPERTIES
			ContestedHold = Hold
			OwnerContestedHold = HoldOwner
			strContestedHoldImperial = strImperials
			strContestedHoldSons = strSons
			strAttacker = strAtkr
			strDefender= strDfdr
			
			FoundHold = 1
			return hold
		endif

	EndWhile

	
EndFunction


Function SetAttackDelta()
{Sets the attack delta based on current strAttacker and strDefender}
	AttackDelta = strAttacker - strDefender

	log("CWScript", "AttackDelta (" + AttackDelta + " ) = StrAttack (" + StrAttacker + ") - StrDefender (" + StrDefender + ")")
	
	if Math.abs(AttackDelta) > MaxAttackDelta
		if AttackDelta > 0
			AttackDelta = MaxAttackDelta
		Else
			AttackDelta = -MaxAttackDelta
		endif
		
		log("CWScript", "|AttackDelta| is larger than MaxAttackDelta, constraining AttackDelta(" + AttackDelta + ") to MaxAttackDelta (" + MaxAttackDelta + ")")
	EndIf

EndFunction


Function startCampaignQuest(int Hold)
{Starts CWCampaign using CWCampaignStart.SendStoryEvent() with the corresponding Location of the ContestedHold}
	location CampaignLocation = GetLocationForHold(Hold)
	ObjectReference CampaignStartMarker = GetCampaignStartMarker(Hold)
	
	CWCampaignStart.SendStoryEvent(CampaignLocation,CampaignStartMarker)
	
	log("CWScript", "startCampaignQuest: CWCampainStart.SendStoryEvent(" + CampaignLocation + ", " +  CampaignStartMarker+ ")")


EndFunction

;OLD VERSION
;Function SetHoldOwner(int HoldToSet, int FactionToOwn)
;{Takes int HoldToSet and int FactionToOwn, and calls the appropriate setOwnerXXX(FactionToOwn) function}
;
;	if HoldToSet == iHaafingar ;1
;		setOwnerHaafingar(FactionToOwn)
;		
;	elseif HoldToSet == 	iReach ; 2
;		setOwnerReach(FactionToOwn)
;		
;	elseif HoldToSet == 	iHjaalmarch ;3
;		setOwnerHjaalmarch(FactionToOwn)
;		
;	elseif HoldToSet == 	iWhiterun ;4
;		setOwnerWhiterun(FactionToOwn)
;		
;	elseif HoldToSet == 	iFalkreath ;5
;		setOwnerFalkreath(FactionToOwn)
;		
;	elseif HoldToSet == 	iPale ;6
;		setOwnerPale(FactionToOwn)
;		
;	elseif HoldToSet == 	iWinterhold ;7
;		setOwnerWinterhold(FactionToOwn)
;		
;	elseif HoldToSet == 	iEastmarch ;8
;		setOwnerEastmarch(FactionToOwn)
;		
;	elseif HoldToSet == 	iRift ;9
;		setOwnerRift(FactionToOwn)
;		
;	else
;		log("CWScript", "SetHoldOwner(" + HoldToSet + ") parametered unrecognized. Expected an int 1-9 as HoldToCheck, got something else.")
;	EndIf
;
;EndFunction

function finishCampaign()
{Sets properties, and other campaign clean up duties... called by CWCampaign stage 255}

	;set properties appropriately
	CampaignRunning = 0 ;not running -- this used to happen in the CWCampaign shut down stage. It lives here so that we are sure the faction leader won't have dialogue talking about the campaign that is just finishing up
	
	CWCampaignS.completedMission = 0	;clear out so Field CO doesn't say anything about a completed mission from previous campaign
	CWCampaignS.failedMission = 0		;clear out so Field CO doesn't say anything about a failed mission from previous campaign
	
	(CWCampaign as CWCampaignScript).stopTutorialMission()	
	
	setContestedHoldWinType()
	setCountWins()
	previousContestedHold = contestedHold ;note this is also set in StartCampaign() but setting it again shouldn't hurt. It needs to go here so that Faction leader has something to say when you report in
	
	;Show messages, objectives, and stop CampaignQuest
	if debugForceOffscreenResult == 0
	
		playerReport = 1	;player needs to report to faction leader

		;Show the campaign won message:
		getCampaignWonMessage().show()

		if contestedHoldWinner == playerAllegiance
		   CWCampaignObj.setStage(20)	;objective: report success
		else
		   CWCampaignObj.setStage(30)	;objective: report failure
		endif
	
	EndIf

	ContributeToSalaryPool()

;USES OLD COMMENTED OUT VERSION	
;	setHoldOwner(ContestedHold, ContestedHoldWinner) ;we should set objectives before this, but also this needs to be called before stopping the campaign so the new one doesn't try to start before it knows who the new owner is
		
	if debugForceOffscreenResult == 0
		log("CWScript", "CWCampaign: stopping quest, campaign finished.")
		
		CWCampaign.stop()
	endif
	
	
EndFunction


Function SetGarrisonCost(Location LocToSet, int Cost)
{Takes Location LocToSet and sets its CWCost keyword data to Int Cost}
	LocToSet.SetKeywordData(CWCost, Cost)
	log("CWScript", "SetGarrisonCost() Location =" + LocToSet + ", Cost = " + Cost)
		
EndFunction

int Function GetGarrisonCost(Location LocToGetCost)
	int cost = LocToGetCost.GetKeywordData(CWCost) as Int
	log("CWScript", "GetGarrisonCost() Location =" + LocToGetCost + ", Cost = " + Cost)
	return cost
			
EndFunction


Function setInitialCosts()
{Called in the OnInit block, one time set up of initial Costs of all the locations.}

	;Have to break this into sub functions to get around with a compiler bug with complex functions
	setInitialGarrisonCostsHaafingar()
	setInitialGarrisonCostsReach()
	setInitialGarrisonCostsHjaalmarch()
	setInitialGarrisonCostsWhiterun()
	setInitialGarrisonCostsFalkreath()
	setInitialGarrisonCostsPale()
	setInitialGarrisonCostsWinterhold()
	setInitialGarrisonCostsEastmarch()
	setInitialGarrisonCostsRift()

EndFunction

;setInitialCosts() subfunctions -- to get around a function size bug in the compiler
Function setInitialGarrisonCostsHaafingar()
	SetGarrisonCost(SolitudeLocation, iCostNonContestable)
	SetGarrisonCost(SolitudeSawmillLocation, iCostNonContestable)
	SetGarrisonCost(KatlasFarmLocation, iCostNonContestable)
	SetGarrisonCost(DragonBridgeLocation, iCostNonContestable)
	
	SetGarrisonCost(FortHraggstadLocation, iCostNonContestable)
EndFunction

Function setInitialGarrisonCostsReach()
	SetGarrisonCost(MarkarthLocation, iCostNonContestable)
	SetGarrisonCost(CidhnaMineLocation, iCostNonContestable)
	SetGarrisonCost(LeftHandMineLocation, iCostNonContestable)
	SetGarrisonCost(SalviusFarmLocation, iCostNonContestable)
	SetGarrisonCost(KarthwastenLocation, iCostMedium)
	SetGarrisonCost(OldHroldanLocation, iCostMedium)
	SetGarrisonCost(KolskeggrMineLocation, iCostSmall)
	
	SetGarrisonCost(FortSungardLocation, iCostFort)
EndFunction

Function setInitialGarrisonCostsHjaalmarch()
	SetGarrisonCost(MorthalLocation, iCostNonContestable)
	SetGarrisonCost(StonehillsLocation, iCostSmall)
;	SetGarrisonCost(FrostRiverFarmLocation, iCostSmall)
	
	SetGarrisonCost(FortSnowhawkLocation, iCostFort)
EndFunction

Function setInitialGarrisonCostsWhiterun()
	SetGarrisonCost(WhiterunLocation, iCostNonContestable)
	SetGarrisonCost(BattleBornFarmLocation, iCostNonContestable)
	SetGarrisonCost(ChillfurrowFarmLocation, iCostNonContestable)
	SetGarrisonCost(PelagiaFarmLocation, iCostNonContestable)
	SetGarrisonCost(RoriksteadLocation, iCostMedium)
	SetGarrisonCost(RiverwoodLocation, iCostSmall)
;	SetGarrisonCost(BarleydarkFarmLocation, iCostSmall)
	
	SetGarrisonCost(FortGreymoorLocation, iCostFort)
EndFunction

Function setInitialGarrisonCostsFalkreath()
	SetGarrisonCost(FalkreathLocation, iCostNonContestable)
;	SetGarrisonCost(GraniteHillLocation, iCostMedium)
	SetGarrisonCost(HelgenLocation, iCostMedium)
;	SetGarrisonCost(BearsCaveMillLocation, iCostSmall)
	SetGarrisonCost(HalfmoonMillLocation, iCostSmall)
	
	SetGarrisonCost(FortNeugradLocation, iCostFort)
EndFunction

Function setInitialGarrisonCostsPale()
	SetGarrisonCost(DawnstarLocation, iCostNonContestable)
;	SetGarrisonCost(HeljarchenLocation, iCostMedium)
	SetGarrisonCost(AngasMillLocation, iCostSmall)
	SetGarrisonCost(LoreiusFarmLocation, iCostSmall)
	
	SetGarrisonCost(FortDunstadLocation, iCostFort)	
EndFunction

Function setInitialGarrisonCostsWinterhold()
	SetGarrisonCost(WinterholdLocation, iCostNonContestable)
	SetGarrisonCost(WhistlingMineLocation, iCostSmall)
	
	SetGarrisonCost(FortKastavLocation, iCostFort)
EndFunction

Function setInitialGarrisonCostsEastmarch()
	SetGarrisonCost(WindhelmLocation, iCostNonContestable)
	SetGarrisonCost(BrandyMugFarmLocation, iCostNonContestable)
	SetGarrisonCost(HlaaluFarmLocation, iCostNonContestable)
	SetGarrisonCost(HollyfrostFarmLocation, iCostNonContestable)
	SetGarrisonCost(KynesgroveLocation, iCostNonContestable)
	SetGarrisonCost(DarkwaterCrossingLocation, iCostNonContestable)
	SetGarrisonCost(MixwaterMillLocation, iCostNonContestable)
	
	SetGarrisonCost(FortAmolLocation, iCostNonContestable)
EndFunction

Function setInitialGarrisonCostsRift()
	SetGarrisonCost(RiftenLocation, iCostNonContestable)
	SetGarrisonCost(SnowShodFarmLocation, iCostNonContestable)
	;SetGarrisonCost(GoldenglowFarmLocation, iCostNonContestable) -- GoldenGlowFarm is NOT a normal location. It's quest specific area spawning it's own guards, and should not be part of the Civil War.
	SetGarrisonCost(MerryfairFarmLocation, iCostNonContestable)
	SetGarrisonCost(IvarsteadLocation, iCostMedium)
	SetGarrisonCost(ShorsStoneLocation, iCostSmall)
	SetGarrisonCost(HeartwoodMillLocation, iCostSmall)
	SetGarrisonCost(SarethiFarmLocation, iCostSmall)
	
	SetGarrisonCost(FortGreenwallLocation, iCostFort)
EndFunction

function registerMissionSuccess(Location HoldLocation, bool isFortBattle = False)
	CountMissionSuccess += 1
	
	log("CWScript", "registerMissionSuccess(HoldLocation:" + HoldLocation + ", isFortBattle:" + isFortBattle + ") CountMissionSuccess = " + CountMissionSuccess + ". Calling DisplayHoldObjective() if isFortBattle == false")
	
	;NOTE:
	;If isFortBattle is true, then we should skip displaying the Hold Objective, UNLESS we decide put reimplement the final battles at the capitals
	
	if isFortBattle == False
		DisplayHoldObjective()
	EndIf
	
EndFunction

function SetContestedHoldWinType()
{Sets the ContestedHoldWinType variable}

	if ownerContestedHold == ContestedHoldWinner
		contestedHoldWinType = 2		;held onto it
		log("CWScript", "SetContestedHoldWinType() set contestedHoldWinType to 2 (defender)")
	
	Else
		contestedHoldWinType = 1		;took it away from the enemy
		log("CWScript", "SetContestedHoldWinType() set contestedHoldWinType to 1 (attacker))")
	EndIf
	
EndFunction

Function resolveOffscreen(int CurrentAttackDelta = 0)
{Causes the campaign to resolve offscreen, puts this script in the ResolvingCampaignOffscreen state. When the CWCampaign calls this function, it needs to pass in the CurrentAttackValue. When this parameter is not present, it means we are resolving it in ForcedResolveOffscreen mode.}
	
	GoToState("ResolvingCampaignOffscreen")
	
	int winner	;1 = Imperials, 2 = Sons -- these are held in Attacker and Defender

	stopSiegeQuests()	;causes any running siege quest to stop
	
	if CurrentAttackDelta == 0	; it means something other than the actual campaign is calling this function, most likely because we are running in a debugging "force offscreen resolution" mode where we aren't really going through all the campaign scripting
		CurrentAttackDelta = AttackDelta	;because the campaign isn't calling this function passing in a CurrentAttackDelta, we will use the starting AttackDelta that the CW quest calculated when it picked a hold to contest

		log("CWScript", "resolveOffscreen() called without a CurrentAttackDelta parameter, therefore we are using the initial AttackDelta set by CWScript in StartNewCampaign(): " + CurrentAttackDelta)
	
	Else
	log("CWScript", "resolveOffscreen() called with a CurrentAttackDelta parameter = " + CurrentAttackDelta)
	
	EndIf
		
	
	;Always calculate these values for troubleshooting purposes, even if we are going to force the defender to win below
	resolutionForced = False
	resolutionDieRoll = Utility.RandomInt(0, 100)
	resolutionResult = resolutionDieRoll + (CurrentAttackDelta * ResolutionAttackDeltaMultiplier)
	If resolutionResult > 50
		contestedHoldWinner = attacker
	Else
		contestedHoldWinner = defender
	EndIf
	
	;For major holds with cities, make sure the player involved flag has been set, otherwise force the winner to be the defender (this prevents a major hold changing hands if the player never got in olved)
	If (ContestedHold == iReach && playerJoinedCampaginReach == 0) || (ContestedHold == iWhiterun && playerJoinedCampaginWhiterun == 0) || (ContestedHold == iRift && playerJoinedCampaginRift== 0)
		contestedHoldWinner = defender
		resolutionForced = True
	EndIf

	log("CWScript", "resolveOffscreen() resolved with resolutionDieRoll =" + resolutionDieRoll + ", resolutionResult=" + resolutionResult + ", contestedHoldWinner =" + contestedHoldWinner  + "(" + FactionName(contestedHoldWinner) + "), resolutionForced ="	+ resolutionForced + "; Now calling finishCampaign()")
	
	finishCampaign()

	log("CWScript", "resolveOffscreen() finished. Going to state WaitingToStartNewCampaign")
	
	GoToState("WaitingToStartNewCampaign")

	
EndFunction



