scriptname _Arissa_iNPC_Behavior extends _Arissa_iNPC_Main conditional

GlobalVariable property GameHour auto
Message property _ArissaDismissMessageWait auto
Message property _ArissaBlockedMessage auto
Message property _ArissaDismissMessageWedding auto
Quest property _Arissa_MQ01 auto
Quest property _Arissa_MQ02 auto
Quest property _Arissa_TownRoam_Dawnstar auto
Quest property _Arissa_TownRoam_Falkreath auto
Quest property _Arissa_TownRoam_Markarth auto
Quest property _Arissa_TownRoam_Morthal auto
Quest property _Arissa_TownRoam_Riften auto
Quest property _Arissa_TownRoam_Solitude auto
Quest property _Arissa_TownRoam_Whiterun auto
Quest property _Arissa_TownRoam_Windhelm auto
Quest property _Arissa_Commentary_DungeonEntrances auto
Quest property _Arissa_Commentary_DangerAhead auto
Quest property _Arissa_Commentary_ImpressiveView auto
Keyword property WICommentEntrances auto
Keyword property WICommentDanger auto
Keyword property WICommentSetPiece auto
int property CurrentArmorCommentIndex auto conditional hidden
ObjectReference property _Arissa_ArmorStorageRef auto

Quest myTownRoamQuest = none

;====================================================================================================================
;
;
;													ARISSA'S BEHAVIOR
;
;
;====================================================================================================================

Function StartTownRoam(int iTownRoamArea)
	if CanTownRoam
		if iTownRoamArea > -1
			if iTownRoamArea == 8
				;Ignoring.
				return
			endif
			IsTownRoaming = true
			IsFollowing = false
			DisengageFollowBehavior()
			if iTownRoamArea == 0
				ArissaDebug(1, "Trying to start town roam in Windhelm.")
				_Arissa_TownRoam_Windhelm.Start()
				myTownRoamQuest = _Arissa_TownRoam_Windhelm
			elseif iTownRoamArea == 1
				ArissaDebug(1, "Trying to start town roam in Riften.")
				_Arissa_TownRoam_Riften.Start()
				myTownRoamQuest = _Arissa_TownRoam_Riften
			elseif iTownRoamArea == 2
				ArissaDebug(1, "Trying to start town roam in Markarth.")
				_Arissa_TownRoam_Markarth.Start()
				myTownRoamQuest = _Arissa_TownRoam_Markarth
			elseif iTownRoamArea == 3
				ArissaDebug(1, "Trying to start town roam in Whiterun.")
				_Arissa_TownRoam_Whiterun.Start()
				myTownRoamQuest = _Arissa_TownRoam_Whiterun
			elseif iTownRoamArea == 4
				ArissaDebug(1, "Trying to start town roam in Solitude.")
				_Arissa_TownRoam_Solitude.Start()
				myTownRoamQuest = _Arissa_TownRoam_Solitude
			elseif iTownRoamArea == 5
				ArissaDebug(1, "Trying to start town roam in Dawnstar.")
				_Arissa_TownRoam_Dawnstar.Start()
				myTownRoamQuest = _Arissa_TownRoam_Dawnstar
			elseif iTownRoamArea == 6
				ArissaDebug(1, "Trying to start town roam in Falkreath.")
				_Arissa_TownRoam_Falkreath.Start()
				myTownRoamQuest = _Arissa_TownRoam_Falkreath
			elseif iTownRoamArea == 7
				ArissaDebug(1, "Trying to start town roam in Morthal.")
				_Arissa_TownRoam_Morthal.Start()
				myTownRoamQuest = _Arissa_TownRoam_Morthal
			endif	
		endif
	endif
endFunction

Function StopTownRoam()
	ArissaDebug(1, "Trying to stop town roam.")
	IsTownRoaming = false
	IsFollowing = true
	EngageFollowBehavior()
	if myTownRoamQuest
		myTownRoamQuest.Stop()
		myTownRoamQuest = none
	endif
	;_Arissa_ArmorStorageRef.RemoveAllItems(iNPC.GetActorRef())
endFunction

function StartCommentQuest(keyword akKeyword)
	ArissaDebug(3, "Attempting to start comment quest based on keyword " + akKeyword)
	if akKeyword == WICommentEntrances
		_Arissa_Commentary_DungeonEntrances.Start()
	elseif akKeyword == WICommentDanger
		_Arissa_Commentary_DangerAhead.Start()
	elseif akKeyword == WICommentSetPiece
		_Arissa_Commentary_ImpressiveView.Start()
	endif
endFunction

;====================================================================================================================
;
;
;													ARISSA'S MEMORY
;
;
;====================================================================================================================


;#region ============ ARISSA QUEST FLAGS ===============

;#endregion

;#region ============= KNOWLEDGE FLAGS =================

	;GENERAL

;bool property PlayerAction_HitArissaOutOfCombatRepeatedly = false auto conditional hidden
;bool property PlayerAction_HitArissaUntilBleedout = false auto conditional hidden
;bool property PlayerAction_LeftArissaInDangerousArea = false auto conditional hidden
;bool property PlayerAction_SaidWaitNeverCameBack = false auto conditional hidden
;bool property PlayerAction_AvoidedBailingHerOut = false auto conditional hidden
;bool property PlayerAction_StiffedArissaOnDungeonLoot = false auto conditional hidden
;bool property PlayerAction_KilledParthunaax = false auto conditional hidden
;int property PlayerAction_LiedAboutAssassination = 0 auto conditional hidden									;0 = has not lied; 1 = Lied about killing male; 2 = lied about killing female
;int property PlayerAction_KilledDomesticAnimal = 0 auto conditional hidden										;0 = has not killed; 1 = chicken; 2 = cow; 3 = dog
;bool property PlayerAction_TriedAmuletOfMara = false auto conditional hidden
;bool property PlayerAction_AskedArissaToCookSomething = false auto conditional hidden
;bool property PlayerAction_WonBrawlWithArissa = false auto conditional hidden

	;CONVERSATION

bool property ArissaKnows_LokirIsDead = false auto conditional hidden
int property ArissaKnows_BackgroundChoice = 0 auto conditional hidden									;1 = Dragonborn 2 = Warrior 3 = Mage 4 = Rogue 5 = Multi-class 6 = Didn't say
bool property ArissaKnows_PlayerWasPrisoner = false auto conditional hidden
bool property ArissaTalkedAbout_MQ01_Trust = false auto conditional hidden
bool property ArissaTalkedAbout_MQ01_Travel = false auto conditional hidden
bool property ArissaTalkedAbout_MQ02_Past = false auto conditional hidden
bool property ArissaTalkedAbout_Weapon_PaleBlade = false auto conditional hidden
bool property ArissaMetCamilla = false auto conditional hidden

	;THEFT
