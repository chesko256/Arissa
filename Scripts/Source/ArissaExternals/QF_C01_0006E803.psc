;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_C01_0006E803 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AmbushSH2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushSH2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MacGuffin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MacGuffin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Observer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Observer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DungeonMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushSH4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushSH4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KeyContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KeyContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Key
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Key Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushSH3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushSH3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushSH5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushSH5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObserverWerewolfStorage
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ObserverWerewolfStorage Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushSH1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushSH1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JorrvaskrTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JorrvaskrTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skjor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skjor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE C01QuestScript
Quest __temp = self as Quest
C01QuestScript kmyQuest = __temp as C01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE C01QuestScript
Quest __temp = self as Quest
C01QuestScript kmyQuest = __temp as C01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Init()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE C01QuestScript
Quest __temp = self as Quest
C01QuestScript kmyQuest = __temp as C01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).ShutdownRadiantQuestsFor(Alias_Observer.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE C01QuestScript
Quest __temp = self as Quest
C01QuestScript kmyQuest = __temp as C01QuestScript
;END AUTOCAST
;BEGIN CODE
(FragmentTracking as CompanionsBladeFragmentTracking).ReturnFragment(Alias_MacGuffin.GetRef())
Game.GetPlayer().RemoveItem(Alias_MacGuffin.GetRef(), 1)
Alias_Observer.GetActorReference().SetPlayerTeammate(false, false)
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CleanupFollowerState()
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).UnShutup(Alias_Observer.GetActorReference())
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CurrentFollower.Clear()
Alias_Observer.GetActorRef().AddToFaction(IsGuardFaction)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompleteStoryQuest(kmyQuest)
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).ShutDownRadiantQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE C01QuestScript
Quest __temp = self as Quest
C01QuestScript kmyQuest = __temp as C01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CycleRadiantQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)

C02Kicker.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE C01QuestScript
Quest __temp = self as Quest
C01QuestScript kmyQuest = __temp as C01QuestScript
;END AUTOCAST
;BEGIN CODE
if (!GetStageDone(20)) ; in case Skjor is the observer and stage 20 was never run
	SetObjectiveCompleted(10, 1) 
endif

Alias_DungeonMarker.GetReference().AddToMap()
ToggleMarker.Disable()
Alias_MacGuffin.GetRef().SetNoFavorAllowed(true)

Alias_Observer.GetActorReference().SetPlayerTeammate(true, false)
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).SwapFollowers()
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).Shutup(Alias_Observer.GetActorReference())
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CurrentFollower.ForceRefTo(Alias_Observer.GetRef())
Alias_Observer.GetActorRef().RemoveFromFaction(IsGuardFaction)

SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ToggleMarker  Auto  

Quest Property C02Kicker  Auto  

Quest Property FragmentTracking  Auto  

Faction Property IsGuardFaction  Auto  
