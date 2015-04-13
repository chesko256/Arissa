Scriptname ArenaScript extends Quest Conditional

bool Property CombatOngoing auto Conditional
bool Property RewardDue auto Conditional

Quest Property PointerQuest auto
MiscObject Property Gold auto
Faction Property ArenaFaction auto
ReferenceAlias Property PitDoor auto
bool Property CombatPreSet auto
bool Property PlayerGotTheSkinny auto conditional

int Property NumberOfPlayerFights auto
int Property ArrestOffset auto
Weapon Property LoanerSword auto
Armor Property LoanerShield auto
Faction Property EastmarchCrimeFaction auto
Faction Property SelfLoathing auto
Faction Property PacifyFaction auto

ArenaCombatQuest Property CurrentFight = None auto

; Combatants for cleanup
ReferenceAlias Property Combatant01 auto
ReferenceAlias Property Combatant02 auto
ReferenceAlias Property Combatant03 auto
ReferenceAlias Property Combatant04 auto
ReferenceAlias Property Combatant05 auto
ReferenceAlias Property Combatant06 auto
ReferenceAlias Property Combatant07 auto
ReferenceAlias Property Combatant08 auto
ReferenceAlias Property Combatant09 auto
ReferenceAlias Property Combatant10 auto
ReferenceAlias Property TransitionCombatant auto

; Spawn points
ObjectReference _spawnPoint01 = None
ObjectReference _spawnPoint02 = None
ObjectReference _spawnPoint03 = None
ObjectReference _spawnPoint04 = None
ObjectReference _spawnPoint05 = None

; gates
ObjectReference Property Gate1 auto
ObjectReference Property Gate2 auto
ObjectReference Property Gate3 auto

; Wave keywords
Keyword Property Wave1Keyword = None auto
Keyword Property Wave2Keyword = None auto
Keyword Property Wave3Keyword = None auto
Keyword Property Wave4Keyword = None auto
Keyword Property Wave5Keyword = None auto
Keyword Property LinkedDoorKeyword = None auto

; rank tracking
int Property FightsToNextLevel auto conditional
int Property Level0Fights auto
int Property Level1Fights auto
int Property Level2Fights auto
int Property Level3Fights auto

; Wager Tracking
bool Property WagerOngoing auto conditional
int Property WagerAmount auto
bool Property PlayerChoseTheField auto conditional
bool Property PlayerWonWager auto conditional
bool Property WagerResolutionRequired auto conditional
ArenaCombatQuest Property NextWagerFight auto
Quest Property ArenaWagerFighterQuest auto
bool Property NextWagerFightIsToughAnimals auto conditional
bool Property NextWagerFightIsEasyAnimals auto conditional
bool Property NextWagerFightIsPeople auto conditional ; SOYLENT GREEN!
bool Property NextWagerFightIsExotic auto conditional

;; Special Case quests
; for Dark Brotherhood quest that has you going to jail
Quest Property DB03 auto
	; the specific fight that will go with it
	ArenaCombatQuest Property SpecialFightDB auto 
	; track if it went wrong and we need to start a normal fight now
	bool Property DBFightWentAwry = false auto conditional
; for getting arrested in Eastmarch
Quest Property EastmarchJail auto 
	; the specific fight that will go with it
	ArenaCombatQuest Property SpecialFightJail auto

;; Normal Arena Combat Quests
ArenaCombatQuest Property TransitionFight auto ; transition between levels
; Pit Meat
ArenaCombatQuest Property Fight01 auto ; skeevers
ArenaCombatQuest Property Fight02 auto ; wolves
ArenaCombatQuest Property Fight03 auto ; spiders
; Goon
ArenaCombatQuest Property Fight04 auto ; NPCs at PC+2
; Ruffian
ArenaCombatQuest Property Fight05 auto ; bear
ArenaCombatQuest Property Fight06 auto ; sabre cat
ArenaCombatQuest Property Fight07 auto ; chaurus
ArenaCombatQuest Property Fight08 auto ; troll
ArenaCombatQuest Property Fight09 auto ; NPCs at PC+5
; Thrasher
ArenaCombatQuest Property Fight10 auto ; giant
ArenaCombatQuest Property Fight11 auto ; NPCs at PC+7
; Pit Lord
ArenaCombatQuest Property Fight12 auto ; ice wraith
ArenaCombatQuest Property Fight13 auto ; NPCs at PC+9

