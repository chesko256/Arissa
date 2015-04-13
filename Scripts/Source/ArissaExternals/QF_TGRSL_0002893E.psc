;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_TGRSL_0002893E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ItemToGet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ItemToGet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Business
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Business Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Strongbox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Strongbox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vex
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vex Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Finished Quest Without Fail Condition
FailAllObjectives()
Game.GetPlayer().RemoveItem(Alias_ItemtoGet.GetRef().GetBaseObject())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TGRSLQuestScript
Quest __temp = self as Quest
TGRSLQuestScript kmyQuest = __temp as TGRSLQuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Given by Vex
pTGRShellScript.pTGRVexRunning = 1
pTGRShellScript.pTGRSLRun = 1
SetObjectiveDisplayed (10,1)
kmyQuest.pTGRQueueQuestScript.UpdateQueue(Alias_Business,TGBusiness)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Finished Quest Without Fail Condition
FailAllObjectives()
Game.GetPlayer().RemoveItem(Alias_ItemtoGet.GetRef().GetBaseObject())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE TGRSLQuestScript
Quest __temp = self as Quest
TGRSLQuestScript kmyQuest = __temp as TGRSLQuestScript
;END AUTOCAST
;BEGIN CODE
;Finished Quest Without Fail Condition
FailAllObjectives()
Game.GetPlayer().RemoveItem(Alias_ItemtoGet.GetRef().GetBaseObject())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGRSLQuestScript
Quest __temp = self as Quest
TGRSLQuestScript kmyQuest = __temp as TGRSLQuestScript
;END AUTOCAST
;BEGIN CODE
;Finished Quest Without Fail Condition
CompleteAllObjectives()
Game.GetPlayer().AddItem(pReward,1)
pTGRMasterTotal.Value += 1
pTGREHQS.CheckCount()
Game.GetPlayer().RemoveItem(Alias_ItemtoGet.GetRef().GetBaseObject())
pTGRShellScript.TGRadiantCount(Alias_City.GetLocation())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quest Target Done - Return to Vex
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

TGRShellScript Property pTGRShellScript  Auto  

Keyword Property TGBusiness  Auto  

LeveledItem Property pReward  Auto

GlobalVariable Property pTGRMasterTotal  Auto  
TGREnablerHandlerQuestScript Property pTGREHQS  Auto