bool property ArissaTalkedAbout_TownTheft = false auto conditional hidden
bool property PlayerWantsTheftMoney = false auto conditional hidden
bool property ArissaHasStolen = false auto conditional hidden
bool property ArissaGaveInitialGold = false auto conditional hidden


	;STATUS

bool property ArissaKnows_PlayerCanShout = false auto conditional hidden
bool property ArissaKnows_PlayerCanAbsorbDragonSouls = false auto conditional hidden
;bool property ArissaKnows_PlayerOwnsHouse = false auto conditional hidden
;bool property ArissaKnows_PlayerIsVampire = false auto conditional hidden
;bool property LastVampireState = false auto conditional hidden											;Used for starting dialogue for becoming or curing vampirism
;bool property ArissaKnows_PlayerIsWerewolf = false auto conditional hidden
;bool property LastWerewolfState = false auto conditional hidden										;Used for starting dialogue for becoming or curing lycanthropy
bool property ArissaKnows_PlayerIsCannibal = false auto conditional hidden								;Perma-disband
bool property ArissaKnows_PlayerSteals = false auto conditional hidden
bool property ArissaKnows_SeenPuzzleDoorBefore = false auto conditional hidden


	;CIVIL WAR
;/
bool property ArissaKnows_PlayerIsImperial = false auto conditional hidden
bool property ArissaKnows_PlayerIsStormcloak = false auto conditional hidden
bool property ArissaPresentWhen_PlayerBeginsLastBattle = false auto conditional hidden
int property ArissaKnows_CivilWarOutcome = 0 auto conditional hidden									;0 = Hasn't finished; 1 = Stormcloaks won; 2 = Imperials won (Implicitly means
/;																								;                                          she knows what side you fought on)

	;MAIN QUEST
	;Arissa cannot enter Sovngarde.

bool property ArissaTalkedAbout_MQ102_Helgen = false auto conditional hidden
bool property ArissaTalkedAbout_MQ102_WhiterunReminder = false auto conditional hidden
bool property ArissaTalkedAbout_MQ103_DragonstoneComment = false auto conditional hidden
bool property ArissaTalkedAbout_MQ103_DragonstoneReminder = false auto conditional hidden
int property MQ102TalkCounter = 1 auto conditional hidden

;/
bool property ArissaKnows_ParthunaaxIsDragon = false auto conditional hidden
bool property ArissaKnows_PlayerIntendsToKillParthunaax = false auto conditional hidden
bool property ArissaKnows_PlayerKilledParthunaax = false auto conditional hidden
bool property ArissaKnows_PlayerKilledAlduin = false auto conditional hidden
/;

bool property ArissaPresentWhen_MQ102_PlayerAdmitsBeingPrisoner = false auto conditional hidden
bool property ArissaTalkedAbout_MQ104_PlayerIsDragonborn = false auto conditional hidden

;/
bool property ArissaPresentWhen_PlayerDefeatedDragon = false auto conditional hidden
bool property ArissaPresentWhen_MetGreybeards = false auto conditional hidden
bool property ArissaPresentWhen_MetDelphine = false auto conditional hidden
bool property ArissaPresentWhen_MetEsbern = false auto conditional hidden
bool property ArissaPresentWhen_ProphecyRevealed = false auto conditional hidden
bool property ArissaPresentWhen_MetSeptimusSignus = false auto conditional hidden
bool property ArissaPresentWhen_RetrievedElderScroll = false auto conditional hidden
bool property ArissaPresentWhen_UsedTimeWound = false auto conditional hidden
bool property ArissaPresentWhen_PlayerNegotiatedCeasefire = false auto conditional hidden
/;
;bool property ArissaPresentWhen_PlayerJumpedIntoSovngardePortal = false auto conditional hidden

	;COMPANIONS
	;Arissa cannot enter the Skyforge ritual chamber
	;Arissa is intrigued by Lycanthropy
;/
bool property ArissaKnows_PlayerIsCompanion = false auto conditional hidden
bool property ArissaKnows_PlayerHadBloodRitual = false auto conditional hidden
bool property ArissaKnows_KodlakIsDead = false auto conditional hidden
bool property ArissaKnows_PlayerDestroyedSilverHand = false auto conditional hidden
bool property ArissaKnows_PlayerIsFighterGM = false auto conditional hidden
/;
	;COLLEGE OF WINTERHOLD
;/
bool property ArissaKnows_PlayerIsMage = false auto conditional hidden
bool property ArissaPresentWhen_DiscoveredEye = false auto conditional hidden
bool property ArissaPresentWhen_MetAugur = false auto conditional hidden
bool property ArissaPresentWhen_DiscoveredDeadArchmage = false auto conditional hidden
bool property ArissaPresentWhen_RetrievedStaffOfMagus = false auto conditional hidden
bool property ArissaKnows_PlayerIsMageGM = false auto conditional hidden								;Player defeated Ancano
/;
	;THIEVES GUILD

	;Make sure to handle TB08B correctly! Arissa needs dialogue for when the player comes to Bronze Water Cave.
	;You cannot take a follower into the Twilight Sepulcher.
;/
bool property ArissaKnows_PlayerIsThief = false auto conditional hidden
bool property ArissaKnows_PlayerIsNightingale = false auto conditional hidden
bool property ArissaPresentWhen_PlayerExtortsCitizens = false auto conditional hidden
bool property ArissaPresentWhen_PlayerRaidedGoldenGlow = false auto conditional hidden
bool property ArissaPresentWhen_MeadTastingRuined = false auto conditional hidden
int property ArissaPresentWhen_PlayerConfrontedGulumEl = 0 auto conditional hidden						;0 = Not confronted; 1 = Player negotiated with him; 2 = Player killed him
bool property ArissaPresentWhen_PlayerShotAndStabbed = false auto conditional hidden					;Potential romance dialogue opportunity
bool property ArissaKnows_AboutNightingales = false auto conditional hidden							;End of TG06
bool property ArissaPresentWhen_NocturnalRevealed = false auto conditional hidden
bool property ArissaKnows_GuildRestored = false auto conditional hidden								;She finds out from Sapphire after quest completion
bool property ArissaKnows_PlayerIsThiefGM = false auto conditional hidden								;She finds out from Sapphire after quest completion, regardless of whether she attends ceremony
/;

	;DARK BROTHERHOOD
	;Where should Arissa stay after player gets abducted?
	;Arissa will disband with the player if she discovers (s)he is a member of the Dark Brotherhood; "I'm not going to feel comfortable around someone who worships death."
	;Arissa will question the player (and impacts her Regard) if he kills Grelod, but it will be made up for (plus some) if the player destroys the Guild.
	;Arissa will trust the player again if he attacks one of the Guild members and doesn't pay the fine.
