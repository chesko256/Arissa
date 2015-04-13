;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_DialogueRiftenMaulScene_000649FC Extends Quest Hidden

;BEGIN ALIAS PROPERTY DRMSMaulAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DRMSMaulAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Maul heads to docks position
Alias_DRMSMaulAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Maul = Bad Reaction
pDRMSQS.pScriptGo = 1
if pTGCrownMisc.GetStageDone(10) == 1 && pTGCrown.GetStageDone(5) == 0
pTGCrownMisc.SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE DRMSQuestScript
Quest __temp = self as Quest
DRMSQuestScript kmyQuest = __temp as DRMSQuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Done, Player went into an interior
kmyQuest.pEnded = 1
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DRMSQuestScript
Quest __temp = self as Quest
DRMSQuestScript kmyQuest = __temp as DRMSQuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Startup is waiting for Trigger
kmyQuest.pGo = 1
Alias_DRMSMaulAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Maul = Good Reaction
pDRMSQS.pScriptGo = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DRMSQuestScript Property pDRMSQS  Auto  

Quest Property pTGCrown  Auto  

Quest Property pTGCrownMisc  Auto  
