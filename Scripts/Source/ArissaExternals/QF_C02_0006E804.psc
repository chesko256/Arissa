;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_C02_0006E804 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Vignar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vignar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Njada
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Njada Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skjor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skjor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kodlak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kodlak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Athis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Athis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LastQuestObserver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LastQuestObserver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brill
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Brill Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Torvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Torvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tilma
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tilma Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
C01.SetObjectiveCompleted(40, 1)
C01.SetObjectiveDisplayed(110, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE C02QuestScript
Quest __temp = self as Quest
C02QuestScript kmyQuest = __temp as C02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE C02QuestScript
Quest __temp = self as Quest
C02QuestScript kmyQuest = __temp as C02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Init()

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).Shutup(Alias_Questgiver.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE C02QuestScript
Quest __temp = self as Quest
C02QuestScript kmyQuest = __temp as C02QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_Kodlak.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE C02QuestScript
Quest __temp = self as Quest
C02QuestScript kmyQuest = __temp as C02QuestScript
;END AUTOCAST
;BEGIN CODE
C01.SetStage(200)

Faction comps = (kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompanionsFaction
Game.GetPlayer().ModFactionRank(comps, 1)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).UnShutup(Alias_Questgiver.GetActorReference())

Alias_Kodlak.GetActorReference().EvaluatePackage()
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CompleteStoryQuest(kmyQuest)

(kmyQuest.CentralQuest as CompanionsHousekeepingScript).ReOpenAllRadiantQuests()
(kmyQuest.CentralQuest as CompanionsHousekeepingScript).CycleRadiantQuests()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property Skjor  Auto  

Actor Property Vilkas  Auto  

Quest Property C01  Auto  
