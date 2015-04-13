;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_TGRHC_00028936 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WealthItem02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WealthItem02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WealthyHome
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_WealthyHome Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LootUrn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LootUrn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vex
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vex Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WealthItem01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WealthItem01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LootShipModel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LootShipModel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WealthItem03Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WealthItem03Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LootHorn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LootHorn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WealthItem03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WealthItem03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WealthItem02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WealthItem02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LootHolder
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LootHolder Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LootFlagon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LootFlagon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WealthItem01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WealthItem01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LootGoblet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LootGoblet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LootPitcher
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LootPitcher Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LootCandlestick
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LootCandlestick Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Randomize Loot!
pTGRHCQS.Generate()
pTGRShellScript.pTGRVexRunning = 1
pTGRShellScript.pTGRHCRun = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TGRHCQuestScript
Quest __temp = self as Quest
TGRHCQuestScript kmyQuest = __temp as TGRHCQuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Target Done - Return to Vex
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TGRHCQuestScript
Quest __temp = self as Quest
TGRHCQuestScript kmyQuest = __temp as TGRHCQuestScript
;END AUTOCAST
;BEGIN CODE
;Finished Quest With Fail Condition
FailAllObjectives()
pTGRHCQS.CleanUp()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TGRHCQuestScript
Quest __temp = self as Quest
TGRHCQuestScript kmyQuest = __temp as TGRHCQuestScript
;END AUTOCAST
;BEGIN CODE
;Finished Quest Without Fail Condition
CompleteAllObjectives()
Game.GetPlayer().AddItem(pReward,1)
pTGRMasterTotal.Value += 1
pTGREHQS.CheckCount()
pTGRShellScript.TGRadiantCount(Alias_City.GetLocation())
pTGRHCQS.CleanUp()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGRHCQuestScript
Quest __temp = self as Quest
TGRHCQuestScript kmyQuest = __temp as TGRHCQuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Given by Vex
pCount.Value = 0
SetObjectiveDisplayed (10,1)
kmyQuest.pTGRQueueQuestScript.UpdateQueue(Alias_WealthyHome, TGWealthyHome)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Finished Quest With Fail Condition
FailAllObjectives()
pTGRHCQS.CleanUp()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Finished Quest With Fail Condition
FailAllObjectives()
pTGRHCQS.CleanUp()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

TGRShellScript Property pTGRShellScript  Auto  

Keyword Property TGWealthyHome  Auto  

GlobalVariable Property pCount  Auto  

TGRHCQuestScript Property pTGRHCQS  Auto  

LeveledItem Property pReward  Auto  

GlobalVariable Property pTGRMasterTotal  Auto  
TGREnablerHandlerQuestScript Property pTGREHQS  Auto
