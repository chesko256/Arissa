;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_TGRNT_00060990 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delvin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delvin Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TGRNTQuestScript
Quest __temp = self as Quest
TGRNTQuestScript kmyQuest = __temp as TGRNTQuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Target Done - Return to Delvin
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TGRNTQuestScript
Quest __temp = self as Quest
TGRNTQuestScript kmyQuest = __temp as TGRNTQuestScript
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

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGRNTQuestScript
Quest __temp = self as Quest
TGRNTQuestScript kmyQuest = __temp as TGRNTQuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Given by Delvin
pTGRShellScript.pTGRDelvinRunning = 1
pTGRShellScript.pTGRNTRun = 1
pTGRNTQS.SetupGlobals()
SetObjectiveDisplayed (10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Finished Quest With Fail Condition
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Finished Quest With Fail Condition
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

TGRShellScript Property pTGRShellScript  Auto  

TGRNTQuestScript Property pTGRNTQS  Auto  

LeveledItem Property pReward  Auto

GlobalVariable Property pTGRMasterTotal  Auto  
TGREnablerHandlerQuestScript Property pTGREHQS  Auto
