scriptname _Arissa_iNPC_Behavior extends _Arissa_iNPC_Main conditional

Armor property _Arissa_ClothingTownBody auto
Message property _ArissaDismissMessageWait auto
Message property _ArissaBlockedMessage auto
Message property _ArissaDismissMessageWedding auto
Quest property _Arissa_MQ01 auto
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

; ========= Place Knowledge System =========
int property CurrentAmbientCommentIndex = 0 auto conditional hidden

GlobalVariable property _Arissa_CurrentHold auto

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

; - Location dialogue-specific properties
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
ReferenceAlias property FalkreathJarl auto
ReferenceAlias property MorthalJarl auto
ReferenceAlias property RiftenJarl auto

Quest property CW auto
Quest property CWObj auto
Quest property TG01 auto
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
faction property CWImperialFaction auto
faction property CWSonsFaction auto

function PlayAmbientDialogue(Location akLocation)
	CurrentAmbientCommentIndex = 0
	if MeetsDialoguePrereqs()
		if akLocation
			CurrentAmbientCommentIndex = GetAmbientDialogueSituationIndex(akLocation, 0)
		endif

		if CurrentAmbientCommentIndex != 0 && CurrentAmbientCommentIndex != -1
			iNPC_Actor.Say(_Arissa_DialoguePlaceKnowledgeSharedInfo)
		else
			debug.trace("[Arissa] Couldn't find suitable dialogue for this situation.")
		endif
	endif
endFunction

bool function MeetsDialoguePrereqs()
	if _Arissa_MQ01.IsCompleted() && IsFollowing && iNPC_Actor.GetDistance(PlayerRef) < 2048.0
		return true
	else
		return false
	endif
endFunction

function AddSituationIndex(int[] aiStack, int aiLineType, int aiTypeID, int aiSituationID, bool abSkipGeneralLines = false, bool abSkipRemainingLines = false)
	int index = 0
	if abSkipRemainingLines == true
		index += 20000000
	else
		index += 10000000
	endif
	if abSkipGeneralLines == true
		index += 2000000
	else
		index += 1000000
	endif

	index += (aiLineType * 10000)
	index += (aiTypeID * 100)
	index += (aiSituationID)
	
	int i = 0
	bool break = false
	while i < aiStack.Length && break == false
		if aiStack[i] == 0
			aiStack[i] = index
			break = true
		endif
		i += 1
	endWhile
endFunction

int function GetSituationIndex(int[] aiSituationIndicies)
	int[] lines = new int[99]
	int i = 0
	bool skip_general = false
	bool skip_rest = false
	int line_count = 0
	while i < aiSituationIndicies.Length
		if skip_rest
			; skip
		else
			;@TODO: Account for skipping the rest but not general
			int the_line = aiSituationIndicies[i]
			if the_line == 0
				; skip
			else
				; Strip off the headers
				if the_line >= 20000000
					skip_rest = true
					the_line -= 20000000
				else
					the_line -= 10000000
				endif
				if the_line >= 2000000
					skip_general = true
					the_line -= 2000000
				else
					the_line -= 1000000
				endif
				
				; Is this a general-case Situation ID?
				if the_line % 100 == 0 && skip_general
					;skip
				else
					debug.trace("[Arissa] Adding " + the_line + " to the dialogue stack.")
					lines[i] = the_line
					line_count += 1
				endif
			endif
		endif
		i += 1
	endWhile

	; Randomly select an item from the stack
	int selected_index
	if line_count > 0
		selected_index = utility.RandomInt(0, (line_count - 1))
	else
		selected_index = -1
	endif
	if selected_index != -1
		debug.trace("[Arissa] Selected index " + lines[selected_index])
		return lines[selected_index]
	else
		return -1
	endif
endFunction

