;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_TGRDU_00015D24 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WealthyHome
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_WealthyHome Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WeathyHomeChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WeathyHomeChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VexAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VexAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Evidence
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evidence Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TGRDUQuestScript
Quest __temp = self as Quest
TGRDUQuestScript kmyQuest = __temp as TGRDUQuestScript
;END AUTOCAST
;BEGIN CODE
;Finished Quest Without Fail Condition
CompleteAllObjectives()
Game.GetPlayer().AddItem(pReward,1)
pTGRMasterTotal.Value += 1
pTGREHQS.CheckCount()
pTGRShellScript.TGRadiantCount(Alias_City.GetLocation())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Finished Quest With Fail Condition
Game.GetPlayer().RemoveItem(Alias_Evidence.GetRef())
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Finished Quest With Fail Condition
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE TGRDUQuestScript
Quest __temp = self as Quest
TGRDUQuestScript kmyQuest = __temp as TGRDUQuestScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGRDUQuestScript
Quest __temp = self as Quest
TGRDUQuestScript kmyQuest = __temp as TGRDUQuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Given by Vex
pTGRShellScript.pTGRVexRunning = 1
pTGRShellScript.pTGRDURun = 1
Game.GetPlayer().AddItem(Alias_Evidence.GetRef())
SetObjectiveDisplayed (10,1)
kmyQuest.pTGRQueueQuestScript.UpdateQueue(Alias_WealthyHome, TGWealthyHome)
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

TGRShellScript Property pTGRShellScript  Auto  

Keyword Property TGWealthyHome  Auto  

LeveledItem Property pReward  Auto  

GlobalVariable Property pTGRMasterTotal  Auto  
TGREnablerHandlerQuestScript Property pTGREHQS  Auto
