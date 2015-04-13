;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 35
Scriptname QF_MS09_0001CF26 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MS09AvulsteinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS09AvulsteinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS09IdolafAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS09IdolafAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS09SonsSoldier1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS09SonsSoldier1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS09SonsSoldier2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS09SonsSoldier2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS09AvulsteinKeepMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS09AvulsteinKeepMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS09ThoraldAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS09ThoraldAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS09FraliaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS09FraliaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS09OlfinaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS09OlfinaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KeepFrontDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KeepFrontDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NorthwatchKeepAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NorthwatchKeepAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS09JonAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS09JonAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS09MissiveAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS09MissiveAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MS09QuestScript
Quest __temp = self as Quest
MS09QuestScript kmyQuest = __temp as MS09QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10,1)
ArgueScene.Stop()
kmyquest.MS09HomeSceneStart = 1
MS09GrayManeHouseScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;MS09triggerDisableRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(40,1)
SetObjectiveCompleted(50,1)
SetObjectiveCompleted(55,1)
SetObjectiveDisplayed(60,1)
Alias_MS09ThoraldAlias.GetActorReference().GetActorBase().SetProtected(False)
Alias_MS09ThoraldAlias.GetActorReference().SetFactionRank(ThalmorFaction,-1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
stop()
Game.GetPlayer().SetFactionRank(MS09AllyFaction,-1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
Alias_MS09SonsSoldier1.GetReference().Disable()
Alias_MS09SonsSoldier2.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE MS09QuestScript
Quest __temp = self as Quest
MS09QuestScript kmyQuest = __temp as MS09QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(110,1)
Game.GetPlayer().Additem(MS09Reward, 1)
Alias_MS09ThoraldAlias.GetActorReference().RemoveFromFaction(FavorExcludedFaction)
Alias_MS09ThoraldAlias.GetReference().Disable()
if GetStageDone(50)==1
Alias_MS09AvulsteinAlias.GetReference().Disable()
endif
Alias_MS09ThoraldAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardLarge.GetValueInt())
Alias_MS09FraliaAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardLarge.GetValueInt())
Alias_MS09AvulsteinAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardLarge.GetValueInt())
AchievementsQuest.IncSideQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE MS09QuestScript
Quest __temp = self as Quest
MS09QuestScript kmyQuest = __temp as MS09QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(110,1)
Game.GetPlayer().Additem(Gold, 200)
Alias_MS09ThoraldAlias.GetActorReference().RemoveFromFaction(FavorExcludedFaction)
Alias_MS09ThoraldAlias.GetReference().Disable()
if GetStageDone(50)==1
Alias_MS09AvulsteinAlias.GetReference().Disable()
endif
Alias_MS09ThoraldAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardLarge.GetValueInt())
Alias_MS09FraliaAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardLarge.GetValueInt())
Alias_MS09AvulsteinAlias.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardLarge.GetValueInt())
AchievementsQuest.IncSideQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(110,1)
if GetStageDone(50)==0
if Alias_MS09AvulsteinAlias.GetReference().GetDistance(Game.GetPlayer()) > 10000
Alias_MS09AvulsteinAlias.GetReference().Disable()
endif
endif
Game.GetPlayer().SetFactionRank(MS09AllyFaction,-1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
NorthwatchKeepInterior.Reset()
Alias_MS09ThoraldAlias.GetReference().Enable()
if Game.GetPlayer().GetItemCount(Alias_MS09MissiveAlias.GetReference()) > 0
SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE MS09QuestScript
Quest __temp = self as Quest
MS09QuestScript kmyQuest = __temp as MS09QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(50,1)
kmyQuest.RegisterforSingleUpdate(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
SetObjectiveFailed(110,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
if IsObjectiveDisplayed(40)
SetObjectiveFailed(40)
endif
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(55,1)
Alias_MS09AvulsteinAlias.GetActorReference().SetFactionRank(MS09AllyFaction,0)
Game.GetPlayer().SetFactionRank(MS09AllyFaction,0)
;Alias_MS09ThoraldAlias.GetActorReference().SetFactionRank(MS09AllyFaction, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveCompleted(40,1)
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property ArgueScene  Auto  

Faction Property MS09AllyFaction  Auto  

Faction Property FavorExcludedFaction  Auto  

Faction Property ThalmorFaction  Auto  

miscobject Property gold  Auto  

ObjectReference Property MS09TriggerDisableRef  Auto  

Cell Property NorthwatchKeepInterior  Auto  

LeveledItem Property MS09Reward  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Scene Property MS09GrayManeHouseScene  Auto  
