;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 48
Scriptname QF_MS13_00039645 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ArvelsJournal
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ArvelsJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BFShoutTrigger02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BFShoutTrigger02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Camilla
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Camilla Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riverwood
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Riverwood Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BleakFallsLookMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BleakFallsLookMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LucanClaw
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LucanClaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lucan
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Lucan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GoldenClaw
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GoldenClaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RadiantReserveMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RadiantReserveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arvel
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Arvel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FrostbiteSpider
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FrostbiteSpider Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShoutPower
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ShoutPower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HallofStoriesDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_HallofStoriesDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArvelWeb
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ArvelWeb Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BFShoutTrigger01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BFShoutTrigger01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BFShoutTrigger02000
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BFShoutTrigger02000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DoorToBleakFallsBarrow
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DoorToBleakFallsBarrow Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;Cue cut arvel down objective
SetObjectiveDisplayed(15, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
;Cue spider
SpiderScene.Start()

;trigger repeat shouting
kmyquest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
AchievementsQuest.IncSideQuests()
;Player brings the claw to Lucan
SetObjectiveCompleted(35, 1)
SetObjectiveCompleted(40, 1)

Game.GetPlayer().RemoveItem(kmyquest.GoldenClaw, 1)
Alias_LucanClaw.GetRef().Enable()
Game.GetPlayer().AddItem(LvlQuestReward02Medium)

;Lucan and Camilla are now your friends
Alias_Lucan.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)

If Alias_Camilla.GetActorRef().IsDead() == False
  Alias_Camilla.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
EndIf

kmyquest.MS13FIN.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
;Arvel Shout Trigger
ArvelShout03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;For testing only! Kill quest
SetStage(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
;Arvel Shout Trigger
ArvelShout02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
;Player has talked to Arvel
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Camilla and Lucan are both dead, fail quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

;Escort scene, only play if Camilla and Lucan are alive
If (Alias_Lucan.GetActorRef().IsDead() == False) && (Alias_Camilla.GetActorRef().IsDead() == False)
  pCamillaEscortOfferScene.Start()
EndIf

;complete the misc objective to talk to Lucan
MS13Intro.SetObjectiveCompleted(10, 1)

kmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

;Escort scene, only play if Camilla and Lucan are alive
If (Alias_Lucan.GetActorRef().IsDead() == False) && (Alias_Camilla.GetActorRef().IsDead() == False)
  pCamillaEscortOfferScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;Player finds out who the owner of the claw is

If GetStageDone(60) == 0
  SetObjectiveCompleted(35, 1)
EndIf

;Player doesn't have the quest, and Lucan is alive
If (GetStageDone(60) == 1) && (GetStageDone(10) == 0) && (Alias_Lucan.GetActorRef().IsDead() == False)
  SetObjectiveDisplayed(40, 1)
EndIf

;Player doesn't have the quest, but Lucan is dead
If (GetStageDone(60) == 1) && (GetStageDone(10) == 0) && (Alias_Lucan.GetActorRef().IsDead() == True)
  SetObjectiveDisplayed(45, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
;Player uses the claw in the Hall of Stories
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has the claw
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
;Frostbite spider is dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;Arvel Shout Trigger
ArvelShout01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
;Player gains the Shout Power
SetObjectiveCompleted(30, 1)

;Player has not talked to Lucan or Camilla yet or read the journal
If GetStageDone(10) == 0 && GetStageDone(37) == 0
  SetObjectiveDisplayed(35, 1)
EndIf

;Player has the quest, and Lucan is alive
If (GetStageDone(10) == 1) && (Alias_Lucan.GetActorRef().IsDead() == False)
  SetObjectiveDisplayed(40, 1)
ElseIf GetStageDone(37) == 1 && (Alias_Lucan.GetActorRef().IsDead() == False)
  SetObjectiveDisplayed(40, 1)
EndIf

;Player has the quest, but Lucan is dead
If (GetStageDone(10) == 1) && (Alias_Lucan.GetActorRef().IsDead() == True)
  SetObjectiveDisplayed(45, 1)
ElseIf GetStageDone(37) == 1 && (Alias_Lucan.GetActorRef().IsDead() == True)
  SetObjectiveDisplayed(45, 1)
EndIf

;Stop the quest if Lucan and Camilla are dead
If (GetStageDone(200) == 1)
  Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
;Player goes to Bleak Falls Barrow first
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Scene between Camilla and Lucan has played
Alias_Camilla.GetActorReference().EvaluatePackage()
Alias_Lucan.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
AchievementsQuest.IncSideQuests()
;Player brings the claw to Camilla
SetObjectiveCompleted(35, 1)
SetObjectiveCompleted(45, 1)

Game.GetPlayer().RemoveItem(kmyquest.GoldenClaw, 1)
Alias_Camilla.GetActorRef().AddItem(kmyquest.GoldenClaw, 1)
Alias_LucanClaw.GetRef().Enable()
Game.GetPlayer().AddItem(LvlQuestReward02Medium)
Alias_Camilla.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
kmyquest.MS13FIN.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE MS13QuestScript
Quest __temp = self as Quest
MS13QuestScript kmyQuest = __temp as MS13QuestScript
;END AUTOCAST
;BEGIN CODE
;Arvel is free
SetObjectiveCompleted(15, 1)
SetObjectiveDisplayed(10, abforce=true)
Alias_Arvel.GetActorReference().setav("Variable01",1)
Alias_Arvel.GetActorReference().evaluatePackage()
kmyquest.UnRegisterForUpdate()
MS13ArvelRunsScene.Start()
Alias_Arvel.GetActorRef().SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Action Property Action_Arvel  Auto  

Scene Property ArvelShout01  Auto  

Scene Property ArvelShout02  Auto  

Scene Property ArvelShout03  Auto  

Scene Property SpiderScene  Auto  

Scene Property ArvelStuck  Auto  

Scene Property MS13ArvelRunsScene  Auto  

Quest Property DialogueRiverwoodArgueScene  Auto  
Quest Property MS13Intro  Auto 

MiscObject Property Gold  Auto  

Scene Property pCamillaEscortOfferScene  Auto  



LeveledItem Property LvlQuestReward02Medium  Auto  

AchievementsScript Property AchievementsQuest  Auto  
