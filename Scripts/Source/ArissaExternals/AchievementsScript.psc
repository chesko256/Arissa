Scriptname AchievementsScript extends Quest  

; Define a property that points to the script on this quest, and call the function
;
; Declare this in your script:
; 	AchievementsScript Property AchievementsQuest Auto
;
; Call this function:
; 	AchievementsQuest.IncSideQuests()

Int SideQuestCount 
Int MaxSideQuests = 10
Int DaedricArtifactCount 
Int MaxDaedricArtifacts = 15

; Required values that stats incremented in code need to meet in order to obtain the associated achievement
Int NumCompletedMiscObjectivesNeeded = 50
Int NumLocksPickedNeeded = 50
Int NumPocketsPickedNeeded = 50
Int BountyNeeded = 1000
Int GoldNeeded = 100000
Int NumClearedDungeonsNeeded = 50
Int SkillValueNeeded = 100
Int NumLocationDiscoveriesNeeded = 100
Int NumSolstheimLocationDiscoveriesNeeded = 30
Int NumReadSkillBooksNeeded = 50
Int NumDragonSoulsAbsorbed = 20
Int NumShoutsLearnedNeeded = 20
Int ApprenticeLevel = 5
Int AdeptLevel = 10
Int ExpertLevel = 25
Int MasterLevel = 50

; _____________
;|			   |
;|    EVENTS   |
;|_____________|
EVENT OnInit()
	; Listen for when tracked stats are incremented
	RegisterForTrackedStatsEvent()
endEVENT

EVENT OnTrackedStatsEvent(string statFilter, int statValue)
	; Hero of the People achievement
	if (statFilter == "Misc Objectives Completed")
		if (statValue >= NumCompletedMiscObjectivesNeeded)
			Game.AddAchievement(25)
		endif
	; Thief achievement
	elseIf (statFilter == "Locks Picked")
		if (statValue >= NumLocksPickedNeeded)
			if (Game.QueryStat("Pockets Picked") >= NumPocketsPickedNeeded)
				Game.AddAchievement(27)
			endif
		endif
	elseIf (statFilter == "Pockets Picked")
		if (statValue >= NumPocketsPickedNeeded)
			if (Game.QueryStat("Locks Picked") >= NumLocksPickedNeeded)
				Game.AddAchievement(27)
			endif
		endif
	; Artificer achievement
	elseIf (statFilter == "Weapons Made" || statFilter == "Armor Made")
		if (Game.QueryStat("Magic Items Made") && (Game.QueryStat("Potions Mixed") || Game.QueryStat("Poisons Mixed")))
			Game.AddAchievement(34)
		endif
	elseIf (statFilter == "Magic Items Made")
		if ((Game.QueryStat("Weapons Made") || Game.QueryStat("Armor Made")) && (Game.QueryStat("Potions Mixed") || Game.QueryStat("Poisons Mixed")))
			Game.AddAchievement(34)
		endif
	elseIf (statFilter == "Potions Mixed" || statFilter == "Poisons Mixed")
		if ((Game.QueryStat("Weapons Made") || Game.QueryStat("Armor Made")) && Game.QueryStat("Magic Items Made"))
			Game.AddAchievement(34)
		endif
	; Stalhrim Crafter achievement
	elseIf (statFilter == "StalhrimItemsCrafted")
		Game.AddAchievement(72)
	; Master Criminal achievement
	elseIf (statFilter == "Eastmarch Bounty" || statFilter == "Falkreath Bounty" || statFilter == "Haafingar Bounty" || statFilter == "Hjaalmarch Bounty" || statFilter == "The Pale Bounty" || statFilter == "The Reach Bounty" ||statFilter == "The Rift Bounty" || statFilter == "Whiterun Bounty" || statFilter == "Winterhold Bounty" )
		if (statValue >= BountyNeeded)
			if (Game.QueryStat("Eastmarch Bounty") >= BountyNeeded && Game.QueryStat("Falkreath Bounty") >= BountyNeeded && Game.QueryStat("Haafingar Bounty") >= BountyNeeded && Game.QueryStat("Hjaalmarch Bounty") >= BountyNeeded && Game.QueryStat("The Pale Bounty") >= BountyNeeded && Game.QueryStat("The Reach Bounty") >= BountyNeeded && Game.QueryStat("The Rift Bounty") >= BountyNeeded && Game.QueryStat("Whiterun Bounty") >= BountyNeeded && Game.QueryStat("Winterhold Bounty") >= BountyNeeded)
				Game.AddAchievement(35)
			endif
		endif
	; Golden Touch achievement
	elseIf (statFilter == "Most Gold Carried")
		if (statValue >= GoldNeeded)
			Game.AddAchievement(36)
		endif
	; Delver achievement
	elseIf (statFilter == "Dungeons Cleared")
		if (statValue >= NumClearedDungeonsNeeded)
			Game.AddAchievement(37)
		endif
	; Skill Master achievement
	elseIf (statFilter == "Skill Increases")
		if (statValue >= SkillValueNeeded)
			Game.AddAchievement(38)
		endif
	; Explorer achievement
	elseIf (statFilter == "Locations Discovered")
		if (statValue >= NumLocationDiscoveriesNeeded)
			Game.AddAchievement(39)
		endif
	; Solstheim Explorer achievement
	elseIf (statFilter == "Solstheim Locations Discovered")
		if (statValue >= NumSolstheimLocationDiscoveriesNeeded)
			Game.AddAchievement(75)
		endif
	; Reader achievement
	elseIf (statFilter == "Skill Books Read")
		if (statValue >= NumReadSkillBooksNeeded)
			Game.AddAchievement(40)
		endif
	elseIf (statFilter == "Dragon Souls Collected")
		; Dragon Soul achievement
		Game.AddAchievement(43)
		; Dragon Hunter achievement
		if (statValue >= NumDragonSoulsAbsorbed)
			Game.AddAchievement(44)
		endif
	; Words of Power achievement
	elseIf (statFilter == "Shouts Mastered")
		Game.AddAchievement (45)
	; Thu'um Master achievement
	elseIf (statFilter == "Shouts Learned")
		if (statValue >= NumShoutsLearnedNeeded)
			Game.AddAchievement(46)
		endif
	elseIf (statFilter == "Level Increases")
		; Apprentice achievement
		if (statValue >= ApprenticeLevel)
			Game.AddAchievement(47)
		endif
		; Adept achievement
		if (statValue >= AdeptLevel)
			Game.AddAchievement(48)
		endif
		; Expert achievement
		if (statValue >= ExpertLevel)
			Game.AddAchievement(49)
		endif
		; Master achievement
		if (statValue >= MasterLevel)
			Game.AddAchievement(50)
		endif
	endif
