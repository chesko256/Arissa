;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 50
Scriptname QF_C03_0001CEF6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GhostKodlak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GhostKodlak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skjor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skjor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY YsgramorsBlade
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_YsgramorsBlade Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KodlakBodyMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KodlakBodyMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kodlak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kodlak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY YsgramorStatue
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_YsgramorStatue Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KodlaksJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KodlaksJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfSpirit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WolfSpirit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sarcophagus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sarcophagus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eorlund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eorlund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Font
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Font Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY YsgramorsTombMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_YsgramorsTombMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FuneralLocationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FuneralLocationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KodlaksFragment
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KodlaksFragment Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KodlaksEndTable
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KodlaksEndTable Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY YsgramorsTomb
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_YsgramorsTomb Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skyforge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skyforge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SHIELD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SHIELD Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(15,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveCompleted(35, 1)
SetObjectiveDisplayed(40, 1)

Alias_Aela.GetActorRef().EvaluatePackage()
Alias_Farkas.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
SetObjectiveCompleted(17, 1)
SetObjectiveDisplayed(18, 1)

ObserverQuest.Stop()

Alias_Aela.GetRef().MoveTo(AelaSpot)
Alias_Farkas.GetRef().MoveTo(FarkasSpot)
Alias_Vilkas.GetRef().MoveTo(VilkasSpot)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE C06QuestScript
Quest __temp = self as Quest
C06QuestScript kmyQuest = __temp as C06QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
SetObjectiveCompleted(65, 1)
SetObjectiveDisplayed(70, 1)

Alias_Aela.GetActorRef().ResetHealthAndLimbs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
SetObjectiveCompleted(18, 1)
SetObjectiveDisplayed(20, 1)

Game.GetPlayer().RemoveItem(Alias_KodlaksFragment.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Fragments.GetRef())
Fragments.Clear()

Alias_KodlaksFragment.GetRef().Enable()
Alias_KodlaksJournal.GetRef().Enable()
Alias_KodlaksEndTable.GetRef().AddItem(Alias_KodlaksFragment.GetRef())
Alias_KodlaksEndTable.GetRef().AddItem(Alias_KodlaksJournal.GetRef())
Alias_KodlaksEndTable.GetRef().SetActorOwner(Game.GetPlayer().GetActorBase())

SetObjectiveCompleted(10, 1)
SetObjectiveCompleted(15, 1)
SetObjectiveDisplayed(17,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE C06QuestScript
Quest __temp = self as Quest
C06QuestScript kmyQuest = __temp as C06QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Init()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE C06QuestScript
Quest __temp = self as Quest
C06QuestScript kmyQuest = __temp as C06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(60, 1)

kmyQuest.FuneralEnabler.Disable()
PyreBurnStart.Disable()
PyreBurnFinish.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE C06QuestScript
Quest __temp = self as Quest
C06QuestScript kmyQuest = __temp as C06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(70, 1)

Game.AddAchievement(11)

Faction comps = (kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompanionsFaction
Game.GetPlayer().ModFactionRank(comps, 1)
Game.GetPlayer().AddToFaction(HarbingerFaction)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).AddHarbingerPerks()

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompleteStoryQuest(kmyQuest)

Game.IncrementStat("Questlines Completed")

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).UnShutup(Alias_Aela.GetActorReference())
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).UnShutup(Alias_Farkas.GetActorReference())
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).UnShutup(Alias_Vilkas.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE C06QuestScript
Quest __temp = self as Quest
C06QuestScript kmyQuest = __temp as C06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

kmyQuest.StartFuneral()

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).Shutup(Alias_Aela.GetActorReference())
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).Shutup(Alias_Farkas.GetActorReference())
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).Shutup(Alias_Vilkas.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN AUTOCAST TYPE C06QuestScript
Quest __temp = self as Quest
C06QuestScript kmyQuest = __temp as C06QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(65, 1)

kmyQuest.WolfSpiritChill = false
Alias_WolfSpirit.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(50, 1)

Alias_GhostKodlak.GetReference().Enable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

Alias_YsgramorsTombMapMarker.GetRef().AddToMap()
Alias_Skyforge.GetReference().BlockActivation(false)
StatueActivator.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(35, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Weapon Property YsgramorsBlade  Auto  

ReferenceAlias Property Fragments  Auto  

ObjectReference Property AelaSpot  Auto  

ObjectReference Property FarkasSpot  Auto  

ObjectReference Property VilkasSpot  Auto  

ObjectReference Property StatueActivator  Auto  

Quest Property ObserverQuest  Auto  

ObjectReference Property PyreBurnStart  Auto  

ObjectReference Property PyreBurnFinish  Auto  

Faction Property HarbingerFaction  Auto  

EffectShader Property GhostShader  Auto  
