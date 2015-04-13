;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_TGStatus_000AC9D1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGStatusHerluinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGStatusHerluinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGStatusArnskarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGStatusArnskarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGStatusSyndusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGStatusSyndusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGStatusDelvinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGStatusDelvinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGStatusVanrythAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGStatusVanrythAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGStatusVexAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGStatusVexAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TGStatusQuestScript
Quest __temp = self as Quest
TGStatusQuestScript kmyQuest = __temp as TGStatusQuestScript
;END AUTOCAST
;BEGIN CODE
;Guild is at Stage Two
kmyQuest.pFenceGoldStage02.Value = 0
kmyQuest.pFenceChestTonilia.AddItem(kmyQuest.pTGGoldStage02)
kmyQuest.pFenceChestEndon.AddItem(kmyQuest.pTGGoldStage02)
kmyQuest.pFenceChestEnthir.AddItem(kmyQuest.pTGGoldStage02)
kmyQuest.pFenceChestGulumEi.AddItem(kmyQuest.pTGGoldStage02)
kmyQuest.pFenceChestMallus.AddItem(kmyQuest.pTGGoldStage02)
kmyQuest.pFenceChestNiranye.AddItem(kmyQuest.pTGGoldStage02)
kmyQuest.pFenceChestCaravan01.AddItem(kmyQuest.pTGGoldStage02)
kmyQuest.pFenceChestCaravan02.AddItem(kmyQuest.pTGGoldStage02)
kmyQuest.pFenceChestCaravan03.AddItem(kmyQuest.pTGGoldStage02)
kmyQuest.pTGStageTwoMarker.Enable()
kmyQuest.pTGStageTwoGuildMarker.Enable()
pTGSQS.HerluinGo()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TGStatusQuestScript
Quest __temp = self as Quest
TGStatusQuestScript kmyQuest = __temp as TGStatusQuestScript
;END AUTOCAST
;BEGIN CODE
;ShutDown (if Needed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TGStatusQuestScript
Quest __temp = self as Quest
TGStatusQuestScript kmyQuest = __temp as TGStatusQuestScript
;END AUTOCAST
;BEGIN CODE
;Guild is at Stage Three
kmyQuest.pFenceGoldStage03.Value = 0
kmyQuest.pFenceChestTonilia.AddItem(kmyQuest.pTGGoldStage03)
kmyQuest.pFenceChestEndon.AddItem(kmyQuest.pTGGoldStage03)
kmyQuest.pFenceChestEnthir.AddItem(kmyQuest.pTGGoldStage03)
kmyQuest.pFenceChestGulumEi.AddItem(kmyQuest.pTGGoldStage03)
kmyQuest.pFenceChestMallus.AddItem(kmyQuest.pTGGoldStage03)
kmyQuest.pFenceChestNiranye.AddItem(kmyQuest.pTGGoldStage03)
kmyQuest.pFenceChestCaravan01.AddItem(kmyQuest.pTGGoldStage03)
kmyQuest.pFenceChestCaravan02.AddItem(kmyQuest.pTGGoldStage03)
kmyQuest.pFenceChestCaravan03.AddItem(kmyQuest.pTGGoldStage03)
kmyQuest.pTGStageThreeMarker.Enable()
kmyQuest.pTGStageThreeGuildMarker.Enable()
pTGFenceCaravan.SetStage(10)
pTGSQS.ArnskarGo()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGStatusQuestScript
Quest __temp = self as Quest
TGStatusQuestScript kmyQuest = __temp as TGStatusQuestScript
;END AUTOCAST
;BEGIN CODE
;Guild is at Stage One
kmyQuest.pFenceGoldStage01.Value = 0
kmyQuest.pFenceChestTonilia.AddItem(kmyQuest.pTGGoldStage01)
kmyQuest.pFenceChestEndon.AddItem(kmyQuest.pTGGoldStage01)
kmyQuest.pFenceChestEnthir.AddItem(kmyQuest.pTGGoldStage01)
kmyQuest.pFenceChestGulumEi.AddItem(kmyQuest.pTGGoldStage01)
kmyQuest.pFenceChestMallus.AddItem(kmyQuest.pTGGoldStage01)
kmyQuest.pFenceChestNiranye.AddItem(kmyQuest.pTGGoldStage01)
kmyQuest.pFenceChestCaravan01.AddItem(kmyQuest.pTGGoldStage01)
kmyQuest.pFenceChestCaravan02.AddItem(kmyQuest.pTGGoldStage01)
kmyQuest.pFenceChestCaravan03.AddItem(kmyQuest.pTGGoldStage01)
kmyQuest.pTGStageOneMarker.Enable()
kmyQuest.pTGStageOneGuildMarker.Enable()
pTGSQS.SyndusGo()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE TGStatusQuestScript
Quest __temp = self as Quest
TGStatusQuestScript kmyQuest = __temp as TGStatusQuestScript
;END AUTOCAST
;BEGIN CODE
;Guild is at Stage Four
kmyQuest.pFenceGoldStage04.Value = 0
kmyQuest.pFenceChestTonilia.AddItem(kmyQuest.pTGGoldStage04)
kmyQuest.pFenceChestEndon.AddItem(kmyQuest.pTGGoldStage04)
kmyQuest.pFenceChestEnthir.AddItem(kmyQuest.pTGGoldStage04)
kmyQuest.pFenceChestGulumEi.AddItem(kmyQuest.pTGGoldStage04)
kmyQuest.pFenceChestMallus.AddItem(kmyQuest.pTGGoldStage04)
kmyQuest.pFenceChestNiranye.AddItem(kmyQuest.pTGGoldStage04)
kmyQuest.pFenceChestCaravan01.AddItem(kmyQuest.pTGGoldStage04)
kmyQuest.pFenceChestCaravan02.AddItem(kmyQuest.pTGGoldStage04)
kmyQuest.pFenceChestCaravan03.AddItem(kmyQuest.pTGGoldStage04)
kmyQuest.pTGStageFourMarker.Enable()
kmyQuest.pTGStageFourGuildMarker.Enable()
Alias_TGStatusDelvinAlias.GetActorReference().ModFavorPoints(kmyQuest.pTGFavorLarge.GetValueInt())
Alias_TGStatusVexAlias.GetActorReference().ModFavorPoints(kmyQuest.pTGFavorLarge.GetValueInt())
pTGSQS.VanrythGo()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

TGStatusQuestScript Property pTGSQS  Auto  

Quest Property pTGFenceCaravan  Auto  