; @TODO: Provide pseudo say-once functionality
int function GetAmbientDialogueSituationIndex(Location akLocation, int aiCurrentHold)
	int[] IndexStack = new int[99]
	if akLocation == SolitudeLocation
		if !MS05.IsCompleted()																							; Tending the Flames not completed
			AddSituationIndex(IndexStack, 1, 1, 1)
		endif
		if PlayerRef.GetActorValue("Speechcraft") < 50.0																; Player has low speechcraft
			AddSituationIndex(IndexStack, 1, 1, 2)
		endif
		if SolitudeJarl.GetActorRef() == ElisifTheFairREF 																; Elisif is jarl
			AddSituationIndex(IndexStack, 1, 1, 3)
		endif
		AddSituationIndex(IndexStack, 1, 1, 0)
	elseif akLocation == MarkarthLocation
		if !KlepprRef.IsDead() && !FrabbiRef.IsDead()																	; Husband and wife alive
			AddSituationIndex(IndexStack, 1, 2, 1)	
		endif
		if !MS01.IsCompleted() 																							; The Forsworn Conspiracy not complete
			AddSituationIndex(IndexStack, 1, 2, 2)	
		endif
		AddSituationIndex(IndexStack, 1, 2, 0)
	elseif akLocation == WhiterunLocation
		if !AdrianneAvenicciREF.IsDead()																				; Adrianne alive and well
			AddSituationIndex(IndexStack, 1, 3, 1)	
		endif
		AddSituationIndex(IndexStack, 1, 3, 0)
	elseif akLocation == RiftenLocation && akLocation != RiftenThievesGuildHeadquartersLocation
		if !MavenRef.IsDead()																							; Maven alive and well
			AddSituationIndex(IndexStack, 1, 4, 1)
		endif
		if !MavenRef.IsDead() && (!CWObj.GetStageDone(255) || \
								  (CWObj.GetStageDone(255) && (CW as CWScript).playerAllegiance == CWSons.GetValue()))	; Maven alive, Civil War is not done OR Stormcloaks won
			AddSituationIndex(IndexStack, 1, 4, 2)
		endif
		if TG01.GetStage() < 20
			AddSituationIndex(IndexStack, 1, 4, 3)																		; Haven't located Ragged Flagon yet
		endif
		if RiftenJarl.GetActorRef() == LailaRef
			AddSituationIndex(IndexStack, 1, 4, 4)	
		endif
		AddSituationIndex(IndexStack, 1, 4, 0)
	elseif akLocation == RiftenThievesGuildHeadquartersLocation
		AddSituationIndex(IndexStack, 1, 5, 0)
	elseif akLocation == WindhelmLocation
		if CWObj.GetStageDone(255) && (CW as CWScript).playerAllegiance == CWSons.GetValue()				; Stormcloaks won
			AddSituationIndex(IndexStack, 1, 6, 1)
		elseif CWObj.GetStageDone(255) && (CW as CWScript).playerAllegiance == CWImperial.GetValue()		; Imperials won
			AddSituationIndex(IndexStack, 1, 6, 2)
		elseif !CWObj.GetStageDone(255)																		; Neither
			AddSituationIndex(IndexStack, 1, 6, 3)
		endif
		AddSituationIndex(IndexStack, 1, 6, 0)
	elseif akLocation == DawnstarLocation
		if !FridaREF.IsDead()
			AddSituationIndex(IndexStack, 1, 7, 1)
		endif
		if !DA16.IsCompleted() 																		; Waking Nightmare not finished
			AddSituationIndex(IndexStack, 1, 7, 2)
		endif
		if !CWObj.GetStageDone(255) 																; Civil War is not done
			AddSituationIndex(IndexStack, 1, 7, 3)
		endif
		AddSituationIndex(IndexStack, 1, 7, 0)
	elseif akLocation == RiverwoodLocation
		if !CamillaValeriusREF.IsDead() 															;Camilla alive and well
			AddSituationIndex(IndexStack, 1, 8, 1)
		elseif CamillaValeriusREF.IsDead() && !LucanValeriusREF.IsDead()							;Camilla dead, Lucan alive
			AddSituationIndex(IndexStack, 1, 8, 2)
		elseif CamillaValeriusREF.IsDead() && LucanValeriusREF.IsDead()								;Camilla and Lucan dead
			AddSituationIndex(IndexStack, 1, 8, 3)
		endif
		AddSituationIndex(IndexStack, 1, 8, 0)
	elseif akLocation == FalkreathLocation
		if FalkreathJarl.GetActorRef() == SiddgeirRef											; Siddgeir is Jarl
			AddSituationIndex(IndexStack, 1, 9, 1)
		endif
		if !DA05.IsCompleted() && !DA05SindingHumanREF.IsDead()									; Ill Met by Moonlight not complete, Sinding alive
			AddSituationIndex(IndexStack, 1, 9, 2)
		endif
		if !ValgaViniciaRef.IsDead()															; Innkeeper alive and well
			AddSituationIndex(IndexStack, 1, 9, 3)
		endif
		AddSituationIndex(IndexStack, 1, 9, 0)
	elseif akLocation == LabyrinthianLocation
		AddSituationIndex(IndexStack, 1, 10, 0)
	elseif akLocation == WinterholdLocation
		if !MG01Quest.IsCompleted()
			AddSituationIndex(IndexStack, 1, 11, 1)												;Have not yet joined Mage's College
		endif
		if !DagurRef.IsDead()
			AddSituationIndex(IndexStack, 1, 11, 2)												; Dagur alive and well
		endif
		AddSituationIndex(IndexStack, 1, 11, 0)
	elseif akLocation == MorthalLocation
		if !MS14Quest.IsCompleted()																;Laid to Rest not complete
			AddSituationIndex(IndexStack, 1, 12, 1)
		endif
		if !FalionRef.IsDead()																	;Falion is alive and well
			AddSituationIndex(IndexStack, 1, 12, 2)
		endif
		if MorthalJarl.GetActorRef() == IdgrodRavencroneREF
			AddSituationIndex(IndexStack, 1, 12, 3)
		endif
		AddSituationIndex(IndexStack, 1, 12, 0)
	elseif akLocation == HelgenLocation
		AddSituationIndex(IndexStack, 1, 13, 0)
	elseif akLocation == BlackreachLocation
		AddSituationIndex(IndexStack, 1, 14, 0)
	elseif akLocation == IvarsteadLocation
		AddSituationIndex(IndexStack, 1, 15, 0)
	elseif akLocation == KarthwastenLocation
		AddSituationIndex(IndexStack, 1, 16, 0)
	elseif akLocation == BleakFallsBarrowLocation
		AddSituationIndex(IndexStack, 1, 17, 0)
	elseif akLocation == ShorsStoneLocation
		AddSituationIndex(IndexStack, 1, 18, 0)
	elseif akLocation == HighHrothgarLocation
		AddSituationIndex(IndexStack, 1, 19, 0)
	elseif akLocation == WinterholdCollegeLocation
		if !MG01Quest.IsCompleted()
			AddSituationIndex(IndexStack, 1, 20, 1)												;Have not yet joined Mage's College
		endif
		AddSituationIndex(IndexStack, 1, 20, 0)
	elseif akLocation == KynesgroveLocation
		AddSituationIndex(IndexStack, 1, 21, 0)
	elseif akLocation == ThalmorEmbassyLocation
		AddSituationIndex(IndexStack, 1, 22, 0)
	elseif akLocation == FrostflowLighthouseLocation
		AddSituationIndex(IndexStack, 1, 23, 0)
	elseif akLocation == SolitudeBluePalaceLocation
		if !OdarREF.IsDead()																	;Odar the chef is alive and well
			AddSituationIndex(IndexStack, 1, 24, 1)	
		endif
		if !SybilleStentorREF.IsDead()
			AddSituationIndex(IndexStack, 1, 24, 2)
		endif
		AddSituationIndex(IndexStack, 1, 24, 0)
	elseif akLocation == YsgramorsTombLocation
		AddSituationIndex(IndexStack, 1, 25, 0)
	elseif akLocation == NightcallerTempleLocation
		AddSituationIndex(IndexStack, 1, 26, 0)
	elseif akLocation == DragonBridgeLocation
		AddSituationIndex(IndexStack, 1, 27, 0)
	elseif akLocation == RoriksteadLocation
		AddSituationIndex(IndexStack, 1, 28, 0)
	elseif akLocation == SolitudeCastleDourLocation
		if !PlayerRef.IsInFaction(CWImperialFaction) && !PlayerRef.IsInFaction(CWSonsFaction)		; Player hasn't joined a CW faction
			AddSituationIndex(IndexStack, 1, 29, 1)	
		endif
		AddSituationIndex(IndexStack, 1, 29, 0)
	elseif akLocation == WindhelmPalaceOfTheKingsLocation
		if !CWObj.GetStageDone(255) 																; Civil War is not done
			AddSituationIndex(IndexStack, 1, 30, 1)
		endif
		if !UlfricREF.IsDead()
			AddSituationIndex(IndexStack, 1, 30, 2) 												;Ulfric alive and well
		endif
		AddSituationIndex(IndexStack, 1, 30, 0)
	elseif akLocation == SolitudeRadiantRaimentsLocation
		AddSituationIndex(IndexStack, 1, 31, 0)
	elseif akLocation == RiftenRaggedFlagonLocation
		if !ToniliaRef.IsDead()
			AddSituationIndex(IndexStack, 1, 32, 1)													; Tonilia alive and well
		endif
		AddSituationIndex(IndexStack, 1, 32, 0)
	elseif akLocation == RiftenRatwayLocation
		AddSituationIndex(IndexStack, 1, 33, 0)
	endif

	
	if IndexStack[0] == 0
		; Check exceptions / location keywords
		if akLocation.HasKeyword(LocTypePlayerHouse)					;Player Home
			AddSituationIndex(IndexStack, 2, 1, 0)
		elseif akLocation.HasKeyword(LocTypeJail)
			AddSituationIndex(IndexStack, 2, 2, 0)
		endif
	endif

	;Check current Hold as last resort (least specific)
	if IndexStack[0] == 0
		if aiCurrentHold == 1 											;Eastmarch
			AddSituationIndex(IndexStack, 3, 1, 0)
		elseif aiCurrentHold == 2 										;Falkreath Hold
			AddSituationIndex(IndexStack, 3, 2, 0)
		elseif aiCurrentHold == 3 										;Haafingar
			if !PlayerRef.IsInInterior() && (!CWObj.GetStageDone(255) || (CW as CWScript).playerAllegiance == CWImperial.GetValue()) ; Imperials undefeated
				AddSituationIndex(IndexStack, 3, 3, 1)
			elseif !PlayerRef.IsInInterior() && CWObj.GetStageDone(255) && (CW as CWScript).playerAllegiance == CWSons.GetValue()    ; Stormcloaks won
				AddSituationIndex(IndexStack, 3, 3, 2)
			endif
			AddSituationIndex(IndexStack, 3, 3, 0)
		elseif aiCurrentHold == 4 										;Hjaalmarch
			AddSituationIndex(IndexStack, 3, 4, 0)
		elseif aiCurrentHold == 5 										;The Pale
			AddSituationIndex(IndexStack, 3, 5, 0)
		elseif aiCurrentHold == 6 										;The Reach
			AddSituationIndex(IndexStack, 3, 6, 0)
		elseif aiCurrentHold == 7 										;The Rift
			; @TODO: if Nightingales undiscovered
				AddSituationIndex(IndexStack, 3, 7, 1)	
			; endif
			AddSituationIndex(IndexStack, 3, 7, 0)
		elseif aiCurrentHold == 8 										;Whiterun
			AddSituationIndex(IndexStack, 3, 8, 0)
		elseif aiCurrentHold == 9 										;Winterhold Hold
			AddSituationIndex(IndexStack, 3, 9, 0)
		endif
	endif

	return GetSituationIndex(IndexStack)
endFunction

function ArissaDebug(int iClassification, string sDebugMessage)
	;1 = Regard updates, status changes
	;2 = Quest state data
	;3 = Scene data
	;4 = Other
	if _Arissa_DebugVar.GetValueInt() == iClassification
		debug.trace("[Arissa] " + sDebugMessage)
	endif
endFunction