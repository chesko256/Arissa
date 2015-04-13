Scriptname CWSiegeScript extends Quest Conditional
{Extends Quest}

;*******************
;This script helps unify the Attack and Defend Quests for attacks and defenses of cities.
;It is essentially a collection of "arrays" of aliases and functions to setup/enable/reset/disable the references in those alisases in those "arrays"

;"Arrays" holding aliases pointing to soldier references placed in the world
;ImperialAttackerX - these mimic an array called "ImperialAttackerAliases" - (the ones pointing at specific references in the world who have the link refs)
;ImperialDefenderX - these mimic an array called "ImperialDefenderAliases" - (the ones pointing at specific references in the world who have the link refs)
;SonsAttackerX - these mimic an array called "SonsAttackerAliases" - (the ones pointing at specific references in the world who have the link refs)
;SonsDefenderX - these mimic an array called "SonsDefenderAliases" - (the ones pointing at specific references in the world who have the link refs)

;"Arrays" holding aliases that are used to put packages on the soldiers who are acting as Attackers or Defenders in this instance of the quest (in otherwords which of the above mentioned aliases are actually the attackers and defenders at this very moment)
;AttackerX - these mimic an array called "AttackerAliases" - (the ones with the packages and scripts to make the sieges work)
;DefenderX - these mimic an array called "DefenderAliases" - (the ones with the packages and scripts to make the sieges work)

;Functions to call from quest stage fragment script:

;RegisterXYZ() - this is how you pass aliases into the "array"
;DisableXYZ() - this is how you Disable all the references in aliases in the "array"
;EnableXYZ() - this is how you enable all the references in aliases in the "array"
;ResetXYZ() - this is how you Reset all the references in aliases in the "array"
;
;SetUpAliases(bool IsAttackQuest) - sets up, enables, and resets aliases as appropriate to the player faction and attacking Faction (it enables and resets all the generic and attacker/defender aliases, and GenericAttack or GenericDefend as appropriate to the TYPE of QUEST [IsAttackQuest] true = this is an attack on a city, false = this is a defense of a city)
;DisableAllAliases() - disables all the aliases registered into any of the "arrays" (strictly speaking it disables the generic aliases, and the Imperial/SonsAttacker/Defender aliases, not the Attacker/Defender aliases, but the Attacker/Defender aliases are just pointing at a subset of the Imperial/SonsAttacker/Defender aliases, so it amounts to the same thing)


;*******************

CWScript Property CWs Auto

GlobalVariable Property CWBattlePhase Auto

GlobalVariable Property CWStateAttackerAtGate Auto
GlobalVariable Property CWStateAttackerBrokeThrough Auto
GlobalVariable Property CWStateAttackerLowReinforcements Auto
GlobalVariable Property CWStateAttackerOutOfReinforcements Auto
GlobalVariable Property CWStateAttackStarted Auto
GlobalVariable Property CWStateDefenderFallingBack Auto
GlobalVariable Property CWStateDefenderLastStand Auto
GlobalVariable Property CWStateDefenderLowReinforcements Auto
GlobalVariable Property CWStateDefenderOutOfReinforcements Auto

bool Property DoneSettingUpAliases = False auto Hidden
bool Property DoneTurningOnAliases = False auto Hidden

bool Property WasThisAnAttack  Auto hidden
bool DisabledFastTravel = false 

bool Property AttackersHaveWon = false Auto Conditional
bool Property DefendersHaveWon = false Auto Conditional
Int Property CurrentCity Auto Conditional
{Gets set when CWSiege starts:
1 = Solitude
2 = Markarth
4 = Whiterun
8 = Windhelm
9 = Riften
}

LocationAlias Property City Auto
LocationAlias Property Hold Auto

;Pointers to references that handle the quest title text replacement
ObjectReference Property TextReplaceDEFENSE  Auto  
ObjectReference Property TextReplaceATTACK  Auto  
ReferenceAlias Property ObjAliasTextReplaceAttackDefend Auto


;sound control
MusicType Property MUSCombatCivilWar auto
sound Property AMBCombatSoundsLoop  Auto  
int CombatSoundsLoopInstance 		

Weather Property WeatherWhiterun Auto
Weather Property WeatherMarkarth Auto
Weather Property WeatherRiften Auto
Weather Property WeatherSolitude Auto
Weather Property WeatherWindhelm Auto

Explosion Property CWCatapultExp Auto


quest Property DA08  Auto

Quest Property SolitudeOpening Auto

Scene Property CWSiegeWhiterunDefendedScene Auto

Quest Property CWPostWhiterunObj Auto ;objective turned on in stage 200 in CWSiege quest, and completed in CWSiegeJarlThankYouTopic fragment in CW quest

MS11QuestScript Property MS11 Auto ;ised tp call a function on MS11 to help handle murder scene not occuring duing siege

; ## External Aliases ##
Quest Property CWSiegeObj Auto
LocationAlias Property CWSiegeObjCity Auto
ReferenceAlias Property CWSiegeObjCityGate Auto
ReferenceAlias Property CWSiegeObjJarl Auto
ReferenceAlias Property CWSiegeObjGeneral Auto

ReferenceAlias Property CWSiegeObjObjective1A Auto
ReferenceAlias Property CWSiegeObjObjective2A Auto
ReferenceAlias Property CWSiegeObjObjective3A Auto
ReferenceAlias Property CWSiegeObjObjective4A Auto

ReferenceAlias Property CWSiegeObjObjective1B Auto
ReferenceAlias Property CWSiegeObjObjective2B Auto
ReferenceAlias Property CWSiegeObjObjective3B Auto
ReferenceAlias Property CWSiegeObjObjective4B Auto

ReferenceAlias Property CWReservationsBalgruuf Auto
ReferenceAlias Property CWReservationsProventus Auto
ReferenceAlias Property CWReservationsIrileth Auto

;"Array" of aliases
;rather than declaring these again on all siege scripts, we will create a function that the quest fragment can pass in the Alias_XXX aliases and put them in the "array"

;Imperial Attacker/Defender aliases (the ones pointing at specific references in the world who have the link refs)
ReferenceAlias ImperialAttacker1
ReferenceAlias ImperialAttacker2
ReferenceAlias ImperialAttacker3
ReferenceAlias ImperialAttacker4
ReferenceAlias ImperialAttacker5
ReferenceAlias ImperialAttacker6
ReferenceAlias ImperialAttacker7
ReferenceAlias ImperialAttacker8
ReferenceAlias ImperialAttacker9
ReferenceAlias ImperialAttacker10

ReferenceAlias ImperialDefender1
ReferenceAlias ImperialDefender2
ReferenceAlias ImperialDefender3
ReferenceAlias ImperialDefender4
ReferenceAlias ImperialDefender5
ReferenceAlias ImperialDefender6
ReferenceAlias ImperialDefender7
ReferenceAlias ImperialDefender8
ReferenceAlias ImperialDefender9
ReferenceAlias ImperialDefender10

;Sons Attacker/Defender aliases (the ones pointing at specific references in the world who have the link refs)
ReferenceAlias SonsAttacker1
ReferenceAlias SonsAttacker2
ReferenceAlias SonsAttacker3
ReferenceAlias SonsAttacker4
ReferenceAlias SonsAttacker5
ReferenceAlias SonsAttacker6
ReferenceAlias SonsAttacker7
ReferenceAlias SonsAttacker8
ReferenceAlias SonsAttacker9
ReferenceAlias SonsAttacker10

ReferenceAlias SonsDefender1
ReferenceAlias SonsDefender2
ReferenceAlias SonsDefender3
ReferenceAlias SonsDefender4
ReferenceAlias SonsDefender5
ReferenceAlias SonsDefender6
ReferenceAlias SonsDefender7
ReferenceAlias SonsDefender8
ReferenceAlias SonsDefender9
ReferenceAlias SonsDefender10

;Attacker/Defender Aliases (the ones with the packages and scripts to make the sieges work, the above aliases will be shoved into these depending on who is attacking/defending)
ReferenceAlias Attacker1
ReferenceAlias Attacker2
ReferenceAlias Attacker3
ReferenceAlias Attacker4
ReferenceAlias Attacker5
ReferenceAlias Attacker6
ReferenceAlias Attacker7
ReferenceAlias Attacker8
ReferenceAlias Attacker9
ReferenceAlias Attacker10

ReferenceAlias Defender1
ReferenceAlias Defender2
ReferenceAlias Defender3
ReferenceAlias Defender4
ReferenceAlias Defender5
ReferenceAlias Defender6
ReferenceAlias Defender7
ReferenceAlias Defender8
ReferenceAlias Defender9
ReferenceAlias Defender10


;Generic "array" of aliases of things we want to enable/reset/disable as a group (things like fires, catapolts, barricades, etc.)
ReferenceAlias Generic1
ReferenceAlias Generic2
ReferenceAlias Generic3
ReferenceAlias Generic4
ReferenceAlias Generic5
ReferenceAlias Generic6
ReferenceAlias Generic7
ReferenceAlias Generic8
ReferenceAlias Generic9
ReferenceAlias Generic10
ReferenceAlias Generic11
ReferenceAlias Generic12
ReferenceAlias Generic13
ReferenceAlias Generic14
ReferenceAlias Generic15
ReferenceAlias Generic16
ReferenceAlias Generic17
ReferenceAlias Generic18
ReferenceAlias Generic19
ReferenceAlias Generic20
ReferenceAlias Generic21
ReferenceAlias Generic22
ReferenceAlias Generic23
ReferenceAlias Generic24
ReferenceAlias Generic25
ReferenceAlias Generic26
ReferenceAlias Generic27
ReferenceAlias Generic28
ReferenceAlias Generic29
ReferenceAlias Generic30