;/
bool property ArissaPresentWhen_MetAventus = false auto conditional hidden
bool property ArissaPresentWhen_KilledGrelod = false auto conditional hidden
bool property ArissaKnows_PlayerIsJoiningDB = false auto conditional hidden							;After killing someone for Astrid, before visiting the Sanctuary
bool property ArissaKnows_PlayerIsAssassin = false auto conditional hidden								;Discovered after admitting to seen murder OR visiting the Sanctuary; Arissa leaves until player breaks tenant
bool property ArissaKnows_PlayerBrokeTenant = false auto conditional hidden 							;Has the player already broken a tenant? This method can't be used twice.
bool property ArissaPresentWhen_PlayerAbducted = false auto conditional hidden
int property ArissaKnows_DarkBrotherhoodFate = 0 auto conditional hidden								;0 = Doesn't know; 1 = Guild restored (perma-disband); 2 = Guild destroyed
/;	
	;DAWNGUARD
	;Arissa cannot enter the Soul Cairn.
;/
int property ArissaKnows_PlayerChoseSide = 0 auto conditional hidden									;0 = Hasn't chosen yet; 1 = Chose Dawnguard; 2 = Chose Vampires
bool property ArissaPresentWhen_MetSerana = false auto conditional hidden
bool property ArissaPresentWhen_RetrievedAurielsBow = false auto conditional hidden
bool property ArissaPresentWhen_MetGelebor = false auto conditional hidden								;Gelebor = one of the last two Snow Elves
bool property ArissaKnows_PlayerDefeatedHarkon = false auto conditional hidden
/;
	;DRAGONBORN
	;Arissa cannot enter Apocrypha.
;/
bool property ArissaPresentWhen_AttackedByCultists = false auto conditional hidden
bool property ArissaPresentWhen_PlayerSleepwalks = false auto conditional hidden
bool property ArissaPresentWhen_PlayerFreesSkaal = false auto conditional hidden
bool property ArissaKnows_PlayerReadyToFaceMiraak = false auto conditional hidden
bool property ArissaKnows_PlayerDefeatedMiraak = false auto conditional hidden
/;
	;DAEDRIC QUESTS
;/
bool property ArissaPresentWhen_Azura_Completed = false auto conditional hidden
bool property ArissaPresentWhen_Boethiah_AskedToSacrifice = false auto conditional hidden
bool property ArissaPresentWhen_Boethiah_Completed = false auto conditional hidden
int property ArissaPresentWhen_Clavicus_Completed = 0 auto conditional hidden							;0 = Incomplete; 1 = Player killed Barbas; 2 = Player saved Barbas
bool property ArissaPresentWhen_Hermaeus_Completed = false auto conditional hidden
int property ArissaPresentWhen_Hircine_Completed = 0 auto conditional hidden							;0 = Incomplete; 1 = Player killed Sinding; 2 = Player saved Sinding
int property ArissaPresentWhen_Malacath_Completed = 0 auto conditional hidden
int property ArissaPresentWhen_Dagon_Completed = 0 auto conditional hidden								;0 = Incomplete; 1 = Player killed Silus; 2 = Player saved Silus
bool property ArissaPresentWhen_Mephala_Completed = false auto conditional hidden
bool property ArissaPresentWhen_Meridia_Completed = false auto conditional hidden
bool property ArissaPresentWhen_MolagBal_PlayerIsRetrievingLogrof = false auto conditional hidden
bool property ArissaPresentWhen_MolagBal_Complete = false auto conditional hidden
bool property ArissaPresentWhen_Namira_PlayerIsRetrievingVerulus = false auto conditional hidden
bool property ArissaPresentWhen_Namira_Complete = false auto conditional hidden							;Perma-disband, optionally attack the player
bool property ArissaPresentWhen_Peryite_Complete = false auto conditional hidden
bool property ArissaPresentWhen_Sanguine_PlayerPassesOut = false auto conditional hidden				;Tell the player about the crazy stuff they did together. Transport her somewhere else temporarily.
/;
	;SIDE QUESTS
;/
;Solitude
bool property ArissaPresentWhen_AttendedFestival = false auto conditional hidden						;Tending the Flames (MS05)
bool property ArissaPresentWhen_PlayerDefeatedPotema = false auto conditional hidden					;The Wolf Queen Awakened (MS06)
;Rorikstead
bool property ArissaPresentWhen_ErikTheSlayerAsksForHelp = false auto conditional hidden				;Erik the Slayer (RoriksteadFreeform)
;Markarth
bool property ArissaPresentWhen_SybilOfDibellaDelivered = false auto conditional hidden				;The Heart of Dibella (T01)
int property ArissaPresentWhen_PlayerSentToCidhnaMine = 0 auto conditional hidden						;No One Escapes Cidhna Mine (MS02)	0 = Not sent to mine; 1 = Sent to mine, didn't fight back; 2 = sent to mine, fought back
;Riften
bool property ArissaPresentWhen_GhostOfFourThievesSeen = false auto conditional hidden					;Unfathomable Depths (MS04)
;Whiterun
bool property ArissaPresentWhen_SaadiaQuestStarted = false auto conditional hidden						;In my Time Of Need (MS08)
int property ArissaPresentWhen_SaadiaFateDecided = 0 auto conditional hidden							;In my Time Of Need (MS08) 0 = Incomplete; 1 = Killed Kematu; 2 = Turned in Saadia
;Windhelm
int property ArissaPresentWhen_WindhelmKillerKilled = 0 auto conditional hidden 						;Blood on the Ice (MS11) 0 = Incomplete; 1 = Killed Calixto; 2 = Killed Calixto and read his Journal
;Riverwood
bool property ArissaRemindsGettingClawBackToPlayer = false auto conditional hidden						;The Golden Claw (MS13)
bool property ArissaPresentWhen_ClawQuestStarted = false auto conditional hidden						;The Golden Claw (MS13)
bool property ArissaPresentWhen_ClawReturned = false auto conditional hidden							;The Golden Claw (MS13)							
bool property ArissaTalkedToCamilla = false auto conditional hidden										;Arissa has sandbox dialogue with Camilla when in the Riverwood Trader
/;
	;EQUIPMENT REACTIONS

