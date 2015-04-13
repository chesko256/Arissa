;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 37
Scriptname QF_MS08_0001CF25 Extends Quest Hidden

;BEGIN ALIAS PROPERTY RJBanditCalm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RJBanditCalm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS08QuestInactiveMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS08QuestInactiveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS08AmbushTriggerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS08AmbushTriggerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Saadia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Saadia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kematu
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kematu Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FailsafeCastMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FailsafeCastMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KematuAmbushMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KematuAmbushMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlikrAmbushMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlikrAmbushMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlikrPrisoner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlikrPrisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RoriksteadMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RoriksteadMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS08KematuTriggerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS08KematuTriggerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DungeonLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunWarrior02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WhiterunWarrior02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS08QuestActiveMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS08QuestActiveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlikrAmbushMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlikrAmbushMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlikrAmbushMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlikrAmbushMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunWarrior01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WhiterunWarrior01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RJBanditScared
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RJBanditScared Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveDisplayed (125, false)
SetObjectiveDisplayed(100)
SetObjectiveCompleted(100)
SetObjectiveDisplayed(155)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveDisplayed(125, false)
SetObjectiveDisplayed(100) 
SetObjectiveDisplayed(155)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
setObjectiveCompleted(25)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
Alias_Saadia.GetReference().Disable()
Alias_Kematu.GetReference().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(101)
SetObjectiveDisplayed(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MS08QuestScript
Quest __temp = self as Quest
MS08QuestScript kmyQuest = __temp as MS08QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_MS08QuestActiveMarker.GetReference().Enable()
Alias_MS08QuestInactiveMarker.GetReference().Disable()
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)
if Alias_WhiterunWarrior01.GetActorReference().IsDead() == 0
SetObjectiveDisplayed(26)
endif
Alias_AlikrPrisoner.GetReference().Enable()
kmyquest.SaadiaConfide=0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE MS08QuestScript
Quest __temp = self as Quest
MS08QuestScript kmyQuest = __temp as MS08QuestScript
;END AUTOCAST
;BEGIN CODE
;Player helped Kematu
SetObjectiveCompleted(175)
Game.GetPlayer().AddItem(Gold, 500)
MS08SaadiaFaction.SetEnemy(PlayerFaction)
(Alias_Saadia.GetReference() as Actor).SetAV("Aggression", 1)
AchievementsQuest.IncSideQuests()
Alias_Kematu.GetActorReference().ModFavorPoints(kmyQuest.FavorRewardLarge.GetValueInt())
Alias_DungeonLoc.Clear()
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
Alias_MS08QuestActiveMarker.GetReference().Enable()
If IsObjectiveDisplayed(100)
SetObjectiveCompleted(100)
endif
if IsObjectiveDisplayed(101)
SetObjectiveCompleted(101)
endif
if isObjectiveDisplayed(20)
SetObjectiveDisplayed(20,0)
endif
If IsObjectiveDisplayed(21)
SetObjectiveCompleted(21)
endif
if IsObjectivedisplayed(25)
SetObjectiveDisplayed(25,0)
endif
If IsObjectiveDisplayed(26)
SetObjectiveCompleted(26)
endif


SetObjectiveDisplayed(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
SetObjectiveDisplayed(175,0)
SetObjectiveDisplayed(199,1)
Alias_Saadia.GetActorReference().RemoveSpell(MS08ParalysisAbility)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
BaseFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE MS08QuestScript
Quest __temp = self as Quest
MS08QuestScript kmyQuest = __temp as MS08QuestScript
;END AUTOCAST
;BEGIN CODE
;Player helped Saadia
SetObjectiveCompleted(160)
Game.GetPlayer().AddItem(Gold, 500)
AchievementsQuest.IncSideQuests()
SaadiaRef.AddToFaction(JobInnServer)
;Alias_Saadia.GetActorReference().ModFavorPoints(kMyQuest.FavorRewardLarge.GetValueInt())
Alias_DungeonLoc.Clear()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10)


Alias_RoriksteadMapMarker.GetReference().AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveDisplayed(100,0)
SetObjectiveDisplayed(101)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
setObjectiveCompleted(50)
setObjectiveDisplayed(75)
Alias_MS08QuestActiveMarker.GetReference().Enable()
Alias_MS08QuestInactiveMarker.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE MS08QuestScript
Quest __temp = self as Quest
MS08QuestScript kmyQuest = __temp as MS08QuestScript
;END AUTOCAST
;BEGIN CODE
if ( IsObjectiveDisplayed(10) == 1 )
   SetObjectiveCompleted(10)
endif
kmyQuest.SaadiaConfide=1
SetObjectiveDisplayed(20)
if Alias_WhiterunWarrior01.GetActorReference().IsDead() == 0
SetObjectiveDisplayed(21)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE MS08QuestScript
Quest __temp = self as Quest
MS08QuestScript kmyQuest = __temp as MS08QuestScript
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(25)
SetObjectiveDisplayed(100)
MS08PrisonerSceneQuest.Start()
SwindlersDenMapMarker.AddToMap(false)
kmyquest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;quest failed
Alias_DungeonLoc.Clear()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
if isObjectiveDisplayed(100)
SetObjectiveCompleted(100)
endif
if isObjectiveDisplayed(101)
SetObjectiveCompleted(101)
endif
SetObjectiveCompleted(155)

SetObjectiveDisplayed(160)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property BaseFaction  Auto  

Faction Property PlayerFaction  Auto  

miscobject Property Gold  Auto  

Spell Property MS08ParalysisAbility  Auto  

Quest Property MS08PrisonerSceneQuest  Auto  

faction Property MS08SaadiaFaction  Auto  

AchievementsScript Property AchievementsQuest  Auto  

ObjectReference Property SwindlersDenMapMarker  Auto  

actor Property SaadiaRef  Auto  

Faction Property JobInnServer  Auto  