;For ATTACK quests -Generic "array" of aliases of things we want to enable/reset/disable as a group (things like fires, catapolts, barricades, etc.)
ReferenceAlias GenericAttack1
ReferenceAlias GenericAttack2
ReferenceAlias GenericAttack3
ReferenceAlias GenericAttack4
ReferenceAlias GenericAttack5
ReferenceAlias GenericAttack6
ReferenceAlias GenericAttack7
ReferenceAlias GenericAttack8
ReferenceAlias GenericAttack9
ReferenceAlias GenericAttack10
ReferenceAlias GenericAttack11
ReferenceAlias GenericAttack12
ReferenceAlias GenericAttack13
ReferenceAlias GenericAttack14
ReferenceAlias GenericAttack15
ReferenceAlias GenericAttack16
ReferenceAlias GenericAttack17
ReferenceAlias GenericAttack18
ReferenceAlias GenericAttack19
ReferenceAlias GenericAttack20
ReferenceAlias GenericAttack21
ReferenceAlias GenericAttack22
ReferenceAlias GenericAttack23
ReferenceAlias GenericAttack24
ReferenceAlias GenericAttack25
ReferenceAlias GenericAttack26
ReferenceAlias GenericAttack27
ReferenceAlias GenericAttack28
ReferenceAlias GenericAttack29
ReferenceAlias GenericAttack30

;For DEFEND quests -Generic "array" of aliases of things we want to enable/reset/disable as a group (things like fires, catapolts, barricades, etc.)
ReferenceAlias GenericDefend1
ReferenceAlias GenericDefend2
ReferenceAlias GenericDefend3
ReferenceAlias GenericDefend4
ReferenceAlias GenericDefend5
ReferenceAlias GenericDefend6
ReferenceAlias GenericDefend7
ReferenceAlias GenericDefend8
ReferenceAlias GenericDefend9
ReferenceAlias GenericDefend10
ReferenceAlias GenericDefend11
ReferenceAlias GenericDefend12
ReferenceAlias GenericDefend13
ReferenceAlias GenericDefend14
ReferenceAlias GenericDefend15
ReferenceAlias GenericDefend16
ReferenceAlias GenericDefend17
ReferenceAlias GenericDefend18
ReferenceAlias GenericDefend19
ReferenceAlias GenericDefend20
ReferenceAlias GenericDefend21
ReferenceAlias GenericDefend22
ReferenceAlias GenericDefend23
ReferenceAlias GenericDefend24
ReferenceAlias GenericDefend25
ReferenceAlias GenericDefend26
ReferenceAlias GenericDefend27
ReferenceAlias GenericDefend28
ReferenceAlias GenericDefend29
ReferenceAlias GenericDefend30


ReferenceAlias AttackerSonsCampMapMarker
Referencealias AttackerImperialCampMapMarker
ReferenceAlias MapMarkerToDisable1
ReferenceAlias MapMarkerToDisable2
ReferenceAlias MapMarkerToDisable3
ReferenceAlias MapMarkerToDisable4
ReferenceAlias MapMarkerToDisable5
ReferenceAlias MapMarkerToDisable6
ReferenceAlias MapMarkerToDisable7
ReferenceAlias MapMarkerToDisable8
ReferenceAlias MapMarkerToDisable9
ReferenceAlias MapMarkerToDisable10
ReferenceAlias MapMarkerToDisable11
ReferenceAlias MapMarkerToDisable12
ReferenceAlias MapMarkerToDisable13
ReferenceAlias MapMarkerToDisable14
ReferenceAlias MapMarkerToDisable15
ReferenceAlias MapMarkerToDisable16

function RegisterMapMarkerAliases(ReferenceAlias AttackerSonsCampMapMarkerAlias, ReferenceAlias AttackerImperialCampMapMarkerAlias, \
ReferenceAlias MapMarkerToDisable1Alias, \
ReferenceAlias MapMarkerToDisable2Alias, \
ReferenceAlias MapMarkerToDisable3Alias, \
ReferenceAlias MapMarkerToDisable4Alias, \
ReferenceAlias MapMarkerToDisable5Alias, \
ReferenceAlias MapMarkerToDisable6Alias, \
ReferenceAlias MapMarkerToDisable7Alias, \
ReferenceAlias MapMarkerToDisable8Alias, \
ReferenceAlias MapMarkerToDisable9Alias, \
ReferenceAlias MapMarkerToDisable10Alias, \
ReferenceAlias MapMarkerToDisable11Alias, \
ReferenceAlias MapMarkerToDisable12Alias, \
ReferenceAlias MapMarkerToDisable13Alias, \
ReferenceAlias MapMarkerToDisable14Alias, \
ReferenceAlias MapMarkerToDisable15Alias, \
ReferenceAlias MapMarkerToDisable16Alias)

	AttackerSonsCampMapMarker = AttackerSonsCampMapMarkerAlias
	AttackerImperialCampMapMarker = AttackerImperialCampMapMarkerAlias
	MapMarkerToDisable1 = MapMarkerToDisable1Alias
	MapMarkerToDisable2 = MapMarkerToDisable2Alias
	MapMarkerToDisable3 = MapMarkerToDisable3Alias
	MapMarkerToDisable4 = MapMarkerToDisable4Alias
	MapMarkerToDisable5 = MapMarkerToDisable5Alias
	MapMarkerToDisable6 = MapMarkerToDisable6Alias
	MapMarkerToDisable7 = MapMarkerToDisable7Alias
	MapMarkerToDisable8 = MapMarkerToDisable8Alias
	MapMarkerToDisable9 = MapMarkerToDisable9Alias
	MapMarkerToDisable10 = MapMarkerToDisable10Alias
	MapMarkerToDisable11 = MapMarkerToDisable11Alias
	MapMarkerToDisable12 = MapMarkerToDisable12Alias
	MapMarkerToDisable13 = MapMarkerToDisable13Alias
	MapMarkerToDisable14 = MapMarkerToDisable14Alias
	MapMarkerToDisable15 = MapMarkerToDisable15Alias
	MapMarkerToDisable16 = MapMarkerToDisable16Alias

EndFunction

function ToggleMapMarkersAndFastTravelStartBattle(bool isAttackQuest)
	
; 	CWScript.Log("CWSiegeScript", self + "ToggleMapMarkersAndFastTravelStartBattle()")
	
	isAttackQuest = WasThisAnAttack	  ;added this late in the game (set in stage 0), easier to just do this than fix all instances that call this function and pass in a param

	
	DisabledFastTravel = false		;clear it to be on the safe side
		
	if isAttackQuest

		if CWs.PlayerAllegiance == 1
			AttackerImperialCampMapMarker.TryToEnable()
		elseif CWs.PlayerAllegiance == 2
			AttackerSonsCampMapMarker.TryToEnable()
		endif
		MapMarkerToDisable1.TryToDisable()
		MapMarkerToDisable2.TryToDisable()
		MapMarkerToDisable3.TryToDisable()
		MapMarkerToDisable4.TryToDisable()
		MapMarkerToDisable5.TryToDisable()
		MapMarkerToDisable6.TryToDisable()
		MapMarkerToDisable7.TryToDisable()
		MapMarkerToDisable8.TryToDisable()
		MapMarkerToDisable9.TryToDisable()
		MapMarkerToDisable10.TryToDisable()
		MapMarkerToDisable11.TryToDisable()
		MapMarkerToDisable12.TryToDisable()
		MapMarkerToDisable13.TryToDisable()
		MapMarkerToDisable14.TryToDisable()
		MapMarkerToDisable15.TryToDisable()
		MapMarkerToDisable16.TryToDisable()
	
	Else
; 		CWScript.Log("CWSiegeScript", self + "DISABLING FAST TRAVEL!", 1, true, True)
		Game.EnableFastTravel(false)
		DisabledFastTravel = true
		

		
	EndIf

EndFunction

function ToggleMapMarkersAndFastTravelEndBattle(bool isAttackQuest)
	
; 	CWScript.Log("CWSiegeScript", self + "ToggleMapMarkersAndFastTravelEndBattle()")
	
	isAttackQuest = WasThisAnAttack	  ;added this late in the game (set in stage 0), easier to just do this than fix all instances that call this function and pass in a param
		
	if isAttackQuest

		AttackerImperialCampMapMarker.TryToDisable()
		AttackerSonsCampMapMarker.TryToDisable()
		
		MapMarkerToDisable1.TryToEnable()
		MapMarkerToDisable2.TryToEnable()
		MapMarkerToDisable3.TryToEnable()
		MapMarkerToDisable4.TryToEnable()
		MapMarkerToDisable5.TryToEnable()
		MapMarkerToDisable6.TryToEnable()
		MapMarkerToDisable7.TryToEnable()
		MapMarkerToDisable8.TryToEnable()
		MapMarkerToDisable9.TryToEnable()
		MapMarkerToDisable10.TryToEnable()
		MapMarkerToDisable11.TryToEnable()
		MapMarkerToDisable12.TryToEnable()
		MapMarkerToDisable13.TryToEnable()
		MapMarkerToDisable14.TryToEnable()
		MapMarkerToDisable15.TryToEnable()
		MapMarkerToDisable16.TryToEnable()
		
	Else
	
		if DisabledFastTravel == true  ;reminder why I am checking this: I need to check to make sure this quest actually disabled fast travel before turning it on again, because this might start/fail offscreen and I need to make sure I don't enable fast travel if the player didn't get involved
; 			CWScript.Log("CWSiegeScript", self + "ENABLING FAST TRAVEL!", 1, true, True)	
			Game.EnableFastTravel(true)
			DisabledFastTravel = False	

	
		endif
	
	EndIf

EndFunction