bool property ArissaCommentedOn_Armor_Iron = false auto conditional hidden			;_Arissa_CurrentArmorCommentIndex = 1
bool property ArissaCommentedOn_Armor_Steel_1 = false auto conditional hidden		;_Arissa_CurrentArmorCommentIndex = 2
bool property ArissaCommentedOn_Armor_Steel_2 = false auto conditional hidden		;_Arissa_CurrentArmorCommentIndex = 3
bool property ArissaCommentedOn_Armor_Dwarven = false auto conditional hidden		;_Arissa_CurrentArmorCommentIndex = 4
bool property ArissaCommentedOn_Armor_Orcish = false auto conditional hidden		;_Arissa_CurrentArmorCommentIndex = 5
bool property ArissaCommentedOn_Armor_Ebony = false auto conditional hidden			;_Arissa_CurrentArmorCommentIndex = 6
bool property ArissaCommentedOn_Armor_Dragonbone = false auto conditional hidden	;_Arissa_CurrentArmorCommentIndex = 7
bool property ArissaCommentedOn_Armor_Leather = false auto conditional hidden		;_Arissa_CurrentArmorCommentIndex = 8
bool property ArissaCommentedOn_Armor_Bandit_1 = false auto conditional hidden		;_Arissa_CurrentArmorCommentIndex = 10
bool property ArissaCommentedOn_Armor_Bandit_2 = false auto conditional hidden		;_Arissa_CurrentArmorCommentIndex = 10
bool property ArissaCommentedOn_Armor_Scale = false auto conditional hidden			;_Arissa_CurrentArmorCommentIndex = 11
bool property ArissaCommentedOn_Armor_Imperial = false auto conditional hidden		;_Arissa_CurrentArmorCommentIndex = 12
bool property ArissaCommentedOn_Armor_Stormcloak = false auto conditional hidden	;_Arissa_CurrentArmorCommentIndex = 13
bool property ArissaCommentedOn_Armor_AncientNord = false auto conditional hidden	;_Arissa_CurrentArmorCommentIndex = 14

bool property Arissa_CommentedOn_PuzzleDoor = false auto conditional hidden

;@TODO: ;Missing in Action (MS09) - See about letting Arissa use speechcraft on Idolaf Battle-Born
;@TODO: ;Infiltration (dunTrevasWatchQST) - Mention "I wonder if this leads inside Treva's Watch?" if on the quest and approaching the secret entrance
;@TODO: ;The Pale Lady (dunFrostmereCryptQST) Mention "That... is one wicked looking blade." when seeing The Pale Blade
;@TODO: ;A Scroll for Anska (dunHighgateRuinsQST) Don't attack Anska by mistake
;@TODO: ;Test what happens during the Vision sequence of the main quest on the Throat of the World
;@TODO: ;Test what happens during the Vision sequence of Waking Nightmare
;@TODO: ;Azura quest: Arissa cannot enter Azura's Star
;@TODO: ;Vaermina quest: Arissa cannot enter Nightcaller Temple
;@TODO: ;Meridia quest: Don't drop Arissa from the sky!

;#endregion

; ========= Ambient Dialogue System =========
Topic property _Arissa_DialoguePlaceKnowledgeSharedInfo auto
Topic property _Arissa_AmbientDialogueShared auto

float property NO_REPEAT_TIMEOUT = 60.0 autoReadOnly
int property CurrentAmbientCommentIndex = 0 auto conditional hidden

GlobalVariable property _Arissa_CurrentHold auto

; - Ambient dialogue-specific locations
Location property SolitudeLocation auto
Location property MarkarthLocation auto
Location property WhiterunLocation auto
Location property RiftenLocation auto
Location property RiftenThievesGuildHeadquartersLocation auto
Location property WindhelmLocation auto
Location property DawnstarLocation auto
Location property RiverwoodLocation auto
Location property FalkreathLocation auto
Location property LabyrinthianLocation auto
Location property WinterholdLocation auto
Location property MorthalLocation auto
Location property HelgenLocation auto
Location property BlackreachLocation auto
Location property IvarsteadLocation auto
Location property KarthwastenLocation auto
Location property BleakFallsBarrowLocation auto
Location property ShorsStoneLocation auto
Location property HighHrothgarLocation auto
Location property WinterholdCollegeLocation auto
Location property KynesgroveLocation auto
Location property ThalmorEmbassyLocation auto
Location property FrostflowLighthouseLocation auto
Location property SolitudeBluePalaceLocation auto
Location property YsgramorsTombLocation auto
Location property NightcallerTempleLocation auto
Location property DragonBridgeLocation auto
Location property RoriksteadLocation auto
Location property SolitudeCastleDourLocation auto
Location property WindhelmPalaceOfTheKingsLocation auto
Location property SolitudeRadiantRaimentsLocation auto
Location property RiftenRaggedFlagonLocation auto
Location property RiftenRatwayLocation auto
Location property RiftenMistveilKeepLocation auto
Location property EldergleamSanctuaryLocation auto
Location property GlenmorilCovenLocation auto
Location property MarkarthUnderstoneKeepLocation auto
Location property WhiterunHonningbrewMeaderyLocation auto
Location property ThroatoftheWorldLocation auto

; - Ambient dialogue-specific actors
Actor property CamillaValeriusREF auto
Actor property LucanValeriusREF auto
Actor property UlfricREF auto
Actor property FridaREF auto
Actor property MavenRef auto
Actor property FalionRef auto
Actor property KlepprRef auto
Actor property FrabbiRef auto
Actor property ValgaViniciaRef auto
Actor property OdarREF auto
Actor property SybilleStentorREF auto
Actor property DA05SindingHumanREF auto
Actor property ToniliaRef auto
Actor property SiddgeirRef auto
Actor property IdgrodRavencroneREF auto
Actor property LailaRef auto
Actor property ElisifTheFairREF auto
Actor property DagurRef auto
Actor property AdrianneAvenicciREF auto
Actor property WylandriahRef auto
Actor property OndolemarREF auto
ReferenceAlias property FalkreathJarl auto
ReferenceAlias property MorthalJarl auto
ReferenceAlias property RiftenJarl auto
ReferenceAlias property SolitudeJarl auto

; - Ambient dialogue-specific properties
Quest property CW auto
Quest property CWObj auto
Quest property TG01 auto
Quest property TG08A auto
Quest property MG01Quest auto
Quest property MS14Quest auto
Quest property MS01 auto
Quest property MS05 auto
Quest property DA16 auto
Quest property DA05 auto
GlobalVariable property CWSons auto
GlobalVariable property CWImperial auto
Keyword property LocTypePlayerHouse auto
Keyword property LocTypeJail auto
Keyword property LocTypeInn auto
faction property CWImperialFaction auto
faction property CWSonsFaction auto

int[] no_repeat_list
int[] index_exclusion_list
bool stack_has_index
int stashed_norepeat_index
int last_selected_index

