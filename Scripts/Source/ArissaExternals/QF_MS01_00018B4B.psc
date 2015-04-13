;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 85
Scriptname QF_MS01_00018B4B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Warrens
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Warrens Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShrineofTalos
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ShrineofTalos Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MargretDresser
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MargretDresser Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dryston
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dryston Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DrystonNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DrystonNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Garvey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Garvey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThonarDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThonarDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WarrensCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WarrensCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Donnel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Donnel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShrineofTalosCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShrineofTalosCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NeposJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NeposJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MargretLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MargretLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nepos
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nepos Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rhiada
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rhiada Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasuryHouseEntrance
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasuryHouseEntrance Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eltrys
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eltrys Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hogni
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hogni Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kerah
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kerah Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thonar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thonar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Margret
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Margret Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Inn
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Inn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Weylin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Weylin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MargretDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MargretDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WeylinNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WeylinNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WeylinChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WeylinChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EltrysDead
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EltrysDead Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Uaile
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Uaile Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tynan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tynan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Betrid
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Betrid Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThonarJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThonarJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Morven
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Morven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ildene
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ildene Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NeposDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NeposDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WeylinDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WeylinDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
;Player is told to read Thonar's Journal
If GetStageDone(70) == 0
  SetObjectiveCompleted(50, 1)
  SetObjectiveDisplayed(55, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_78
Function Fragment_78()
;BEGIN CODE
;Player is told to read Nepos's Journal
SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(65, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
;Player knows where Weylin's room is
SetObjectiveDisplayed(40, 1)

If Game.GetPlayer().GetItemCount(MS01WeylinKey) >= 1
  SetStage(45)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
;Eltrys pays player for info
Game.GetPlayer().AddItem(LvlQuestReward02Medium)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
;Start smelter brawl scene if Nepos is alive
If Alias_Nepos.GetActorRef().IsDead() == False
  MS01ForswornThreatenScene.SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
;Player knows to talk to Nepos
SetObjectiveCompleted(25, 1)
SetObjectiveCompleted(27, 1)
SetObjectiveCompleted(28, 1)
SetObjectiveDisplayed(60, 1)

;Jump ahead if the player already has the evidence
If Game.GetPlayer().GetItemCount(MS01NeposJournal) >= 1
  SetStage(80)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
;Player told to read Margret's Journal
If GetStageDone(38) == 0
  SetObjectiveCompleted(20, 1)
  SetObjectiveDisplayed(22, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
; guard forcegreets the player
AchievementsQuest.IncSideQuests()
SetObjectiveCompleted(70, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
AchievementsQuest.IncSideQuests()
SetObjectiveCompleted(70, 1)
MS02.SetStage(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN CODE
;Eltrys pays player for info
Game.GetPlayer().AddItem(LvlQuestReward02Medium)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE MS01QuestScript
Quest __temp = self as Quest
MS01QuestScript kmyQuest = __temp as MS01QuestScript
;END AUTOCAST
;BEGIN CODE
;Player agrees to help Eltrys
MS01MiscObjectives.SetStage(20)
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
SetObjectiveDisplayed(25, 1)

;If the player already has Margret's journal
If Game.GetPlayer().GetItemCount(MS01MargretJournal) >= 1
  SetStage(38)
EndIf

;If the player already has Weylin's note
If Game.GetPlayer().GetItemCount(MS01WeylinNote) >= 1
  SetStage(48)
EndIf

;Make sure the bodies are cleaned up
MS01IntroWorldScene.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_73
Function Fragment_73()
;BEGIN CODE
;Deal with Madanach topic unlocked
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
;Mulush blocking topic done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
;Player is told to see Margret because she's still alive
SetObjectiveDisplayed(35, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_76
Function Fragment_76()
;BEGIN CODE
;Player is told to read Weylin's note
If GetStageDone(48) == 0
  SetObjectiveCompleted(25, 1)
  SetObjectiveDisplayed(27, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
;Player blows off Eltrys
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_69
Function Fragment_69()
;BEGIN CODE
;Trigger Betrid murder scene
MS01IldeneScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
;Eltrys is dead, disable and enable dead version
Alias_Eltrys.GetActorRef().Disable()
Alias_EltrysDead.GetActorRef().Enable()

MS01GuardAmbushQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE MS01QuestScript
Quest __temp = self as Quest
MS01QuestScript kmyQuest = __temp as MS01QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has read the note
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
;Player knows to go to the Treasury House
SetObjectiveCompleted(20, 1)
SetObjectiveCompleted(22, 1)
SetObjectiveCompleted(35, 1)
SetObjectiveDisplayed(50, 1)

;guard threaten handler
SetStage(37)

;Jump ahead if the player already has the evidence
If Game.GetPlayer().GetItemCount(MS01ThonarJournal) >= 1
  SetStage(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
;Donnel and Ildene are dead
Alias_Thonar.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
;Player knows Garvey has the key
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;Player gets the key to Margret's room
SetObjectiveCompleted(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
;Player has the key to Weylin's room
SetObjectiveCompleted(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_80
Function Fragment_80()
;BEGIN CODE
;Eltrys has forcegreeted in the shrine
Alias_Eltrys.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_84
Function Fragment_84()
;BEGIN CODE
;Start guard intimidating scene
MS01GuardThreatenScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_79
Function Fragment_79()
;BEGIN CODE
;Player reads Weylin's note
SetObjectiveCompleted(25, 1)
SetObjectiveCompleted(27, 1)
SetObjectiveDisplayed(28, 1)

;Jump ahead if the player already has the evidence
If Game.GetPlayer().GetItemCount(MS01NeposJournal) >= 1
  SetStage(80)
EndIf

;brawl with Dryston handler
SetStage(43)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE MS01QuestScript
Quest __temp = self as Quest
MS01QuestScript kmyQuest = __temp as MS01QuestScript
;END AUTOCAST
;BEGIN CODE
;Eltrys hands the player the note
MS01MiscObjectives.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_70
Function Fragment_70()
;BEGIN CODE
;Treasury House Forsworn attack
Alias_Betrid.GetActorRef().Kill()
Actor IldeneREF = Alias_Ildene.GetActorRef()
Actor DonnelREF = Alias_Donnel.GetActorRef()

IldeneREF.SetAv("Aggression", 2)
IldeneREF.AddtoFaction(MS01PlayerEnemyFaction)
IldeneREF.AddtoFaction(MS01TreasuryHouseEnemy)

DonnelREF.SetAV("Aggression", 2)
DonnelREF.AddtoFaction(MS01PlayerEnemyFaction)
DonnelREF.AddtoFaction(MS01TreasuryHouseEnemy)

;clear crime factions
IldeneREF.RemoveFromFaction(CrimeFactionReach)
DonnelREF.RemoveFromFaction(CrimeFactionReach)

;Lock the door
;Alias_TreasuryHouseEntrance.GetRef().Lock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_74
Function Fragment_74()
;BEGIN CODE
;Thonar tells the player to leave for good
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
;Nepos has confessed
SetObjectiveCompleted(60, 1)
SetObjectiveCompleted(65, 1)
If GetStageDone(70) == 1
  SetObjectiveDisplayed(70, 1)
EndIf
;Check when the player leaves dialogue
Alias_Nepos.RegisterForUpdate(5)
SetStage(90)

;add Gold to Eltrys for player reward later
Alias_Eltrys.GetActorRef().AddItem(LvlQuestReward02Medium)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
;Nepos beckons the player inside
MS01NeposScene.Start()
Alias_Uaile.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
;Unlock the door to Thonar's room
Alias_ThonarDoor.GetRef().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN CODE
;Thonar spills the beans
SetObjectiveCompleted(50, 1)
SetObjectiveCompleted(55, 1)

If GetStageDone(80) == 1
  SetObjectiveDisplayed(70, 1)
EndIf

;unlock the door
;Alias_TreasuryHouseEntrance.GetRef().Lock(false)

SetStage(90)

;add Gold to Eltrys for player reward later
Alias_Eltrys.GetActorRef().AddItem(LvlQuestReward02Medium)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
;Player is allowed to talk to Nepos
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_66
Function Fragment_66()
;BEGIN CODE
;Lock the door
;Alias_NeposDoor.GetRef().Lock()
Alias_Nepos.UnregisterForUpdate()

;Forsworn in Nepos's house attack
Alias_Uaile.GetActorRef().AddtoFaction(MS01PlayerEnemyFaction)
Alias_Tynan.GetActorRef().AddtoFaction(MS01PlayerEnemyFaction)
Alias_Morven.GetActorRef().AddtoFaction(MS01PlayerEnemyFaction)
Alias_Nepos.GetActorRef().AddtoFaction(MS01PlayerEnemyFaction)

;clear crime factions
Alias_Uaile.GetActorRef().RemoveFromFaction(CrimeFactionReach)
Alias_Tynan.GetActorRef().RemoveFromFaction(CrimeFactionReach)
Alias_Morven.GetActorRef().RemoveFromFaction(CrimeFactionReach)
Alias_Nepos.GetActorRef().RemoveFromFaction(CrimeFactionReach)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
;Player knows where Margret's room is
SetObjectiveDisplayed(30, 1)

If Game.GetPlayer().GetItemCount(MS01MargretKey) >= 1
  SetStage(32)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_82
Function Fragment_82()
;BEGIN CODE
;Thonar has forcegreeted
Alias_Thonar.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property SilverFishInn  Auto  

Quest Property MS02  Auto  




ObjectReference Property pEltrysDeadMarker  Auto  

Weapon Property pReachmanAxe  Auto  

MiscObject Property pGold  Auto  

Quest Property pIntroScene  Auto  

ActorBase Property EltrysBase  Auto  

Quest Property MS01MiscObjectives  Auto  

Key Property MS01MargretKey  Auto  

Book Property MS01MargretJournal  Auto  

Quest Property MS01GuardThreatenScene  Auto  

Key Property MS01WeylinKey  Auto  

Book Property MS01WeylinNote  Auto  

Quest Property MS01ForswornThreatenScene  Auto  

Faction Property MS01PlayerEnemyFaction  Auto  

Book Property MS01NeposJournal  Auto  

Faction Property MS01TreasuryHouseEnemy  Auto  

Scene Property MS01IldeneScene  Auto  

Book Property MS01ThonarJournal  Auto  

Faction Property CrimeFactionReach  Auto  

Scene Property MS01NeposScene  Auto  

Quest Property MS01GuardAmbushQuest  Auto  



Quest Property MS01IntroWorldScene  Auto  

LeveledItem Property LvlQuestReward01Medium  Auto  

LeveledItem Property LvlQuestReward02Medium  Auto  

AchievementsScript Property AchievementsQuest  Auto  