;Register functions essentially shove the aliases from the quest into arrays to be used more conveniently by other function calls

;Register Imperial aliases
Function RegisterImperialAttackerAliases(ReferenceAlias RefAlias1, ReferenceAlias RefAlias2, ReferenceAlias RefAlias3, ReferenceAlias RefAlias4, ReferenceAlias RefAlias5, ReferenceAlias RefAlias6, ReferenceAlias RefAlias7, ReferenceAlias RefAlias8, ReferenceAlias RefAlias9, ReferenceAlias RefAlias10 )
; 	CWScript.Log("CWSiegeScript", self + "calling RegisterImperialAttackerAliases()" +  RefAlias1 + "," + RefAlias2 + "," + RefAlias3 + "," + RefAlias4 + "," + RefAlias5 + "," + RefAlias6 + "," + RefAlias7 + "," + RefAlias8 + "," + RefAlias9 + "," + RefAlias10 )
	ImperialAttacker1 = RefAlias1
	ImperialAttacker2 = RefAlias2
	ImperialAttacker3 = RefAlias3
	ImperialAttacker4 = RefAlias4
	ImperialAttacker5 = RefAlias5
	ImperialAttacker6 = RefAlias6
	ImperialAttacker7 = RefAlias7
	ImperialAttacker8 = RefAlias8
	ImperialAttacker9 = RefAlias9
	ImperialAttacker10 = RefAlias10

EndFunction

Function RegisterImperialDefenderAliases(ReferenceAlias RefAlias1, ReferenceAlias RefAlias2, ReferenceAlias RefAlias3, ReferenceAlias RefAlias4, ReferenceAlias RefAlias5, ReferenceAlias RefAlias6, ReferenceAlias RefAlias7, ReferenceAlias RefAlias8, ReferenceAlias RefAlias9, ReferenceAlias RefAlias10 )
; 	CWScript.Log("CWSiegeScript", self + "calling RegisterImperialDefenderAliases()" +  RefAlias1 + "," + RefAlias2 + "," + RefAlias3 + "," + RefAlias4 + "," + RefAlias5 + "," + RefAlias6 + "," + RefAlias7 + "," + RefAlias8 + "," + RefAlias9 + "," + RefAlias10 )
	ImperialDefender1 = RefAlias1
	ImperialDefender2 = RefAlias2
	ImperialDefender3 = RefAlias3
	ImperialDefender4 = RefAlias4
	ImperialDefender5 = RefAlias5
	ImperialDefender6 = RefAlias6
	ImperialDefender7 = RefAlias7
	ImperialDefender8 = RefAlias8
	ImperialDefender9 = RefAlias9
	ImperialDefender10 = RefAlias10

EndFunction

;Register Sons aliases
Function RegisterSonsAttackerAliases(ReferenceAlias RefAlias1, ReferenceAlias RefAlias2, ReferenceAlias RefAlias3, ReferenceAlias RefAlias4, ReferenceAlias RefAlias5, ReferenceAlias RefAlias6, ReferenceAlias RefAlias7, ReferenceAlias RefAlias8, ReferenceAlias RefAlias9, ReferenceAlias RefAlias10 )
; 	CWScript.Log("CWSiegeScript", self + "calling RegisterSonsAttackerAliases()" +  RefAlias1 + "," + RefAlias2 + "," + RefAlias3 + "," + RefAlias4 + "," + RefAlias5 + "," + RefAlias6 + "," + RefAlias7 + "," + RefAlias8 + "," + RefAlias9 + "," + RefAlias10 )
	SonsAttacker1 = RefAlias1
	SonsAttacker2 = RefAlias2
	SonsAttacker3 = RefAlias3
	SonsAttacker4 = RefAlias4
	SonsAttacker5 = RefAlias5
	SonsAttacker6 = RefAlias6
	SonsAttacker7 = RefAlias7
	SonsAttacker8 = RefAlias8
	SonsAttacker9 = RefAlias9
	SonsAttacker10 = RefAlias10

EndFunction

Function RegisterSonsDefenderAliases(ReferenceAlias RefAlias1, ReferenceAlias RefAlias2, ReferenceAlias RefAlias3, ReferenceAlias RefAlias4, ReferenceAlias RefAlias5, ReferenceAlias RefAlias6, ReferenceAlias RefAlias7, ReferenceAlias RefAlias8, ReferenceAlias RefAlias9, ReferenceAlias RefAlias10 )
; 	CWScript.Log("CWSiegeScript", self + "calling RegisterSonsDefenderAliases()" +  RefAlias1 + "," + RefAlias2 + "," + RefAlias3 + "," + RefAlias4 + "," + RefAlias5 + "," + RefAlias6 + "," + RefAlias7 + "," + RefAlias8 + "," + RefAlias9 + "," + RefAlias10 )
	SonsDefender1 = RefAlias1
	SonsDefender2 = RefAlias2
	SonsDefender3 = RefAlias3
	SonsDefender4 = RefAlias4
	SonsDefender5 = RefAlias5
	SonsDefender6 = RefAlias6
	SonsDefender7 = RefAlias7
	SonsDefender8 = RefAlias8
	SonsDefender9 = RefAlias9
	SonsDefender10 = RefAlias10

EndFunction

;Register Attacker Aliases
Function RegisterAttackerAliases(ReferenceAlias RefAlias1, ReferenceAlias RefAlias2, ReferenceAlias RefAlias3, ReferenceAlias RefAlias4, ReferenceAlias RefAlias5, ReferenceAlias RefAlias6, ReferenceAlias RefAlias7, ReferenceAlias RefAlias8, ReferenceAlias RefAlias9, ReferenceAlias RefAlias10 )
; 	CWScript.Log("CWSiegeScript", self + "calling RegisterAttackerAliases()" +  RefAlias1 + "," + RefAlias2 + "," + RefAlias3 + "," + RefAlias4 + "," + RefAlias5 + "," + RefAlias6 + "," + RefAlias7 + "," + RefAlias8 + "," + RefAlias9 + "," + RefAlias10 )
	Attacker1 = RefAlias1
	Attacker2 = RefAlias2
	Attacker3 = RefAlias3
	Attacker4 = RefAlias4
	Attacker5 = RefAlias5
	Attacker6 = RefAlias6
	Attacker7 = RefAlias7
	Attacker8 = RefAlias8
	Attacker9 = RefAlias9
	Attacker10 = RefAlias10

EndFunction

;Register Defender Aliases
Function RegisterDefenderAliases(ReferenceAlias RefAlias1, ReferenceAlias RefAlias2, ReferenceAlias RefAlias3, ReferenceAlias RefAlias4, ReferenceAlias RefAlias5, ReferenceAlias RefAlias6, ReferenceAlias RefAlias7, ReferenceAlias RefAlias8, ReferenceAlias RefAlias9, ReferenceAlias RefAlias10 )
; 	CWScript.Log("CWSiegeScript", self + "calling RegisterDefenderAliases()" +  RefAlias1 + "," + RefAlias2 + "," + RefAlias3 + "," + RefAlias4 + "," + RefAlias5 + "," + RefAlias6 + "," + RefAlias7 + "," + RefAlias8 + "," + RefAlias9 + "," + RefAlias10 )
	Defender1 = RefAlias1
	Defender2 = RefAlias2
	Defender3 = RefAlias3
	Defender4 = RefAlias4
	Defender5 = RefAlias5
	Defender6 = RefAlias6
	Defender7 = RefAlias7
	Defender8 = RefAlias8
	Defender9 = RefAlias9
	Defender10 = RefAlias10

EndFunction

;Register Generic Aliases
Function RegisterGenericAliases( \
ReferenceAlias RefAlias1, ReferenceAlias RefAlias2 = None, ReferenceAlias RefAlias3 = None, ReferenceAlias RefAlias4 = None, ReferenceAlias RefAlias5 = None, ReferenceAlias RefAlias6 = None, ReferenceAlias RefAlias7 = None, ReferenceAlias RefAlias8 = None, ReferenceAlias RefAlias9 = None, ReferenceAlias RefAlias10 = None, \
ReferenceAlias RefAlias11 = None, ReferenceAlias RefAlias12 = None, ReferenceAlias RefAlias13 = None, ReferenceAlias RefAlias14 = None, ReferenceAlias RefAlias15 = None, ReferenceAlias RefAlias16 = None, ReferenceAlias RefAlias17 = None, ReferenceAlias RefAlias18 = None, ReferenceAlias RefAlias19 = None, ReferenceAlias RefAlias20 = None, \
ReferenceAlias RefAlias21 = None, ReferenceAlias RefAlias22 = None, ReferenceAlias RefAlias23 = None, ReferenceAlias RefAlias24 = None, ReferenceAlias RefAlias25 = None, ReferenceAlias RefAlias26 = None, ReferenceAlias RefAlias27 = None, ReferenceAlias RefAlias28 = None, ReferenceAlias RefAlias29 = None, ReferenceAlias RefAlias30 = None \
)
; 	CWScript.Log("CWSiegeScript", self + "calling RegisterGenericAliases()" + \
;					RefAlias1 + "," + RefAlias2 + "," + RefAlias3 + "," + RefAlias4 + "," + RefAlias5 + "," + RefAlias6 + "," + RefAlias7 + "," + RefAlias8 + "," + RefAlias9 + "," + RefAlias10 + "," + \
;					RefAlias11 + "," + RefAlias12 + "," + RefAlias13 + "," + RefAlias14 + "," + RefAlias15 + "," + RefAlias16 + "," + RefAlias17 + "," + RefAlias18 + "," + RefAlias19 + "," + RefAlias20 + "," + \
;					RefAlias21 + "," + RefAlias22 + "," + RefAlias23 + "," + RefAlias24 + "," + RefAlias25 + "," + RefAlias26 + "," + RefAlias27 + "," + RefAlias28 + "," + RefAlias29 + "," + RefAlias30 + "," \
;					)

	Generic1 = RefAlias1
	Generic2 = RefAlias2
	Generic3 = RefAlias3
	Generic4 = RefAlias4
	Generic5 = RefAlias5
	Generic6 = RefAlias6
	Generic7 = RefAlias7
	Generic8 = RefAlias8
	Generic9 = RefAlias9
	Generic10 = RefAlias10

	Generic11 = RefAlias11
	Generic12 = RefAlias12
	Generic13 = RefAlias13
	Generic14 = RefAlias14
	Generic15 = RefAlias15
	Generic16 = RefAlias16
	Generic17 = RefAlias17
	Generic18 = RefAlias18
	Generic19 = RefAlias19
	Generic20 = RefAlias20
	
	Generic21 = RefAlias21
	Generic22 = RefAlias22
	Generic23 = RefAlias23
	Generic24 = RefAlias24
	Generic25 = RefAlias25
	Generic26 = RefAlias26
	Generic27 = RefAlias27
	Generic28 = RefAlias28
	Generic29 = RefAlias29
	Generic30 = RefAlias30
	
	