int _maxFights = 13


ArenaCombatQuest Function GetFightQuestFromIndex(int questIndex)
	if     (questIndex == 1)
		return Fight01
	elseif (questIndex == 2)
		return Fight02
	elseif (questIndex == 3)
		return Fight03
	elseif (questIndex == 4)
		return Fight04
	elseif (questIndex == 5)
		return Fight05
	elseif (questIndex == 6)
		return Fight06
	elseif (questIndex == 7)
		return Fight07
	elseif (questIndex == 8)
		return Fight08
	elseif (questIndex == 9)
		return Fight09
	elseif (questIndex == 10)
		return Fight10
	elseif (questIndex == 11)
		return Fight11
	elseif (questIndex == 12)
		return Fight12
	elseif (questIndex == 13)
		return Fight13
	else 
		return None
	endif
EndFunction

int Function GetIndexFromFightQuest(ArenaCombatQuest rQuest)
	if     (rQuest == Fight01)
		return 1
	elseif (rQuest == Fight02)
		return 2
	elseif (rQuest == Fight03)
		return 3
	elseif (rQuest == Fight04)
		return 4
	elseif (rQuest == Fight05)
		return 5
	elseif (rQuest == Fight06)
		return 6
	elseif (rQuest == Fight07)
		return 7
	elseif (rQuest == Fight08)
		return 8
	elseif (rQuest == Fight09)
		return 9
	elseif (rQuest == Fight10)
		return 10
	elseif (rQuest == Fight11)
		return 11
	elseif (rQuest == Fight12)
		return 12
	elseif (rQuest == Fight13)
		return 13
	else 
		return 0
	endif
EndFunction

ReferenceAlias Function GetCombatantAlias(int index)
	if     (index == 1)
		return Combatant01
	elseif (index == 2)
		return Combatant02
	elseif (index == 3)
		return Combatant03
	elseif (index == 4)
		return Combatant04
	elseif (index == 5)
		return Combatant05
	elseif (index == 6)
		return Combatant06
	elseif (index == 7)
		return Combatant07
	elseif (index == 8)
		return Combatant08
	elseif (index == 9)
		return Combatant09
	elseif (index == 10)
		return Combatant10
	else
		return None
	endif
EndFunction

Function Setup()
	;PlayerJoin() ; for debugging purposes
	WagerOngoing = False
	PickNextWagerFight(None)
EndFunction

Function PlayerJoin()
	if (PointerQuest.IsRunning())
		PointerQuest.SetStage(20)
	endif
	Game.GetPlayer().AddToFaction(ArenaFaction)
	NumberOfPlayerFights = 0
	FightsToNextLevel = Level0Fights
EndFunction

Function PlaceBet(int amount)
	WagerOngoing = True
	WagerAmount = amount
	Game.GetPlayer().RemoveItem(Gold, WagerAmount)
EndFunction

Function EndWagerFight()
; 	Debug.Trace("ARENA: Wager fight ending.")
	bool fieldWon = (ArenaWagerFighterQuest as ArenaWagerFighterQuestScript).Fighter.GetActorReference().IsDead()
	NextWagerFight.Stop()

	if (PlayerChoseTheField == fieldWon)
		PlayerWonWager = True
; 		Debug.Trace("ARENA: Player won!")
	else
		PlayerWonWager = False
; 		Debug.Trace("ARENA: Player lost.")
	endif

	WagerResolutionRequired = True
EndFunction

