;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname QF_T03_0001C48E Extends Quest Hidden

;BEGIN ALIAS PROPERTY SprigganEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SprigganEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Danica
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Danica Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SapBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SapBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nettlebane
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nettlebane Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Maurice
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Maurice Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrphanRockMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OrphanRockMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EldergleamSap
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EldergleamSap Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eldergleam
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eldergleam Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DanicaEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DanicaEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EldergleamCollisionMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EldergleamCollisionMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrphanRockLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OrphanRockLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EldergleamSapling
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EldergleamSapling Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SanctuaryEntranceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SanctuaryEntranceMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrphanRockEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OrphanRockEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EldergleamMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EldergleamMapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

; Turn on Maurice (in WhiterunTempleOfKynareth)
Alias_Maurice.GetReference().Enable()

;since player has Nettlebane now, need to disable collision in Eldergleam Sanctuary
Alias_EldergleamCollisionMarker.getReference().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
if (!IsObjectiveCompleted(30))
	SetObjectiveDisplayed(30, 0)
endif
SetObjectiveDisplayed(40, 0)
SetObjectiveDisplayed(50, 1)

Alias_Eldergleam.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

T03Intro.SetStage(20)

Alias_OrphanRockEnableMarker.GetReference().Enable()
Alias_OrphanRockMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Maurice.GetReference().RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE T03QuestScript
Quest __temp = self as Quest
T03QuestScript kmyQuest = __temp as T03QuestScript
;END AUTOCAST
;BEGIN CODE
if (!IsObjectiveCompleted(30))
	SetObjectiveDisplayed(30, 0)
endif
SetObjectiveCompleted(40, 1)
SetObjectiveCompleted(50, 1)
SetObjectiveCompleted(55, 1)
SetObjectiveDisplayed(70, 1)

kmyQuest.PlayerTookSap = true
if (!kmyQuest.MauriceShouldFollow)
	Alias_Maurice.GetRef().Disable()
endif
kmyQuest.MauriceShouldFollow = False
Alias_Maurice.GetActorReference().SetPlayerTeammate(false, false)
Alias_Maurice.GetActorReference().EvaluatePackage()
kmyQuest.StuffHitsTheFan()
Alias_Eldergleam.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
AchievementsQuest.IncSideQuests()
Alias_Nettlebane.Clear()
Alias_EldergleamSapling.Clear()
Alias_DanicaEssential.Clear()

Alias_Danica.GetActorRef().AddToFaction(TrainerFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE T03QuestScript
Quest __temp = self as Quest
T03QuestScript kmyQuest = __temp as T03QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)

; kill the scene if it's still running for some reason
if (ArgueScene.IsPlaying())
	ArgueScene.Stop()
endif

; Tells Maurice to introduce himself to the player. 
kmyQuest.MauriceShouldIntro = 1
Alias_Maurice.GetActorReference().EvaluatePackage()

Alias_EldergleamMapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
SetObjectiveCompleted(75, 1)

;Alias_Danica.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE T03QuestScript
Quest __temp = self as Quest
T03QuestScript kmyQuest = __temp as T03QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(55, 1)

kmyQuest.MauriceShouldFollow = False
Alias_Maurice.GetActorReference().SetPlayerTeammate(false, false)
Alias_Maurice.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
SetObjectiveCompleted(70, 1)

Alias_Danica.GetActorReference().ModFavorPointsWithGlobal(MajorFavorPoints)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE T03QuestScript
Quest __temp = self as Quest
T03QuestScript kmyQuest = __temp as T03QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(40, 1)
SetObjectiveCompleted(50, 1)
SetObjectiveCompleted(55, 1)
SetObjectiveDisplayed(75, 1)

;Game.GetPlayer().RemoveItem(Alias_Nettlebane.GetReference(), 1)

kmyQuest.MauriceShouldFollow = False
Alias_Maurice.GetActorReference().SetPlayerTeammate(false, false)
Alias_Maurice.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MajorFavorPoints  Auto  

GlobalVariable Property MinorFavorPoints  Auto  

Quest Property T03Intro  Auto  

Scene Property ArgueScene  Auto  

Faction Property TrainerFaction  Auto  

AchievementsScript Property AchievementsQuest  Auto  