EndFunction

;Register GenericAttack Aliases
Function RegisterGenericAttackAliases( \
ReferenceAlias RefAlias1, ReferenceAlias RefAlias2 = None, ReferenceAlias RefAlias3 = None, ReferenceAlias RefAlias4 = None, ReferenceAlias RefAlias5 = None, ReferenceAlias RefAlias6 = None, ReferenceAlias RefAlias7 = None, ReferenceAlias RefAlias8 = None, ReferenceAlias RefAlias9 = None, ReferenceAlias RefAlias10 = None, \
ReferenceAlias RefAlias11 = None, ReferenceAlias RefAlias12 = None, ReferenceAlias RefAlias13 = None, ReferenceAlias RefAlias14 = None, ReferenceAlias RefAlias15 = None, ReferenceAlias RefAlias16 = None, ReferenceAlias RefAlias17 = None, ReferenceAlias RefAlias18 = None, ReferenceAlias RefAlias19 = None, ReferenceAlias RefAlias20 = None, \
ReferenceAlias RefAlias21 = None, ReferenceAlias RefAlias22 = None, ReferenceAlias RefAlias23 = None, ReferenceAlias RefAlias24 = None, ReferenceAlias RefAlias25 = None, ReferenceAlias RefAlias26 = None, ReferenceAlias RefAlias27 = None, ReferenceAlias RefAlias28 = None, ReferenceAlias RefAlias29 = None, ReferenceAlias RefAlias30 = None \
)
; 	CWScript.Log("CWSiegeScript", self + "calling RegisterGenericAttackAliases()" + \
;					RefAlias1 + "," + RefAlias2 + "," + RefAlias3 + "," + RefAlias4 + "," + RefAlias5 + "," + RefAlias6 + "," + RefAlias7 + "," + RefAlias8 + "," + RefAlias9 + "," + RefAlias10 + "," + \
;					RefAlias11 + "," + RefAlias12 + "," + RefAlias13 + "," + RefAlias14 + "," + RefAlias15 + "," + RefAlias16 + "," + RefAlias17 + "," + RefAlias18 + "," + RefAlias19 + "," + RefAlias20 + "," + \
;					RefAlias21 + "," + RefAlias22 + "," + RefAlias23 + "," + RefAlias24 + "," + RefAlias25 + "," + RefAlias26 + "," + RefAlias27 + "," + RefAlias28 + "," + RefAlias29 + "," + RefAlias30 + "," \
;					)

	GenericAttack1 = RefAlias1
	GenericAttack2 = RefAlias2
	GenericAttack3 = RefAlias3
	GenericAttack4 = RefAlias4
	GenericAttack5 = RefAlias5
	GenericAttack6 = RefAlias6
	GenericAttack7 = RefAlias7
	GenericAttack8 = RefAlias8
	GenericAttack9 = RefAlias9
	GenericAttack10 = RefAlias10

	GenericAttack11 = RefAlias11
	GenericAttack12 = RefAlias12
	GenericAttack13 = RefAlias13
	GenericAttack14 = RefAlias14
	GenericAttack15 = RefAlias15
	GenericAttack16 = RefAlias16
	GenericAttack17 = RefAlias17
	GenericAttack18 = RefAlias18
	GenericAttack19 = RefAlias19
	GenericAttack20 = RefAlias20
	
	GenericAttack21 = RefAlias21
	GenericAttack22 = RefAlias22
	GenericAttack23 = RefAlias23
	GenericAttack24 = RefAlias24
	GenericAttack25 = RefAlias25
	GenericAttack26 = RefAlias26
	GenericAttack27 = RefAlias27
	GenericAttack28 = RefAlias28
	GenericAttack29 = RefAlias29
	GenericAttack30 = RefAlias30
		
EndFunction

;Register GenericDefend Aliases
Function RegisterGenericDefendAliases( \
ReferenceAlias RefAlias1, ReferenceAlias RefAlias2 = None, ReferenceAlias RefAlias3 = None, ReferenceAlias RefAlias4 = None, ReferenceAlias RefAlias5 = None, ReferenceAlias RefAlias6 = None, ReferenceAlias RefAlias7 = None, ReferenceAlias RefAlias8 = None, ReferenceAlias RefAlias9 = None, ReferenceAlias RefAlias10 = None, \
ReferenceAlias RefAlias11 = None, ReferenceAlias RefAlias12 = None, ReferenceAlias RefAlias13 = None, ReferenceAlias RefAlias14 = None, ReferenceAlias RefAlias15 = None, ReferenceAlias RefAlias16 = None, ReferenceAlias RefAlias17 = None, ReferenceAlias RefAlias18 = None, ReferenceAlias RefAlias19 = None, ReferenceAlias RefAlias20 = None, \
ReferenceAlias RefAlias21 = None, ReferenceAlias RefAlias22 = None, ReferenceAlias RefAlias23 = None, ReferenceAlias RefAlias24 = None, ReferenceAlias RefAlias25 = None, ReferenceAlias RefAlias26 = None, ReferenceAlias RefAlias27 = None, ReferenceAlias RefAlias28 = None, ReferenceAlias RefAlias29 = None, ReferenceAlias RefAlias30 = None \
)
; 	CWScript.Log("CWSiegeScript", self + "calling RegisterGenericDefendAliases()" + \
;					RefAlias1 + "," + RefAlias2 + "," + RefAlias3 + "," + RefAlias4 + "," + RefAlias5 + "," + RefAlias6 + "," + RefAlias7 + "," + RefAlias8 + "," + RefAlias9 + "," + RefAlias10 + "," + \
;					RefAlias11 + "," + RefAlias12 + "," + RefAlias13 + "," + RefAlias14 + "," + RefAlias15 + "," + RefAlias16 + "," + RefAlias17 + "," + RefAlias18 + "," + RefAlias19 + "," + RefAlias20 + "," + \
;					RefAlias21 + "," + RefAlias22 + "," + RefAlias23 + "," + RefAlias24 + "," + RefAlias25 + "," + RefAlias26 + "," + RefAlias27 + "," + RefAlias28 + "," + RefAlias29 + "," + RefAlias30 + "," \
;					)

	GenericDefend1 = RefAlias1
	GenericDefend2 = RefAlias2
	GenericDefend3 = RefAlias3
	GenericDefend4 = RefAlias4
	GenericDefend5 = RefAlias5
	GenericDefend6 = RefAlias6
	GenericDefend7 = RefAlias7
	GenericDefend8 = RefAlias8
	GenericDefend9 = RefAlias9
	GenericDefend10 = RefAlias10

	GenericDefend11 = RefAlias11
	GenericDefend12 = RefAlias12
	GenericDefend13 = RefAlias13
	GenericDefend14 = RefAlias14
	GenericDefend15 = RefAlias15
	GenericDefend16 = RefAlias16
	GenericDefend17 = RefAlias17
	GenericDefend18 = RefAlias18
	GenericDefend19 = RefAlias19
	GenericDefend20 = RefAlias20
	
	GenericDefend21 = RefAlias21
	GenericDefend22 = RefAlias22
	GenericDefend23 = RefAlias23
	GenericDefend24 = RefAlias24
	GenericDefend25 = RefAlias25
	GenericDefend26 = RefAlias26
	GenericDefend27 = RefAlias27
	GenericDefend28 = RefAlias28
	GenericDefend29 = RefAlias29
	GenericDefend30 = RefAlias30
		
EndFunction

Function RegisterAliasesWithCWReinforcementScript(Location SiegeLocationAttackPoint)
; 	CWScript.Log("CWSiegeScript", self + "calling RegisterAliasesWithCWReinforcementScript()")

	CWReinforcementControllerScript CWReinforcementControllerS = (self as quest ) as CWReinforcementControllerScript

	CWReinforcementControllerS.RegisterAttackPoint(SiegeLocationAttackPoint)
	
	CWReinforcementControllerS.RegisterAlias(Attacker1)
	CWReinforcementControllerS.RegisterAlias(Attacker2)
	CWReinforcementControllerS.RegisterAlias(Attacker3)
	CWReinforcementControllerS.RegisterAlias(Attacker4)
	CWReinforcementControllerS.RegisterAlias(Attacker5)
	CWReinforcementControllerS.RegisterAlias(Attacker6)
	CWReinforcementControllerS.RegisterAlias(Attacker7)
	CWReinforcementControllerS.RegisterAlias(Attacker8)
	CWReinforcementControllerS.RegisterAlias(Attacker9)
	CWReinforcementControllerS.RegisterAlias(Attacker10)

	CWReinforcementControllerS.RegisterAlias(Defender1)
	CWReinforcementControllerS.RegisterAlias(Defender2)
	CWReinforcementControllerS.RegisterAlias(Defender3)
	CWReinforcementControllerS.RegisterAlias(Defender4)
	CWReinforcementControllerS.RegisterAlias(Defender5)
	CWReinforcementControllerS.RegisterAlias(Defender6)
	CWReinforcementControllerS.RegisterAlias(Defender7)
	CWReinforcementControllerS.RegisterAlias(Defender8)
	CWReinforcementControllerS.RegisterAlias(Defender9)
	CWReinforcementControllerS.RegisterAlias(Defender10)