Function ResolveWager()
; 	Debug.Trace("ARENA: Resolving wager.")
	if (PlayerWonWager)
		Game.GetPlayer().AddItem(Gold, WagerAmount * 2)
	endif

	CleanupBodies()
	WagerOngoing = False
	WagerResolutionRequired = False
	ArenaWagerFighterQuest.Stop()
	PickNextWagerFight(NextWagerFight)
EndFunction

Function PlayerAvoidedWager()
	PlayerChoseTheField = False
	WagerOngoing = False
EndFunction

Function StartWagerFight()
	NextWagerFight.Start()
	ArenaWagerFighterQuest.Start()
	CombatPreSet = True
EndFunction

Function PickNextWagerFight(ArenaCombatQuest lastFight)
	int lastFightIndex = -1
	if (lastFight != None)
		lastFightIndex = GetIndexFromFightQuest(lastFight)
	endif
	int fightIndex = lastFightIndex
	while (fightIndex == lastFightIndex)
		fightIndex = Utility.RandomInt(1, _maxFights)
	endwhile
	NextWagerFight = GetFightQuestFromIndex(fightIndex)

	NextWagerFightIsToughAnimals = False
	NextWagerFightIsEasyAnimals = False
	NextWagerFightIsPeople = False
	NextWagerFightIsExotic = False

	if     (NextWagerFight == Fight01)
		NextWagerFightIsEasyAnimals = True
	elseif (NextWagerFight == Fight02)
		NextWagerFightIsEasyAnimals = True
	elseif (NextWagerFight == Fight03)
		NextWagerFightIsEasyAnimals = True
	elseif (NextWagerFight == Fight04)
		NextWagerFightIsPeople = True
	elseif (NextWagerFight == Fight05)
		NextWagerFightIsToughAnimals = True
	elseif (NextWagerFight == Fight06)
		NextWagerFightIsToughAnimals = True
	elseif (NextWagerFight == Fight07)
		NextWagerFightIsToughAnimals = True
	elseif (NextWagerFight == Fight08)
		NextWagerFightIsToughAnimals = True
	elseif (NextWagerFight == Fight09)
		NextWagerFightIsPeople = True
	elseif (NextWagerFight == Fight10)
		NextWagerFightIsExotic = True
	elseif (NextWagerFight == Fight11)
		NextWagerFightIsPeople = True
	elseif (NextWagerFight == Fight12)
		NextWagerFightIsExotic = True
	elseif (NextWagerFight == Fight13)
		NextWagerFightIsPeople = True
	endif
EndFunction

Function Promote()
; 	Debug.Trace("ARENA: Player promotion.")
	Game.GetPlayer().ModFactionRank(ArenaFaction, 1)
	int rank = Game.GetPlayer().GetFactionRank(ArenaFaction)
	if      (rank == 1)
		FightsToNextLevel = Level1Fights
	elseif (rank == 2)
		FightsToNextLevel = Level2Fights
	elseif (rank == 3)
		FightsToNextLevel = Level3Fights
	elseif (rank == 4)
		FightsToNextLevel = 2147483647 ; int max!!!!!!
	endif
EndFunction

Function StartCombat()
; 	Debug.Trace("ARENA: Someone is calling StartCombat...")
	if (20 <= DB03.GetStage() && 40 > DB03.GetStage())
		CurrentFight = SpecialFightDB
		if (Game.GetPlayer().GetItemCount(LoanerSword) < 1)
			Game.GetPlayer().AddItem(LoanerSword, 1)
		endif
		if (Game.GetPlayer().GetItemCount(LoanerShield) < 1)
			Game.GetPlayer().AddItem(LoanerShield, 1)
		endif
		Game.GetPlayer().EquipItem(LoanerSword)
		Game.GetPlayer().EquipItem(LoanerShield)
	elseif ( (20 == EastmarchJail.GetStage()) && (EastmarchJail.IsRunning()) )
		;CurrentFight = PickNextFight(ArrestOffset)
		CurrentFight = SpecialFightJail
		Game.GetPlayer().AddItem(LoanerSword, 1)
		Game.GetPlayer().AddItem(LoanerShield, 1)
		Game.GetPlayer().EquipItem(LoanerSword)
		Game.GetPlayer().EquipItem(LoanerShield)
	else
		CurrentFight = PickNextFight()
	endif
	
	CurrentFight.Start()
	CombatPreSet = True
	PitDoor.GetReference().Lock(false)
	CombatOngoing = true