Event OnUpdate()
	ArissaDebug(5, "[Arissa] Clearing no-repeat list.")
	no_repeat_list = new int[64]
endEvent

Event OnUpdateGameTime()
	if _Arissa_Setting_SuppressDialogue.GetValueInt() != 2
		PlayChatterDialogue()
	endif
	if _Arissa_Setting_AllowChatter.GetValueInt() == 2
		RegisterForSingleUpdateGameTime(_Arissa_Setting_ChatterFrequency.GetValueInt())
	endif
endEvent

function SetAllowChatter()
	if _Arissa_Setting_AllowChatter.GetValueInt() == 2
		RegisterForSingleUpdateGameTime(_Arissa_Setting_ChatterFrequency.GetValueInt())
	else
		UnregisterForUpdateGameTime()
	endif
endFunction

function PlayPlaceKnowledgeDialogue(Location akLocation)
	ArissaDebug(5, "[Arissa] Playing dialogue based on user prompt.")
	stashed_norepeat_index = 0
	CurrentAmbientCommentIndex = 0
	if akLocation
		int[] IndexStack = new int[99]
		GetLocationDialogueSituationIndex(IndexStack, akLocation)
		GetKeywordDialogueSituationIndex(IndexStack, akLocation, true)
		GetHoldDialogueSituationIndex(IndexStack, _Arissa_CurrentHold.GetValueInt())
		CurrentAmbientCommentIndex = GetSituationIndex(IndexStack, abDontRandomize = True)
	endif

	if CurrentAmbientCommentIndex != 0
		iNPC_Actor.Say(_Arissa_DialoguePlaceKnowledgeSharedInfo)
	else
		ArissaDebug(5, "[Arissa] Couldn't find suitable dialogue for this situation.")
		CurrentAmbientCommentIndex = -1
		iNPC_Actor.Say(_Arissa_DialoguePlaceKnowledgeSharedInfo)
	endif
endFunction

function PlayAmbientDialogue(Location akLocation)
	if _Arissa_Setting_SuppressDialogue.GetValueInt() == 2 || _Arissa_Setting_AllowAnnounceNewArea.GetValueInt() == 1
		return
	endif
	stashed_norepeat_index = 0
	CurrentAmbientCommentIndex = 0
	if MeetsDialoguePrereqs()
		; Roll for chance to play dialogue.
		float roll = Utility.RandomFloat(0.01, 1.0)
		ArissaDebug(5, "[Arissa] Ambient dialogue: Rolled " + roll + ", needed " + _Arissa_Setting_NewAreaFrequency.GetValue() + " or less.")
		if roll <= _Arissa_Setting_NewAreaFrequency.GetValue()
			ArissaDebug(5, "[Arissa] Searching for Situation Index.")
		else
			ArissaDebug(5, "[Arissa] Staying quiet for now.")
			return
		endif
		ArissaDebug(5, "[Arissa] Playing dialogue based on entering new area.")
		if akLocation
			int[] IndexStack = new int[99]
			GetLocationDialogueSituationIndex(IndexStack, akLocation)
			GetKeywordDialogueSituationIndex(IndexStack, akLocation)
			GetHoldDialogueSituationIndex(IndexStack, _Arissa_CurrentHold.GetValueInt())
			CurrentAmbientCommentIndex = GetSituationIndex(IndexStack)
		endif

		if CurrentAmbientCommentIndex != 0 && CurrentAmbientCommentIndex != -1
			if CurrentAmbientCommentIndex == last_selected_index
				ArissaDebug(5, "[Arissa] Suppressing identical index " + CurrentAmbientCommentIndex)
				return
			endif
			iNPC_Actor.Say(_Arissa_DialoguePlaceKnowledgeSharedInfo)
			last_selected_index = CurrentAmbientCommentIndex
		else
			ArissaDebug(5, "[Arissa] Couldn't find suitable dialogue for this situation.")
		endif
	endif
endFunction

function PlayChatterDialogue()
	stashed_norepeat_index = 0
	CurrentAmbientCommentIndex = 0
	if MeetsDialoguePrereqs()
		ArissaDebug(5, "[Arissa] Playing dialogue based on time passing.")
		int[] IndexStack = new int[99]
		Location loc = iNPC_Actor.GetCurrentLocation()
		GetChatterDialogueSituationIndex(IndexStack)
		GetKeywordDialogueSituationIndex(IndexStack, loc)
		GetLocationDialogueSituationIndex(IndexStack, loc)
		GetHoldDialogueSituationIndex(IndexStack, _Arissa_CurrentHold.GetValueInt())
		CurrentAmbientCommentIndex = GetSituationIndex(IndexStack)
		if CurrentAmbientCommentIndex != 0 && CurrentAmbientCommentIndex != -1
			if CurrentAmbientCommentIndex == last_selected_index
				ArissaDebug(5, "[Arissa] Suppressing identical index " + CurrentAmbientCommentIndex)
				return
			endif
			if CurrentAmbientCommentIndex >= 40000
				iNPC_Actor.Say(_Arissa_AmbientDialogueShared)
			elseif CurrentAmbientCommentIndex != 0
				iNPC_Actor.Say(_Arissa_DialoguePlaceKnowledgeSharedInfo)
			endif
			last_selected_index = CurrentAmbientCommentIndex
		else
			ArissaDebug(5, "[Arissa] Couldn't find suitable dialogue for this situation.")
		endif
	endif
endFunction


bool function MeetsDialoguePrereqs()
	if _Arissa_MQ01.IsCompleted() && IsFollowing && iNPC_Actor.GetDistance(PlayerRef) < 2048.0
		return true
	else
		ArissaDebug(5, "[Arissa] Didn't meet dialogue prereqs, aborting.")
		return false
	endif
endFunction

function AddSituationIndex(int[] aiIndexStack, int aiLineType, int aiTypeID, int aiSituationID, bool abSkipGeneralLines = false, bool abSayOnce = false)
	if !no_repeat_list
		no_repeat_list = new int[64]
	endif
	if !index_exclusion_list
		index_exclusion_list = new int[128]
	endif

	int index = 0
	int header = 0
	if abSayOnce == true
		header += 200000000
	else
		header += 100000000
	endif
	if aiSituationID != 0
		header += 20000000
	else
		header += 10000000
	endif
	if abSkipGeneralLines == true
		header += 2000000
	else
		header += 1000000
	endif

	index += (aiLineType * 10000)
	index += (aiTypeID * 100)
	index += (aiSituationID)

	if IsInNoRepeatList(index)
		ArissaDebug(5, "[Arissa] Cannot add index " + index + " to stack, set to no-repeat and not enough time has passed.")
		if !stack_has_index && stashed_norepeat_index == 0
			; Stash this situation for later; it might be the only one we can say anything about.
			stashed_norepeat_index = index
			return
		else
			return
		endif
	endif

	if IsInExclusionList(index)
		ArissaDebug(5, "[Arissa] Cannot add excluded index " + index + " to stack, returning.")
		return
	endif
	
	index += header

	int i = 0
	bool break = false
	while i < aiIndexStack.Length && break == false
		if aiIndexStack[i] == 0
			aiIndexStack[i] = index
			stack_has_index = true
			break = true
		endif
		i += 1
	endWhile