EndFunction

Function RegisterSpawnAttackerAliasesWithCWReinforcementScript(ReferenceAlias Marker1Alias, ReferenceAlias Marker2Alias, ReferenceAlias Marker3Alias, ReferenceAlias Marker4Alias, ReferenceAlias FailSafeMarkerAlias)
	CWReinforcementControllerScript CWReinforcementControllerS = (self as quest ) as CWReinforcementControllerScript
	
; 	CWScript.Log("CWSiegeScript", self + "RegisterSpawnAttackerAliasesWithCWReinforcementScript() calling RegisterSpawnAttackerAliases() on CWReinforcementControllerScript")
	CWReinforcementControllerS.RegisterSpawnAttackerAliases(Marker1Alias, Marker2Alias, Marker3Alias, Marker4Alias, FailSafeMarkerAlias)

EndFunction

Function RegisterSpawnDefenderAliasesWithCWReinforcementScript(ReferenceAlias Marker1Alias, ReferenceAlias Marker2Alias, ReferenceAlias Marker3Alias, ReferenceAlias Marker4Alias, ReferenceAlias FailSafeMarkerAlias)
	CWReinforcementControllerScript CWReinforcementControllerS = (self as quest ) as CWReinforcementControllerScript
	
; 	CWScript.Log("CWSiegeScript", self + "RegisterSpawnDefenderAliasesWithCWReinforcementScript() calling RegisterSpawnDefenderAliases() on CWReinforcementControllerScript")
	CWReinforcementControllerS.RegisterSpawnDefenderAliases(Marker1Alias, Marker2Alias, Marker3Alias, Marker4Alias, FailSafeMarkerAlias)

EndFunction

Function SetInfinitePoolsOnCWReinforcementScript()
	CWReinforcementControllerScript CWReinforcementControllerS = (self as quest ) as CWReinforcementControllerScript
	
; 	CWScript.Log("CWSiegeScript", self + "setInfinitePoolsOnCWReinforcementScript() calling SetInfinitePools() on CWReinforcementControllerScript")
	CWReinforcementControllerS.SetInfinitePools()	
EndFunction


Function SetPoolAttackerOnCWReinforcementScript(int BasePool, float AttackDeltaMult = 1.0, float scaleMult = 1.0, bool InfinitePool = False)
	CWReinforcementControllerScript CWReinforcementControllerS = (self as quest ) as CWReinforcementControllerScript
	
; 	CWScript.Log("CWSiegeScript", self + "SetPoolAttackerOnCWReinforcementScript() calling SetPoolAttacker() on CWReinforcementControllerScript")
	CWReinforcementControllerS.SetPoolAttacker(BasePool, AttackDeltaMult,  scaleMult, InfinitePool )
EndFunction

Function SetPoolDefenderOnCWReinforcementScript(int BasePool, float AttackDeltaMult = 1.0, float scaleMult = 1.0, bool InfinitePool = False)
	CWReinforcementControllerScript CWReinforcementControllerS = (self as quest ) as CWReinforcementControllerScript
	
; 	CWScript.Log("CWSiegeScript", self + "SetPoolDefenderOnCWReinforcementScript() calling SetPoolDefender() on CWReinforcementControllerScript")
	CWReinforcementControllerS.SetPoolDefender(BasePool, AttackDeltaMult,  scaleMult, InfinitePool )
EndFunction


function DisableAllAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling DisableAllAliases()")
	DisableImperialSonsAliases()
	DisableGenericAliases()
	DisableGenericAttackAliases()
	DisableGenericDefendAliases()

EndFunction

Function SetUpAliases(Location LocationOfSiege)
	DoneSettingUpAliases = false

; 	CWScript.Log("CWSiegeScript", self + "calling SetUpAliases()")
		
	DisableImperialSonsAliases()		;disables ALL the soldiers
	SetUpAttackerDefenderAliases(LocationOfSiege)		;shoves soldiers into Attacker/Defender aliases depending on the player's faction and which faction is attacking
	
	LogAttackDefenderAliases()			;for debugging
	
	DoneSettingUpAliases = true	
	
EndFunction

function TurnOnAliases(bool IsAttackQuest)
	DoneTurningOnAliases = false

; 	CWScript.Log("CWSiegeScript", self + "calling TurnOnAliases()")
	
	EnableAttackerDefenderAliases()		;Enables the Attacker/Defender aliases
	ResetAttackerDefenderAliases()		;Resets the Attacker/Defender aliases

	EnableGenericAliases()				;Enables anything put into the Generic Alias "array" by RegisterGenericAliases()
	ResetGenericAliases()				;Resets anything put into the Generic Alias "array" by RegisterGenericAliases()
	
	if IsAttackQuest
		EnableGenericAttackAliases()	;Enables anything put into the Generic Attack Alias "array" by RegisterGenericAttackAliases()
		ResetGenericAttackAliases()		;Resets anything put into the Generic Attack Alias "array" by RegisterGenericAttackAliases()
	Else
		EnableGenericDefendAliases()	;Enables anything put into the Generic Defend Alias "array" by RegisterGenericDefendAliases()
		ResetGenericDefendAliases()		;Resets anything put into the Generic Defend Alias "array" by RegisterGenericDefendAliases()
	EndIf
	
	DoneTurningOnAliases = true
	
EndFunction

Function LogAttackDefenderAliases()
	logAlias(Attacker1)
	logAlias(Attacker2)
	logAlias(Attacker3)
	logAlias(Attacker4)
	logAlias(Attacker5)
	logAlias(Attacker6)
	logAlias(Attacker7)
	logAlias(Attacker8)
	logAlias(Attacker9)
	logAlias(Attacker10)
	
	logAlias(Defender1)
	logAlias(Defender2)
	logAlias(Defender3)
	logAlias(Defender4)
	logAlias(Defender5)
	logAlias(Defender6)
	logAlias(Defender7)
	logAlias(Defender8)
	logAlias(Defender9)
	logAlias(Defender10)
	
EndFunction

function logAlias(ReferenceAlias AliasToPrintToLog)
; 	CWScript.Log("CWSiegeScript", self + "logAlias()" + AliasToPrintToLog + " is REFERENCE " + AliasToPrintToLog.GetReference())
EndFunction

Function SetUpAttackerDefenderAliases(Location LocationOfSiege)

; 	CWScript.Log("CWSiegeScript", self + "calling SetUpAttackerDefenderAliases()")

	if CWs.playerAllegiance == CWs.iImperials
		if CWs.IsPlayerAttacking(LocationOfSiege)
			SetUpAliasesImperialsAttacking()
			
		else ;playerAllegiance == Imperials, but Sons are attacking
			SetUpAliasesSonsAttacking()
			
		endif

	Elseif CWs.playerAllegiance == 2 ;Sons
		if CWs.IsPlayerAttacking(LocationOfSiege)
			SetUpAliasesSonsAttacking()
			
		else	;playerAllegiance == Sons, but Imperials are attakcing
			SetUpAliasesImperialsAttacking()

		endif

	Else	;unexpected player allegiance
; 		CWScript.Log("CWSiege", self + "WARNING: SetUpAliases() expected 1(Imperials) or 2(Sons) for CWs.PlayerAllegiance, got: " + CWs.PlayerAllegiance, 2)
		
	endif
	
EndFunction


function SetUpAliasesImperialsAttacking()
; 	CWScript.Log("CWSiegeScript", self + "calling SetUpAliasesImperialsAttacking()")
	Attacker1.ForceRefTo(ImperialAttacker1.GetReference())
	Attacker2.ForceRefTo(ImperialAttacker2.GetReference())
	Attacker3.ForceRefTo(ImperialAttacker3.GetReference())
	Attacker4.ForceRefTo(ImperialAttacker4.GetReference())
	Attacker5.ForceRefTo(ImperialAttacker5.GetReference())
	Attacker6.ForceRefTo(ImperialAttacker6.GetReference())
	Attacker7.ForceRefTo(ImperialAttacker7.GetReference())
	Attacker8.ForceRefTo(ImperialAttacker8.GetReference())
	Attacker9.ForceRefTo(ImperialAttacker9.GetReference())
	Attacker10.ForceRefTo(ImperialAttacker10.GetReference())
	
	Defender1.ForceRefTo(SonsDefender1.GetReference())
	Defender2.ForceRefTo(SonsDefender2.GetReference())
	Defender3.ForceRefTo(SonsDefender3.GetReference())
	Defender4.ForceRefTo(SonsDefender4.GetReference())
	Defender5.ForceRefTo(SonsDefender5.GetReference())
	Defender6.ForceRefTo(SonsDefender6.GetReference())
	Defender7.ForceRefTo(SonsDefender7.GetReference())
	Defender8.ForceRefTo(SonsDefender8.GetReference())
	Defender9.ForceRefTo(SonsDefender9.GetReference())
	Defender10.ForceRefTo(SonsDefender10.GetReference())	
EndFunction