EndFunction

ArenaCombatQuest Function PickNextFight(int offset=0)
	int minFight = -1
	int maxFight = -1
	int playerRank = Game.GetPlayer().GetFactionRank(ArenaFaction)
	
	if (FightsToNextLevel <= 0)
		; it's time for the fight for the next level
; 		Debug.Trace("ARENA: transition fight from rank: " + playerRank)
		return TransitionFight
	endif
	
	if     (playerRank == 0)
; 		Debug.Trace("ARENA: rank 0 fight.")
		minFight = 1
		maxFight = 3
		int fightIndex = Utility.RandomInt(minFight, maxFight)
; 		Debug.Trace("ARENA: fight index: " + fightIndex)
		return GetFightQuestFromIndex(fightIndex)
	elseif (playerRank == 1)
; 		Debug.Trace("ARENA: rank 1 fight.")
		bool humanFight = Utility.RandomInt(0, 2)
		if (!humanFight)
			minFight = 2
			maxFight = 3
			int fightIndex = Utility.RandomInt(minFight, maxFight)
; 			Debug.Trace("ARENA: animal fight index: " + fightIndex)
			return GetFightQuestFromIndex(fightIndex)
		else
; 			Debug.Trace("ARENA: NPC fight index: " + 4)
			return Fight04
		endif
	elseif (playerRank == 2) ; ruffian level (5-9)
; 		Debug.Trace("ARENA: rank 2 fight.")
		minFight = 5
		maxFight = 9
		int fightIndex = Utility.RandomInt(minFight, maxFight)
; 		Debug.Trace("ARENA: fight index: " + fightIndex)
		return GetFightQuestFromIndex(fightIndex)
	elseif (playerRank == 3) ; thrasher level, should be mostly NPCs
; 		Debug.Trace("ARENA: rank 3 fight.")
		int animalFight = Utility.RandomInt(0, 2)
		if (animalFight == 0)
			minFight = 7
			maxFight = 9
			int fightIndex = Utility.RandomInt(minFight, maxFight)
			if (fightIndex == 9)
				fightIndex = 10 ; skip the lower-ranked NPC fight
			endif
; 			Debug.Trace("ARENA: fight index: " + fightIndex)
			return GetFightQuestFromIndex(fightIndex)
		else
; 			Debug.Trace("ARENA: NPC fight index: " + 11)
			return Fight11
		endif
	else ; PIT LORD
		; 30% = 8 or 10; 60% = 13; 10% = 12
		int fightRoll = Utility.RandomInt(1, 10) ; 1d10
		if     (fightRoll <= 3)
			if (Utility.RandomInt(0, 1))
				return Fight08
			else
				return Fight10
			endif
		elseif (fightRoll <= 9)
			return Fight13
		else
			return Fight12
		endif
	endif
	
	return None	;fffffffffffffff
EndFunction

Function CombatOver()
	if (WagerOngoing)
		EndWagerFight()
		return
	endif
	CurrentFight.Stop()
	PitDoor.GetReference().Lock(false)
	CombatOngoing = false
	RewardDue = true
	NumberOfPlayerFights += 1
EndFunction