endFunction

bool function IsInExclusionList(int aiIndex)
	int i = 0
	while i < index_exclusion_list.Length
		if index_exclusion_list[i] == aiIndex
			return true
		endif
		i += 1
	endWhile
	return false
endFunction

bool function IsInNoRepeatList(int aiIndex)
	int i = 0
	while i < no_repeat_list.Length
		if no_repeat_list[i] == aiIndex
			return true
		endif
		i += 1
	endWhile
	return false
endFunction

function AddToExclusionList(int aiIndex)
	ArissaDebug(5, "[Arissa] Adding index " + aiIndex + " to exclusion list.")
	int i = 0
	bool break = false
	while i < index_exclusion_list.Length && !break
		if index_exclusion_list[i] == 0
			index_exclusion_list[i] = aiIndex
			break = true
		endif
		i += 1
	endWhile
endFunction

function AddToNoRepeatList(int aiIndex)
	ArissaDebug(5, "[Arissa] Adding index " + aiIndex + " to no-repeat list.")
	int i = 0
	bool break = false
	while i < no_repeat_list.Length && !break
		if no_repeat_list[i] == 0
			no_repeat_list[i] = aiIndex
			break = true
			RegisterForSingleUpdate(NO_REPEAT_TIMEOUT)
		endif
		i += 1
	endWhile
endFunction

int function GetSituationIndex(int[] aiIndexStack, bool abDontRandomize = false)
	int[] lines = new int[99]
	int i = 0
	bool skip_general = false
	bool skip_rest = false
	int line_count = 0
	while i < aiIndexStack.Length
		if skip_rest
			; skip
		else
			;@TODO: Account for skipping the rest but not general
			int the_line = aiIndexStack[i]
			if the_line == 0
				; skip
			else
				int temp_line = the_line
				; Temporarily strip headers
				if temp_line >= 200000000
					temp_line -= 200000000
				else
					temp_line -= 100000000
				endif
				if temp_line >= 20000000
					temp_line -= 20000000
				else
					temp_line -= 10000000
				endif
				if temp_line >= 2000000
					skip_general = true
					temp_line -= 2000000
				else
					temp_line -= 1000000
				endif
				; Is this a general-case Situation ID?
				if temp_line % 100 == 0 && skip_general
					; skip
				else
					ArissaDebug(5, "[Arissa] Adding " + the_line + " to the dialogue stack.")
					lines[i] = the_line
					line_count += 1
				endif
			endif
		endif
		i += 1
	endWhile

	; Select an item from the stack
	int chosen_line
	int selected_index
	if line_count > 0
		if abDontRandomize
			ArissaDebug(5, "[Arissa] User prompt; take item from top of stack.")
			chosen_line = lines[0]
		else
			ArissaDebug(5, "[Arissa] Ambient; select random index from stack.")
			selected_index = utility.RandomInt(0, (line_count - 1))
			chosen_line = lines[selected_index]
		endif
	elseif stashed_norepeat_index > 0
		ArissaDebug(5, "[Arissa] Using the stashed no-repeat situation index " + stashed_norepeat_index + ", since no other situations are available.")
		chosen_line = stashed_norepeat_index
	else
		return -1
	endif

	; Strip the headers
	bool add_to_exclusion = false
	bool add_to_norepeat = false
	if chosen_line >= 200000000
		chosen_line -= 200000000
		add_to_exclusion = true
	else
		chosen_line -= 100000000
	endif
	if chosen_line >= 20000000
		chosen_line -= 20000000
		add_to_norepeat = true
	else
		chosen_line -= 10000000
	endif
	if chosen_line >= 2000000
		chosen_line -= 2000000
	else
		chosen_line -= 1000000
	endif
	
	if add_to_norepeat && !IsInNoRepeatList(chosen_line)
		AddToNoRepeatList(chosen_line)
	endif
	if add_to_exclusion && !IsInExclusionList(chosen_line)
		AddToExclusionList(chosen_line)
	endif
	ArissaDebug(5, "[Arissa] Selected index " + chosen_line)
	return chosen_line
endFunction

function GetKeywordDialogueSituationIndex(int[] aiIndexStack, Location akLocation, bool abFromPrompt = false)
	if !(aiIndexStack[0] == 0)
		return
	endif
	; Check exceptions / location keywords
	if akLocation.HasKeyword(LocTypePlayerHouse)
		AddSituationIndex(aiIndexStack, 2, 1, 0)
	elseif akLocation.HasKeyword(LocTypeJail) && abFromPrompt
		AddSituationIndex(aiIndexStack, 2, 2, 0)
	elseif akLocation.HasKeyword(LocTypeInn) && !abFromPrompt
		AddSituationIndex(aiIndexStack, 2, 3, 0)
	endif
endFunction

function GetHoldDialogueSituationIndex(int[] aiIndexStack, int aiCurrentHold)
	;Check current Hold as last resort (least specific)
	if !(aiIndexStack[0] == 0)
		return
	endif
	if aiCurrentHold == 1 											;Eastmarch
		if _Arissa_MQ02.IsCompleted()
			AddSituationIndex(aiIndexStack, 3, 1, 1)
		endif
		AddSituationIndex(aiIndexStack, 3, 1, 0)
	elseif aiCurrentHold == 2 										;Falkreath Hold
		AddSituationIndex(aiIndexStack, 3, 2, 0)
	elseif aiCurrentHold == 3 										;Haafingar
		if !PlayerRef.IsInInterior() && (!CWObj.GetStageDone(255) || (CW as CWScript).playerAllegiance == CWImperial.GetValue()) ; Imperials undefeated
			AddSituationIndex(aiIndexStack, 3, 3, 1)
		elseif !PlayerRef.IsInInterior() && CWObj.GetStageDone(255) && (CW as CWScript).playerAllegiance == CWSons.GetValue()    ; Stormcloaks won
			AddSituationIndex(aiIndexStack, 3, 3, 2)
		endif
		AddSituationIndex(aiIndexStack, 3, 3, 0)
	elseif aiCurrentHold == 4 										;Hjaalmarch
		if (GameHour.GetValueInt() > 19 || GameHour.GetValueInt() <= 7)
			AddSituationIndex(aiIndexStack, 3, 4, 1)	
		endif
		AddSituationIndex(aiIndexStack, 3, 4, 0)
	elseif aiCurrentHold == 5 										;The Pale
		AddSituationIndex(aiIndexStack, 3, 5, 0)
	elseif aiCurrentHold == 6 										;The Reach
		AddSituationIndex(aiIndexStack, 3, 6, 0)
	elseif aiCurrentHold == 7 										;The Rift
		if !TG08A.IsCompleted()
			AddSituationIndex(aiIndexStack, 3, 7, 1)	
		endif
		if !PlayerRef.IsInInterior() && (!CWObj.GetStageDone(255) || (CW as CWScript).playerAllegiance == CWImperial.GetValue()) ; Imperials undefeated
			AddSituationIndex(aiIndexStack, 3, 7, 2)	
		endif
		AddSituationIndex(aiIndexStack, 3, 7, 0)
	elseif aiCurrentHold == 8 										;Whiterun
		AddSituationIndex(aiIndexStack, 3, 8, 0)
	elseif aiCurrentHold == 9 										;Winterhold Hold
		AddSituationIndex(aiIndexStack, 3, 9, 0)
	endif