function SetUpAliasesSonsAttacking()
; 	CWScript.Log("CWSiegeScript", self + "calling SetUpAliasesSonsAttacking()")
	Attacker1.ForceRefTo(SonsAttacker1.GetReference())
	Attacker2.ForceRefTo(SonsAttacker2.GetReference())
	Attacker3.ForceRefTo(SonsAttacker3.GetReference())
	Attacker4.ForceRefTo(SonsAttacker4.GetReference())
	Attacker5.ForceRefTo(SonsAttacker5.GetReference())
	Attacker6.ForceRefTo(SonsAttacker6.GetReference())
	Attacker7.ForceRefTo(SonsAttacker7.GetReference())
	Attacker8.ForceRefTo(SonsAttacker8.GetReference())
	Attacker9.ForceRefTo(SonsAttacker9.GetReference())
	Attacker10.ForceRefTo(SonsAttacker10.GetReference())
	
	Defender1.ForceRefTo(ImperialDefender1.GetReference())
	Defender2.ForceRefTo(ImperialDefender2.GetReference())
	Defender3.ForceRefTo(ImperialDefender3.GetReference())
	Defender4.ForceRefTo(ImperialDefender4.GetReference())
	Defender5.ForceRefTo(ImperialDefender5.GetReference())
	Defender6.ForceRefTo(ImperialDefender6.GetReference())
	Defender7.ForceRefTo(ImperialDefender7.GetReference())
	Defender8.ForceRefTo(ImperialDefender8.GetReference())
	Defender9.ForceRefTo(ImperialDefender9.GetReference())
	Defender10.ForceRefTo(ImperialDefender10.GetReference())	
EndFunction

function tryToDisableAlias(ReferenceAlias AliasToTry)
	ObjectReference AliasRef
	
	if AliasToTry
		AliasRef = AliasToTry.GetReference()
		
		if AliasRef
; 			CWScript.Log("CWSiegeScript", self + "tryToDisableAlias([" + AliasToTry +"]) disabling: " + AliasRef)
			AliasRef.Disable()
		endif
		
	EndIf
	
EndFunction

function tryToEnableAlias(ReferenceAlias AliasToTry)
	ObjectReference AliasRef
	
	if AliasToTry
		AliasRef = AliasToTry.GetReference()
		
		if AliasRef
; 			CWScript.Log("CWSiegeScript", self + "tryToEnableAlias([" + AliasToTry +"]) enabling: " + AliasRef)
			AliasRef.Enable()
		endif
		
	EndIf
	
EndFunction

function tryToResetAlias(ReferenceAlias AliasToTry)
	ObjectReference AliasRef
	
	if AliasToTry
		AliasRef = AliasToTry.GetReference()
	
		if AliasRef
; 			CWScript.Log("CWSiegeScript", self + "tryToResetAlias([" + AliasToTry +"]) reseting: " + AliasRef)
			AliasRef.Reset()
		endif
		
	EndIf
	
EndFunction


Function DisableImperialSonsAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling DisableImperialSonsAliases()")
	tryToDisableAlias(ImperialAttacker1)
	tryToDisableAlias(ImperialAttacker2)
	tryToDisableAlias(ImperialAttacker3)
	tryToDisableAlias(ImperialAttacker4)
	tryToDisableAlias(ImperialAttacker5)
	tryToDisableAlias(ImperialAttacker6)
	tryToDisableAlias(ImperialAttacker7)
	tryToDisableAlias(ImperialAttacker8)
	tryToDisableAlias(ImperialAttacker9)
	tryToDisableAlias(ImperialAttacker10)
	
	tryToDisableAlias(ImperialDefender1)
	tryToDisableAlias(ImperialDefender2)
	tryToDisableAlias(ImperialDefender3)
	tryToDisableAlias(ImperialDefender4)
	tryToDisableAlias(ImperialDefender5)
	tryToDisableAlias(ImperialDefender6)
	tryToDisableAlias(ImperialDefender7)
	tryToDisableAlias(ImperialDefender8)
	tryToDisableAlias(ImperialDefender9)
	tryToDisableAlias(ImperialDefender10)

	tryToDisableAlias(SonsAttacker1)
	tryToDisableAlias(SonsAttacker2)
	tryToDisableAlias(SonsAttacker3)
	tryToDisableAlias(SonsAttacker4)
	tryToDisableAlias(SonsAttacker5)
	tryToDisableAlias(SonsAttacker6)
	tryToDisableAlias(SonsAttacker7)
	tryToDisableAlias(SonsAttacker8)
	tryToDisableAlias(SonsAttacker9)
	tryToDisableAlias(SonsAttacker10)
	
	tryToDisableAlias(SonsDefender1)
	tryToDisableAlias(SonsDefender2)
	tryToDisableAlias(SonsDefender3)
	tryToDisableAlias(SonsDefender4)
	tryToDisableAlias(SonsDefender5)
	tryToDisableAlias(SonsDefender6)
	tryToDisableAlias(SonsDefender7)
	tryToDisableAlias(SonsDefender8)
	tryToDisableAlias(SonsDefender9)
	tryToDisableAlias(SonsDefender10)

EndFunction


function EnableAttackerDefenderAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling EnableAttackerDefenderAliases()")

	TryToEnableAlias(Attacker1)
	TryToEnableAlias(Attacker2)
	TryToEnableAlias(Attacker3)
	TryToEnableAlias(Attacker4)
	TryToEnableAlias(Attacker5)
	TryToEnableAlias(Attacker6)
	TryToEnableAlias(Attacker7)
	TryToEnableAlias(Attacker8)
	TryToEnableAlias(Attacker9)
	TryToEnableAlias(Attacker10)

	TryToEnableAlias(Defender1)
	TryToEnableAlias(Defender2)
	TryToEnableAlias(Defender3)
	TryToEnableAlias(Defender4)
	TryToEnableAlias(Defender5)
	TryToEnableAlias(Defender6)
	TryToEnableAlias(Defender7)
	TryToEnableAlias(Defender8)
	TryToEnableAlias(Defender9)
	TryToEnableAlias(Defender10)
	
EndFunction

Function ResetAttackerDefenderAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling ResetAttackerDefenderAliases()")

	TryToResetAlias(Attacker1)
	TryToResetAlias(Attacker2)
	TryToResetAlias(Attacker3)
	TryToResetAlias(Attacker4)
	TryToResetAlias(Attacker5)
	TryToResetAlias(Attacker6)
	TryToResetAlias(Attacker7)
	TryToResetAlias(Attacker8)
	TryToResetAlias(Attacker9)
	TryToResetAlias(Attacker10)

	TryToResetAlias(Defender1)
	TryToResetAlias(Defender2)
	TryToResetAlias(Defender3)
	TryToResetAlias(Defender4)
	TryToResetAlias(Defender5)
	TryToResetAlias(Defender6)
	TryToResetAlias(Defender7)
	TryToResetAlias(Defender8)
	TryToResetAlias(Defender9)
	TryToResetAlias(Defender10)

EndFunction

;Functions to manipulate Generic Aliases "Array"
Function DisableGenericAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling DisableGenericAliases()")

	TryToDisableAlias(Generic1)
	TryToDisableAlias(Generic2)
	TryToDisableAlias(Generic3)
	TryToDisableAlias(Generic4)
	TryToDisableAlias(Generic5)
	TryToDisableAlias(Generic6)
	TryToDisableAlias(Generic7)
	TryToDisableAlias(Generic8)
	TryToDisableAlias(Generic9)
	TryToDisableAlias(Generic10)

	TryToDisableAlias(Generic11)
	TryToDisableAlias(Generic12)
	TryToDisableAlias(Generic13)
	TryToDisableAlias(Generic14)
	TryToDisableAlias(Generic15)
	TryToDisableAlias(Generic16)
	TryToDisableAlias(Generic17)
	TryToDisableAlias(Generic18)
	TryToDisableAlias(Generic19)
	TryToDisableAlias(Generic20)
	
	TryToDisableAlias(Generic21)
	TryToDisableAlias(Generic22)
	TryToDisableAlias(Generic23)
	TryToDisableAlias(Generic24)
	TryToDisableAlias(Generic25)
	TryToDisableAlias(Generic26)
	TryToDisableAlias(Generic27)
	TryToDisableAlias(Generic28)
	TryToDisableAlias(Generic29)
	TryToDisableAlias(Generic30)
	
EndFunction

Function EnableGenericAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling EnableGenericAliases()")

	TryToEnableAlias(Generic1)
	TryToEnableAlias(Generic2)
	TryToEnableAlias(Generic3)
	TryToEnableAlias(Generic4)
	TryToEnableAlias(Generic5)
	TryToEnableAlias(Generic6)
	TryToEnableAlias(Generic7)
	TryToEnableAlias(Generic8)
	TryToEnableAlias(Generic9)
	TryToEnableAlias(Generic10)

	TryToEnableAlias(Generic11)
	TryToEnableAlias(Generic12)
	TryToEnableAlias(Generic13)
	TryToEnableAlias(Generic14)
	TryToEnableAlias(Generic15)
	TryToEnableAlias(Generic16)
	TryToEnableAlias(Generic17)
	TryToEnableAlias(Generic18)
	TryToEnableAlias(Generic19)
	TryToEnableAlias(Generic20)
	
	TryToEnableAlias(Generic21)
	TryToEnableAlias(Generic22)
	TryToEnableAlias(Generic23)
	TryToEnableAlias(Generic24)
	TryToEnableAlias(Generic25)
	TryToEnableAlias(Generic26)
	TryToEnableAlias(Generic27)
	TryToEnableAlias(Generic28)
	TryToEnableAlias(Generic29)
	TryToEnableAlias(Generic30)

	
	
EndFunction