endEVENT

; _____________
;|			   |
;|  FUNCTIONS  |
;|_____________|	
Function IncSideQuests()
	SideQuestCount += 1
	Game.IncrementStat( "Side Quests Completed" )
	If SideQuestCount >= MaxSideQuests
		Game.AddAchievement(24)
	EndIf
EndFunction

Function IncDaedricArtifacts()
	DaedricArtifactCount += 1
	Game.AddAchievement(41)		
	If DaedricArtifactCount >= MaxDaedricArtifacts
		Game.AddAchievement(42)
	EndIf
EndFunction

Function IncDaedricQuests()
	; WJS - empty call, UI handles this stat, but in case we need a function call later for when Daedric Quests complete
	;Game.IncrementStat( "Daedric Quests Completed" )
EndFunction

Function IncHardWorker(int AkObjectType)


	if HardWorkerDone==false
		if AkObjectType==1
			HardWorkerChoppedWood=true
			if HardWorkerMinedOre == true
				if HardWorkerCookedFood == true
					Game.AddAchievement(26)
					HardWorkerDone=true
				endif
			endif
		elseif AkObjectType==2
			HardWorkerMinedOre=true
			if HardWorkerChoppedWood == true
				if HardWorkerCookedFood == true
					Game.AddAchievement(26)
					HardWorkerDone=true
				endif
			endif		
		elseif AkObjectType==3
			HardWorkerCookedFood=true
			if HardWorkerChoppedWood == true
				if HardWorkerMinedOre == true
					Game.AddAchievement(26)
					HardWorkerDone=true
				endif
			endif
		endif
	endif
EndFunction


Bool Property HardWorkerChoppedWood   Auto

Bool Property HardWorkerMinedOre  Auto

Bool Property HardWorkerCookedFood   Auto

Bool Property HardWorkerDone  Auto