endFunction

function GetLocationDialogueSituationIndex(int[] aiIndexStack, Location akLocation)
	if !(aiIndexStack[0] == 0)
		return
	endif
	if akLocation == SolitudeLocation
		if !MS05.IsCompleted()																							; Tending the Flames not completed
			AddSituationIndex(aiIndexStack, 1, 1, 1)
		endif
		if PlayerRef.GetActorValue("Speechcraft") < 50.0																; Player has low speechcraft
			AddSituationIndex(aiIndexStack, 1, 1, 2)
		endif
		if SolitudeJarl.GetActorRef() == ElisifTheFairREF 																; Elisif is jarl
			AddSituationIndex(aiIndexStack, 1, 1, 3)
		endif
		AddSituationIndex(aiIndexStack, 1, 1, 0)
	elseif akLocation == MarkarthLocation
		if !KlepprRef.IsDead() && !FrabbiRef.IsDead()																	; Husband and wife alive
			AddSituationIndex(aiIndexStack, 1, 2, 1)	
		endif
		if !MS01.IsCompleted() 																							; The Forsworn Conspiracy not complete
			AddSituationIndex(aiIndexStack, 1, 2, 2)	
		endif
		AddSituationIndex(aiIndexStack, 1, 2, 0)
	elseif akLocation == WhiterunLocation
		if !AdrianneAvenicciREF.IsDead()																				; Adrianne alive and well
			AddSituationIndex(aiIndexStack, 1, 3, 1)	
		endif
		AddSituationIndex(aiIndexStack, 1, 3, 0)
	elseif akLocation == RiftenLocation && akLocation != RiftenThievesGuildHeadquartersLocation
		if !MavenRef.IsDead()																							; Maven alive and well
			AddSituationIndex(aiIndexStack, 1, 4, 1)
		endif
		if !MavenRef.IsDead() && (!CWObj.GetStageDone(255) || \
								  (CWObj.GetStageDone(255) && (CW as CWScript).playerAllegiance == CWSons.GetValue()))	; Maven alive, Civil War is not done OR Stormcloaks won
			AddSituationIndex(aiIndexStack, 1, 4, 2)
		endif
		if TG01.GetStage() < 20
			AddSituationIndex(aiIndexStack, 1, 4, 3)																	; Haven't located Ragged Flagon yet
		endif
		if RiftenJarl.GetActorRef() == LailaRef
			AddSituationIndex(aiIndexStack, 1, 4, 4)	
		endif
		AddSituationIndex(aiIndexStack, 1, 4, 0)
	elseif akLocation == RiftenThievesGuildHeadquartersLocation
		AddSituationIndex(aiIndexStack, 1, 5, 0)
	elseif akLocation == WindhelmLocation
		if CWObj.GetStageDone(255) && (CW as CWScript).playerAllegiance == CWSons.GetValue()				; Stormcloaks won
			AddSituationIndex(aiIndexStack, 1, 6, 1)
		elseif CWObj.GetStageDone(255) && (CW as CWScript).playerAllegiance == CWImperial.GetValue()		; Imperials won
			AddSituationIndex(aiIndexStack, 1, 6, 2)
		elseif !CWObj.GetStageDone(255)																		; Neither
			AddSituationIndex(aiIndexStack, 1, 6, 3)
		endif
		AddSituationIndex(aiIndexStack, 1, 6, 0)
	elseif akLocation == DawnstarLocation
		if !FridaREF.IsDead()
			AddSituationIndex(aiIndexStack, 1, 7, 1)
		endif
		if !DA16.IsCompleted() 																		; Waking Nightmare not finished
			AddSituationIndex(aiIndexStack, 1, 7, 2)
		endif
		if !CWObj.GetStageDone(255) 																; Civil War is not done
			AddSituationIndex(aiIndexStack, 1, 7, 3)
		endif
		AddSituationIndex(aiIndexStack, 1, 7, 0)
	elseif akLocation == RiverwoodLocation
		if !CamillaValeriusREF.IsDead() 															; Camilla alive and well
			AddSituationIndex(aiIndexStack, 1, 8, 1, abSayOnce = true)
		elseif CamillaValeriusREF.IsDead() && !LucanValeriusREF.IsDead()							; Camilla dead, Lucan alive
			AddSituationIndex(aiIndexStack, 1, 8, 2, abSayOnce = true)
		elseif CamillaValeriusREF.IsDead() && LucanValeriusREF.IsDead()								; Camilla and Lucan dead
			AddSituationIndex(aiIndexStack, 1, 8, 3, abSayOnce = true)
		endif
		; AddSituationIndex(aiIndexStack, 1, 8, 0) ; No general riverwood dialogue yet
	elseif akLocation == FalkreathLocation
		if FalkreathJarl.GetActorRef() == SiddgeirRef											; Siddgeir is Jarl
			AddSituationIndex(aiIndexStack, 1, 9, 1)
		endif
		if !DA05.IsCompleted() && !DA05SindingHumanREF.IsDead()									; Ill Met by Moonlight not complete, Sinding alive
			AddSituationIndex(aiIndexStack, 1, 9, 2)
		endif
		if !ValgaViniciaRef.IsDead()															; Innkeeper alive and well
			AddSituationIndex(aiIndexStack, 1, 9, 3)
		endif
		AddSituationIndex(aiIndexStack, 1, 9, 0)
	elseif akLocation == LabyrinthianLocation
		AddSituationIndex(aiIndexStack, 1, 10, 0)
	elseif akLocation == WinterholdLocation
		if !MG01Quest.IsCompleted()
			AddSituationIndex(aiIndexStack, 1, 11, 1)												; Have not yet joined Mage's College
		endif
		if !DagurRef.IsDead()
			AddSituationIndex(aiIndexStack, 1, 11, 2)												; Dagur alive and well
		endif
		AddSituationIndex(aiIndexStack, 1, 11, 0)
	elseif akLocation == MorthalLocation
		if !MS14Quest.IsCompleted()																; Laid to Rest not complete
			AddSituationIndex(aiIndexStack, 1, 12, 1)
		endif
		if !FalionRef.IsDead()																	; Falion is alive and well
			AddSituationIndex(aiIndexStack, 1, 12, 2)
		endif
		if MorthalJarl.GetActorRef() == IdgrodRavencroneREF
			AddSituationIndex(aiIndexStack, 1, 12, 3)
		endif
		AddSituationIndex(aiIndexStack, 1, 12, 0)
	elseif akLocation == HelgenLocation
		AddSituationIndex(aiIndexStack, 1, 13, 0)
	elseif akLocation == BlackreachLocation
		AddSituationIndex(aiIndexStack, 1, 14, 0)
	elseif akLocation == IvarsteadLocation
		AddSituationIndex(aiIndexStack, 1, 15, 0)
	elseif akLocation == KarthwastenLocation
		AddSituationIndex(aiIndexStack, 1, 16, 0)
	elseif akLocation == BleakFallsBarrowLocation
		AddSituationIndex(aiIndexStack, 1, 17, 0)
	elseif akLocation == ShorsStoneLocation
		AddSituationIndex(aiIndexStack, 1, 18, 0)
	elseif akLocation == HighHrothgarLocation
		AddSituationIndex(aiIndexStack, 1, 19, 0)
	elseif akLocation == WinterholdCollegeLocation
		if !MG01Quest.IsCompleted()
			AddSituationIndex(aiIndexStack, 1, 20, 1)												; Have not yet joined Mage's College
		endif
		AddSituationIndex(aiIndexStack, 1, 20, 0)
	elseif akLocation == KynesgroveLocation
		AddSituationIndex(aiIndexStack, 1, 21, 0)
	elseif akLocation == ThalmorEmbassyLocation
		AddSituationIndex(aiIndexStack, 1, 22, 0)
	elseif akLocation == FrostflowLighthouseLocation
		AddSituationIndex(aiIndexStack, 1, 23, 0)
	elseif akLocation == SolitudeBluePalaceLocation
		if !OdarREF.IsDead()																	; Odar the chef is alive and well
			AddSituationIndex(aiIndexStack, 1, 24, 1)	
		endif
		if !SybilleStentorREF.IsDead()
			AddSituationIndex(aiIndexStack, 1, 24, 2)
		endif
		AddSituationIndex(aiIndexStack, 1, 24, 0)
	elseif akLocation == YsgramorsTombLocation
		AddSituationIndex(aiIndexStack, 1, 25, 0)
	elseif akLocation == NightcallerTempleLocation
		AddSituationIndex(aiIndexStack, 1, 26, 0)
	elseif akLocation == DragonBridgeLocation
		AddSituationIndex(aiIndexStack, 1, 27, 0)
	elseif akLocation == RoriksteadLocation
		AddSituationIndex(aiIndexStack, 1, 28, 0)
	elseif akLocation == SolitudeCastleDourLocation
		if !PlayerRef.IsInFaction(CWImperialFaction) && !PlayerRef.IsInFaction(CWSonsFaction)		; Player hasn't joined a CW faction
			AddSituationIndex(aiIndexStack, 1, 29, 1)	
		endif
		AddSituationIndex(aiIndexStack, 1, 29, 0)
	elseif akLocation == WindhelmPalaceOfTheKingsLocation
		if !CWObj.GetStageDone(255) 																; Civil War is not done
			AddSituationIndex(aiIndexStack, 1, 30, 1)
		endif
		if !UlfricREF.IsDead()
			AddSituationIndex(aiIndexStack, 1, 30, 2) 												; Ulfric alive and well
		endif
		AddSituationIndex(aiIndexStack, 1, 30, 0)
	elseif akLocation == SolitudeRadiantRaimentsLocation
		AddSituationIndex(aiIndexStack, 1, 31, 0)
	elseif akLocation == RiftenRaggedFlagonLocation
		if !ToniliaRef.IsDead()
			AddSituationIndex(aiIndexStack, 1, 32, 1)													; Tonilia alive and well
		endif
		AddSituationIndex(aiIndexStack, 1, 32, 0)
	elseif akLocation == RiftenRatwayLocation
		AddSituationIndex(aiIndexStack, 1, 33, 0)
	elseif akLocation == RiftenMistveilKeepLocation
		if !LailaRef.IsDead()
			AddSituationIndex(aiIndexStack, 1, 34, 1)
		endif
		if !WylandriahRef.IsDead()
			AddSituationIndex(aiIndexStack, 1, 34, 2)
		endif
		AddSituationIndex(aiIndexStack, 1, 34, 0)
	elseif akLocation == EldergleamSanctuaryLocation
		AddSituationIndex(aiIndexStack, 1, 35, 0)
	elseif akLocation == GlenmorilCovenLocation
		AddSituationIndex(aiIndexStack, 1, 36, 0)
	elseif akLocation == MarkarthUnderstoneKeepLocation
		if !OndolemarREF.IsDead()
			AddSituationIndex(aiIndexStack, 1, 37, 1)	
		endif
		AddSituationIndex(aiIndexStack, 1, 37, 0)
	elseif akLocation == ThroatoftheWorldLocation
		AddSituationIndex(aiIndexStack, 1, 38, 0)
	elseif akLocation == WhiterunHonningbrewMeaderyLocation
		AddSituationIndex(aiIndexStack, 1, 39, 0)
	endif
endFunction

function GetChatterDialogueSituationIndex(int[] aiIndexStack)
	if (GameHour.GetValueInt() > 19 || GameHour.GetValueInt() <= 7) && !PlayerRef.IsInCombat()
		AddSituationIndex(aiIndexStack, 4, 1, 0)
	endif
endFunction

function ArissaDebug(int iClassification, string sDebugMessage)
	;1 = Regard updates, status changes
	;2 = Quest state data
	;3 = Scene data
	;4 = Other
	;5 = Dialogue debug
	if _Arissa_DebugVar.GetValueInt() == iClassification
		debug.trace("[Arissa] " + sDebugMessage)
	endif
endFunction