Function ResetGenericAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling ResetGenericAliases()")

	TryToResetAlias(Generic1)
	TryToResetAlias(Generic2)
	TryToResetAlias(Generic3)
	TryToResetAlias(Generic4)
	TryToResetAlias(Generic5)
	TryToResetAlias(Generic6)
	TryToResetAlias(Generic7)
	TryToResetAlias(Generic8)
	TryToResetAlias(Generic9)
	TryToResetAlias(Generic10)

	TryToResetAlias(Generic11)
	TryToResetAlias(Generic12)
	TryToResetAlias(Generic13)
	TryToResetAlias(Generic14)
	TryToResetAlias(Generic15)
	TryToResetAlias(Generic16)
	TryToResetAlias(Generic17)
	TryToResetAlias(Generic18)
	TryToResetAlias(Generic19)
	TryToResetAlias(Generic20)
	
	TryToResetAlias(Generic21)
	TryToResetAlias(Generic22)
	TryToResetAlias(Generic23)
	TryToResetAlias(Generic24)
	TryToResetAlias(Generic25)
	TryToResetAlias(Generic26)
	TryToResetAlias(Generic27)
	TryToResetAlias(Generic28)
	TryToResetAlias(Generic29)
	TryToResetAlias(Generic30)

EndFunction


;Functions to manipulate GenericAttack Aliases "Array"
Function DisableGenericAttackAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling DisableGenericAttackAliases()")

	TryToDisableAlias(GenericAttack1)
	TryToDisableAlias(GenericAttack2)
	TryToDisableAlias(GenericAttack3)
	TryToDisableAlias(GenericAttack4)
	TryToDisableAlias(GenericAttack5)
	TryToDisableAlias(GenericAttack6)
	TryToDisableAlias(GenericAttack7)
	TryToDisableAlias(GenericAttack8)
	TryToDisableAlias(GenericAttack9)
	TryToDisableAlias(GenericAttack10)

	TryToDisableAlias(GenericAttack11)
	TryToDisableAlias(GenericAttack12)
	TryToDisableAlias(GenericAttack13)
	TryToDisableAlias(GenericAttack14)
	TryToDisableAlias(GenericAttack15)
	TryToDisableAlias(GenericAttack16)
	TryToDisableAlias(GenericAttack17)
	TryToDisableAlias(GenericAttack18)
	TryToDisableAlias(GenericAttack19)
	TryToDisableAlias(GenericAttack20)
	
	TryToDisableAlias(GenericAttack21)
	TryToDisableAlias(GenericAttack22)
	TryToDisableAlias(GenericAttack23)
	TryToDisableAlias(GenericAttack24)
	TryToDisableAlias(GenericAttack25)
	TryToDisableAlias(GenericAttack26)
	TryToDisableAlias(GenericAttack27)
	TryToDisableAlias(GenericAttack28)
	TryToDisableAlias(GenericAttack29)
	TryToDisableAlias(GenericAttack30)
	
EndFunction

Function EnableGenericAttackAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling EnableGenericAttackAliases()")

	TryToEnableAlias(GenericAttack1)
	TryToEnableAlias(GenericAttack2)
	TryToEnableAlias(GenericAttack3)
	TryToEnableAlias(GenericAttack4)
	TryToEnableAlias(GenericAttack5)
	TryToEnableAlias(GenericAttack6)
	TryToEnableAlias(GenericAttack7)
	TryToEnableAlias(GenericAttack8)
	TryToEnableAlias(GenericAttack9)
	TryToEnableAlias(GenericAttack10)

	TryToEnableAlias(GenericAttack11)
	TryToEnableAlias(GenericAttack12)
	TryToEnableAlias(GenericAttack13)
	TryToEnableAlias(GenericAttack14)
	TryToEnableAlias(GenericAttack15)
	TryToEnableAlias(GenericAttack16)
	TryToEnableAlias(GenericAttack17)
	TryToEnableAlias(GenericAttack18)
	TryToEnableAlias(GenericAttack19)
	TryToEnableAlias(GenericAttack20)
	
	TryToEnableAlias(GenericAttack21)
	TryToEnableAlias(GenericAttack22)
	TryToEnableAlias(GenericAttack23)
	TryToEnableAlias(GenericAttack24)
	TryToEnableAlias(GenericAttack25)
	TryToEnableAlias(GenericAttack26)
	TryToEnableAlias(GenericAttack27)
	TryToEnableAlias(GenericAttack28)
	TryToEnableAlias(GenericAttack29)
	TryToEnableAlias(GenericAttack30)

	
	
EndFunction

Function ResetGenericAttackAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling ResetGenericAttackAliases()")

	TryToResetAlias(GenericAttack1)
	TryToResetAlias(GenericAttack2)
	TryToResetAlias(GenericAttack3)
	TryToResetAlias(GenericAttack4)
	TryToResetAlias(GenericAttack5)
	TryToResetAlias(GenericAttack6)
	TryToResetAlias(GenericAttack7)
	TryToResetAlias(GenericAttack8)
	TryToResetAlias(GenericAttack9)
	TryToResetAlias(GenericAttack10)

	TryToResetAlias(GenericAttack11)
	TryToResetAlias(GenericAttack12)
	TryToResetAlias(GenericAttack13)
	TryToResetAlias(GenericAttack14)
	TryToResetAlias(GenericAttack15)
	TryToResetAlias(GenericAttack16)
	TryToResetAlias(GenericAttack17)
	TryToResetAlias(GenericAttack18)
	TryToResetAlias(GenericAttack19)
	TryToResetAlias(GenericAttack20)
	
	TryToResetAlias(GenericAttack21)
	TryToResetAlias(GenericAttack22)
	TryToResetAlias(GenericAttack23)
	TryToResetAlias(GenericAttack24)
	TryToResetAlias(GenericAttack25)
	TryToResetAlias(GenericAttack26)
	TryToResetAlias(GenericAttack27)
	TryToResetAlias(GenericAttack28)
	TryToResetAlias(GenericAttack29)
	TryToResetAlias(GenericAttack30)

EndFunction

;Functions to manipulate GenericDefend Aliases "Array"
Function DisableGenericDefendAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling DisableGenericDefendAliases()")

	TryToDisableAlias(GenericDefend1)
	TryToDisableAlias(GenericDefend2)
	TryToDisableAlias(GenericDefend3)
	TryToDisableAlias(GenericDefend4)
	TryToDisableAlias(GenericDefend5)
	TryToDisableAlias(GenericDefend6)
	TryToDisableAlias(GenericDefend7)
	TryToDisableAlias(GenericDefend8)
	TryToDisableAlias(GenericDefend9)
	TryToDisableAlias(GenericDefend10)

	TryToDisableAlias(GenericDefend11)
	TryToDisableAlias(GenericDefend12)
	TryToDisableAlias(GenericDefend13)
	TryToDisableAlias(GenericDefend14)
	TryToDisableAlias(GenericDefend15)
	TryToDisableAlias(GenericDefend16)
	TryToDisableAlias(GenericDefend17)
	TryToDisableAlias(GenericDefend18)
	TryToDisableAlias(GenericDefend19)
	TryToDisableAlias(GenericDefend20)
	
	TryToDisableAlias(GenericDefend21)
	TryToDisableAlias(GenericDefend22)
	TryToDisableAlias(GenericDefend23)
	TryToDisableAlias(GenericDefend24)
	TryToDisableAlias(GenericDefend25)
	TryToDisableAlias(GenericDefend26)
	TryToDisableAlias(GenericDefend27)
	TryToDisableAlias(GenericDefend28)
	TryToDisableAlias(GenericDefend29)
	TryToDisableAlias(GenericDefend30)
	
EndFunction

Function EnableGenericDefendAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling EnableGenericDefendAliases()")

	TryToEnableAlias(GenericDefend1)
	TryToEnableAlias(GenericDefend2)
	TryToEnableAlias(GenericDefend3)
	TryToEnableAlias(GenericDefend4)
	TryToEnableAlias(GenericDefend5)
	TryToEnableAlias(GenericDefend6)
	TryToEnableAlias(GenericDefend7)
	TryToEnableAlias(GenericDefend8)
	TryToEnableAlias(GenericDefend9)
	TryToEnableAlias(GenericDefend10)

	TryToEnableAlias(GenericDefend11)
	TryToEnableAlias(GenericDefend12)
	TryToEnableAlias(GenericDefend13)
	TryToEnableAlias(GenericDefend14)
	TryToEnableAlias(GenericDefend15)
	TryToEnableAlias(GenericDefend16)
	TryToEnableAlias(GenericDefend17)
	TryToEnableAlias(GenericDefend18)
	TryToEnableAlias(GenericDefend19)
	TryToEnableAlias(GenericDefend20)
	
	TryToEnableAlias(GenericDefend21)
	TryToEnableAlias(GenericDefend22)
	TryToEnableAlias(GenericDefend23)
	TryToEnableAlias(GenericDefend24)
	TryToEnableAlias(GenericDefend25)
	TryToEnableAlias(GenericDefend26)
	TryToEnableAlias(GenericDefend27)
	TryToEnableAlias(GenericDefend28)
	TryToEnableAlias(GenericDefend29)
	TryToEnableAlias(GenericDefend30)

	
	
EndFunction