Function Reward()
	PitDoor.GetReference().Lock(true)
	CleanupBodies()
	
	if ( (20 == EastmarchJail.GetStage()) && (EastmarchJail.IsRunning()) )
		; player was completing a fight for being thrown in jail
		Game.GetPlayer().UnequipItem(LoanerSword)
		Game.GetPlayer().UnequipItem(LoanerShield)
		Game.GetPlayer().RemoveItem(LoanerSword, 1)
		Game.GetPlayer().RemoveItem(LoanerShield, 1)
		EastmarchCrimeFaction.SetCrimeGold(0)
		EastmarchCrimeFaction.SetCrimeGoldViolent(0)
		;Game.ServeTime()
		EastmarchJail.SetStage(200)
	elseif (Game.GetPlayer().GetFactionRank(ArenaFaction) >= 4)
		; player is already pit lord, for now reward as normal
		Game.GetPlayer().AddItem(Gold, 100)
	elseif (FightsToNextLevel <= 0)
		; player is still advancing in rank, and is ready to be promoted
		Promote()
	else
		; normal fight, reward as normal
		Game.GetPlayer().AddItem(Gold, 100)
		FightsToNextLevel -= 1
	endif
	RewardDue = false
EndFunction

Function RegisterTransitionCombatant(ObjectReference fighter)
	if (TransitionCombatant.GetReference() != None)
; 		Debug.Trace("ARENA: ERROR -- pre-existing transition combatant!", 2)
		return
	endif
	
	TransitionCombatant.ForceRefTo(fighter)
	TransitionCombatant.GetActorReference().SetNoBleedoutRecovery(true)
EndFunction

Keyword Function GetKeywordForWave(int wave)
	if     (wave == 1)
		return Wave1Keyword
	elseif (wave == 2)
		return Wave2Keyword
	elseif (wave == 3)
		return Wave3Keyword
	elseif (wave == 4)
		return Wave4Keyword
	elseif (wave == 5)
		return Wave5Keyword
	else
		return None
	endif
EndFunction

ObjectReference Function GetDoorForWave(int wave)
	Keyword toMatch = GetKeywordForWave(wave)

	if     (_spawnPoint01.HasKeyword(toMatch))
		return _spawnPoint01.GetLinkedRef(LinkedDoorKeyword)
	elseif (_spawnPoint02.HasKeyword(toMatch))
		return _spawnPoint02.GetLinkedRef(LinkedDoorKeyword)
	elseif (_spawnPoint03.HasKeyword(toMatch))
		return _spawnPoint03.GetLinkedRef(LinkedDoorKeyword)
	elseif (_spawnPoint04.HasKeyword(toMatch))
		return _spawnPoint04.GetLinkedRef(LinkedDoorKeyword)
	elseif (_spawnPoint05.HasKeyword(toMatch))
		return _spawnPoint05.GetLinkedRef(LinkedDoorKeyword)
	else
		return None
	endif
EndFunction

Function RegisterSpawnPoint(ObjectReference spawnMarker)
; 	Debug.Trace("ARENA: Registering spawn point -- " + spawnMarker)
	if     (_spawnPoint01 == None)
		_spawnPoint01 = spawnMarker
	elseif (_spawnPoint02 == None)
		_spawnPoint02 = spawnMarker
	elseif (_spawnPoint03 == None)
		_spawnPoint03 = spawnMarker
	elseif (_spawnPoint04 == None)
		_spawnPoint04 = spawnMarker
	elseif (_spawnPoint05 == None)
		_spawnPoint05 = spawnMarker
	else
; 		Debug.Trace("ARENA ERROR: Too many spawn points!!", 2)
	endif
EndFunction

Function RegisterCombatant(ObjectReference fighter)
	; pacify until fight start
	(fighter as Actor).AddToFaction(PacifyFaction)

	if ((CurrentFight != None) && (CurrentFight as ArenaCombatQuest).IsTransitionFight)
		RegisterTransitionCombatant(fighter)
		return
	endif

	if     (Combatant01.ForceRefIfEmpty(fighter))
; 		Debug.Trace("ARENA: Registered body for cleanup: 1")
	elseif (Combatant02.ForceRefIfEmpty(fighter))
; 		Debug.Trace("ARENA: Registered body for cleanup: 2")
	elseif (Combatant03.ForceRefIfEmpty(fighter))