Function ResetGenericDefendAliases()
; 	CWScript.Log("CWSiegeScript", self + "calling ResetGenericDefendAliases()")

	TryToResetAlias(GenericDefend1)
	TryToResetAlias(GenericDefend2)
	TryToResetAlias(GenericDefend3)
	TryToResetAlias(GenericDefend4)
	TryToResetAlias(GenericDefend5)
	TryToResetAlias(GenericDefend6)
	TryToResetAlias(GenericDefend7)
	TryToResetAlias(GenericDefend8)
	TryToResetAlias(GenericDefend9)
	TryToResetAlias(GenericDefend10)

	TryToResetAlias(GenericDefend11)
	TryToResetAlias(GenericDefend12)
	TryToResetAlias(GenericDefend13)
	TryToResetAlias(GenericDefend14)
	TryToResetAlias(GenericDefend15)
	TryToResetAlias(GenericDefend16)
	TryToResetAlias(GenericDefend17)
	TryToResetAlias(GenericDefend18)
	TryToResetAlias(GenericDefend19)
	TryToResetAlias(GenericDefend20)
	
	TryToResetAlias(GenericDefend21)
	TryToResetAlias(GenericDefend22)
	TryToResetAlias(GenericDefend23)
	TryToResetAlias(GenericDefend24)
	TryToResetAlias(GenericDefend25)
	TryToResetAlias(GenericDefend26)
	TryToResetAlias(GenericDefend27)
	TryToResetAlias(GenericDefend28)
	TryToResetAlias(GenericDefend29)
	TryToResetAlias(GenericDefend30)

EndFunction


function FailAttackQuest(locationAlias CityAlias)
; 	CWScript.Log("CWSiegeScript", self + "FailAttackQuest()")

	;fail the siege quest:
	CWs.CWSiegeObj.setStage(8999)

	CWs.FailCWObj(Hold.GetLocation())
	
	;fail the campaign
	;CWs.CWCampaignS.FailedMission = 1
	
	CWs.ContestedHoldWinner = CWs.GetDefender(CityAlias.GetLocation())
	
	;CWs.CWCampaign.setStage(255)

	while Game.GetPlayer().IsInLocation(CityAlias.GetLocation())
; 		CWScript.Log("CWSiegeScript", self + "FailAttackQuest() Waiting for player to leave City before stoping Siege quest")
		utility.wait(5)
	endwhile
	stop()

EndFunction

function FailDefenseQuest(locationAlias CityAlias)
; 	CWScript.Log("CWSiegeScript", self + "FailDefenseQuest()")

	;start the escape through the city quest
; 	CWScript.Log("CWSiegeScript", self + "FailDefenseQuest() CWs.CWEscapeCityStart.SendStoryEvent(" + CityAlias.GetLocation() +")")
	CWs.CWEscapeCityStart.SendStoryEvent(CityAlias.GetLocation(), CWs.GetRikkeOrGalmar())


; 	CWScript.Log("CWSiegeScript", self + "FailDefenseQuest() failing CWSiegeDefendObj quest and failing the campaign")	
	
	;fail the siege quest:
	CWs.CWSiegeObj.setStage(8999)
	
	CWs.FailCWObj(Hold.GetLocation())
	
	
	;Update the campaign objectives
	;CWs.CWCampaignObj.setStage(50)		;objective to flee the city with the Jarl
	
	;Fail the campaign
	;CWs.CWCampaignS.FailedMission = 1
	
	CWs.ContestedHoldWinner = CWs.GetAttacker(CityAlias.GetLocation())
	
	;CWs.CWCampaign.setstage(255)
	
	while Game.GetPlayer().IsInLocation(CityAlias.GetLocation())
; 		CWScript.Log("CWSiegeScript", self + "FailDefenseQuest() Waiting for player to leave City before stoping Siege quest")
		utility.wait(5)
	endwhile
	stop()

EndFunction

Function SucceedDefenseQuest(LocationAlias HoldAlias, LocationAlias CityAlias, ReferenceAlias MainGateExteriorAlias)
;SUCCESS!!! Defenders Win because attackers ran out of respawns
; CWScript.Log("CWSiegeScript", self + "SucceedDefenseQuest()")

;Removes this music from the stack
MUSCombatCivilWar.Remove()

;Prevent player activation of main gate into city
MainGateExteriorAlias.GetReference().BlockActivation(FALSE)

;Set Global Dialog Stuff
CWs.CWStateAttackStarted.SetValue(0)
CWs.CWStateAttackerBrokeThrough.SetValue(0)
CWs.CWStateDefenderFallingBack.SetValue(0)
CWs.CWStateDefenderLastStand.SetValue(0)
CWs.CWStateAttackerAtGate.SetValue(0)
CWs.CWStateAttackerOutOfReinforcements.SetValue(1)

CWs.CWSiegeObj.setStage(9000)

;obsolete:
CWs.CompleteCWObj(Hold.GetLocation())

CWs.ContestedHoldWinner = CWs.GetDefender(CityAlias.GetLocation())

;CWs.registerMissionSuccess()	- NOT counting final sieges as successful missions, since those are what increase the CWObj global values

;CWs.CWCampaign.setStage(255) -- OBSOLETE

while Game.GetPlayer().IsInLocation(CityAlias.GetLocation())
; 	CWScript.Log("CWSiegeScript", self + "SucceedDefenseQuest(): Waiting for player to leave City before stoping Siege quest")
	utility.wait(5)
endwhile
stop()


EndFunction


function TryToTurnOnCatapultAlias(ReferenceAlias CatapultAlias)
	ObjectReference CatapultRef = CatapultAlias.GetReference()
	
	If CatapultRef
; 		CWScript.Log("CWSiegeScript", self + "TryToTurnOnCatapultAlias() calling turnOn() on " + CatapultRef)
		(CatapultRef as CWCatapultScript).turnOn()
	Else
; 		CWScript.Log("CWSiegeScript", self + "TryToTurnOnCatapultAlias() is empty alias, not turning on:" + CatapultAlias)
	EndIf

endfunction

function TryToturnOffCatapultAlias(ReferenceAlias CatapultAlias)
	ObjectReference CatapultRef = CatapultAlias.GetReference()
	
	If CatapultRef
; 		CWScript.Log("CWSiegeScript", self + "TryToturnOffCatapultAlias() calling turnOff() on " + CatapultRef)
		(CatapultRef as CWCatapultScript).turnOff()
	Else
; 		CWScript.Log("CWSiegeScript", self + "TryToturnOffCatapultAlias() is empty alias, not turning off:" + CatapultAlias)
	EndIf

endfunction

bool function IsAttack()
; 	CWScript.Log("CWSiegeScript", self + "IsAttack()")

	return CWs.IsPlayerAttacking(City.GetLocation())
	
EndFunction

function StartCombatSoundsLoop()
	CombatSoundsLoopInstance = AMBCombatSoundsLoop.Play(game.GetPlayer())
	Sound.SetInstanceVolume(CombatSoundsLoopInstance, 0.5)

EndFunction

function StopCombatSoundsLoop()
	Sound.StopInstance(CombatSoundsLoopInstance)
	
EndFunction

function setupInteriorSiege(Location SiegeLocation, ObjectReference FieldCORef, ObjectReference CityCenterMarker)
; 	CWScript.Log("CWSiegeScript", self + "setupInteriorSiege(" + SiegeLocation + ")")
	
	;start FortSiege
	
	;safety check, in case you just finished a fort or capital siege, and before it finished shutting down, started the final battle - highly unlikely, put I can envision happening
	int waitingFor
	While CWs.CWFortSiegeCapital.IsStopped() == False
		waitingFor += 1
		utility.wait(1)
	
; 		CWScript.Log("CWSiegeScript", self + "setupInteriorSiege(" + SiegeLocation + ") WAITING for CWFortSiegeCapital.IsStopped() == false. Have been waiting for:" + waitingFor, 1, true, true)
		
		;this is important enough to make sure even if we aren't explicitly testing in Civil War debug mode we get a message about it
; 		debug.trace(self + "CWSiegeScript: setupInteriorSiege(" + SiegeLocation + ") WAITING for CWFortSiegeCapital.IsStopped() == false. Have been waiting for:" + waitingFor, 1)
	EndWhile
	
	
	CWs.CWFortSiegeSpecialStart.SendStoryEventAndWait(SiegeLocation, FieldCORef, CityCenterMarker, aiValue1 = 3)
	CWs.CWFinaleStart.SendStoryEvent(SiegeLocation)

EndFunction

function ToggleOffComplexWIInteractions(LocationAlias LocationAliasToToggle)
; 	CWScript.Log("CWSiegeScript", self + "ToggleOffComplexWIInteractions(" + LocationAliasToToggle + ") calling function on CWScript")
	CWs.ToggleOffComplexWIInteractions(LocationAliasToToggle)

EndFunction

function ToggleOnComplexWIInteractions(LocationAlias LocationAliasToToggle)
; 	CWScript.Log("CWSiegeScript", self + "ToggleOnComplexWIInteractions(" + LocationAliasToToggle + ") calling function on CWScript")
	CWs.ToggleOnComplexWIInteractions(LocationAliasToToggle)

EndFunction 


scene Property CWAttackerStartingScene  Auto  
scene Property CWSiegeDefenderStartingScene  Auto  

Quest Property CWPrepareCity  Auto  

sound Property AMBCivilWarBattleDistantLP  Auto  

sound Property AMBCivilWarBattleStart  Auto  

sound Property AMBCivilWarBattleStartDistant  Auto  

ObjectReference Property WhiterunAmbExt01  Auto  

ObjectReference Property WhiterunAmbExt02  Auto  

int Property AMBDistantBattleSoundInstance Auto
{Don't assign a number, gets one when the sound is played as a way to refer to it}
int Property AMBDistantBattleStartInstance Auto
{Don't assign a number, gets one when the sound is played as a way to refer to it}
int Property AMBCloseBattleSoundInstance Auto
{Don't assign a number, gets one when the sound is played as a way to refer to it}


ObjectReference Property WhiterunAmbExt03  Auto  

GlobalVariable Property CWDistantCatapultsAMB  Auto  