; 		Debug.Trace("ARENA: Registered body for cleanup: 3")
	elseif (Combatant04.ForceRefIfEmpty(fighter))
; 		Debug.Trace("ARENA: Registered body for cleanup: 4")
	elseif (Combatant05.ForceRefIfEmpty(fighter))
; 		Debug.Trace("ARENA: Registered body for cleanup: 5")
	elseif (Combatant06.ForceRefIfEmpty(fighter))
; 		Debug.Trace("ARENA: Registered body for cleanup: 6")
	elseif (Combatant07.ForceRefIfEmpty(fighter))
; 		Debug.Trace("ARENA: Registered body for cleanup: 7")
	elseif (Combatant08.ForceRefIfEmpty(fighter))
; 		Debug.Trace("ARENA: Registered body for cleanup: 8")
	elseif (Combatant09.ForceRefIfEmpty(fighter))
; 		Debug.Trace("ARENA: Registered body for cleanup: 9")
	elseif (Combatant10.ForceRefIfEmpty(fighter))
; 		Debug.Trace("ARENA: Registered body for cleanup: 10")
	else
; 		Debug.TraceAndBox("ARENA ERROR: Too many arena combatants!!", 2)
	endif
EndFunction

Function CleanupBodies()
	; Shane still wants arrays
	if _CleanupBody(Combatant01)
; 		Debug.Trace("ARENA: Cleaned up body: 1")
	endif
	if _CleanupBody(Combatant02)
; 		Debug.Trace("ARENA: Cleaned up body: 2")
	endif
	if _CleanupBody(Combatant03)
; 		Debug.Trace("ARENA: Cleaned up body: 3")
	endif
	if _CleanupBody(Combatant04)
; 		Debug.Trace("ARENA: Cleaned up body: 4")
	endif
	if _CleanupBody(Combatant05)
; 		Debug.Trace("ARENA: Cleaned up body: 5")
	endif
	if _CleanupBody(Combatant06)
; 		Debug.Trace("ARENA: Cleaned up body: 6")
	endif
	if _CleanupBody(Combatant07)
; 		Debug.Trace("ARENA: Cleaned up body: 7")
	endif
	if _CleanupBody(Combatant08)
; 		Debug.Trace("ARENA: Cleaned up body: 8")
	endif
	if _CleanupBody(Combatant09)
; 		Debug.Trace("ARENA: Cleaned up body: 9")
	endif
	if _CleanupBody(Combatant10)
; 		Debug.Trace("ARENA: Cleaned up body: 10")
	endif
	
	; clear out the TransitionCombatant, too
	if (TransitionCombatant.GetReference() != None)
; 		Debug.Trace("ARENA: Clearing transition combatant...")
		Actor ref = TransitionCombatant.GetActorReference()
		Game.GetPlayer().RemoveFromFaction(SelfLoathing)
		ref.RemoveFromFaction(SelfLoathing)
		ref.SetFactionRank(ArenaFaction, 4)
		ref.SetNoBleedoutRecovery(false)
		TransitionCombatant.Clear()
	endif

	; deregister the spawn points
	_spawnPoint01 = None
	_spawnPoint02 = None
	_spawnPoint03 = None
	_spawnPoint04 = None
	_spawnPoint05 = None

	; close the doors
	Gate1.SetOpen(False)
	Gate2.SetOpen(False)
	Gate3.SetOpen(False)
EndFunction

bool Function _CleanupBody(ReferenceAlias combatant)
	if (combatant.GetReference() != None)
		Actor ref = combatant.GetActorReference()
		combatant.Clear()

		if (WagerOngoing)
			; take 'em out no matter what
			ref.Delete()
		else
			; they might still be alive if it's a blunted quest
			if (ref.IsDead())
				ref.Delete()
			else
				ref.MoveToMyEditorLocation()
				ref.ResetHealthAndLimbs()
			endif
		endif
		return true
	else
		return false
	endif
EndFunction

