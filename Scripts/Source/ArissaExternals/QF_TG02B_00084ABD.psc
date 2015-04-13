;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_TG02B_00084ABD Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG02BDelvinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02BDelvinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02BVexAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02BVexAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG02BToniliaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG02BToniliaAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TG02BQuestScript
Quest __temp = self as Quest
TG02BQuestScript kmyQuest = __temp as TG02BQuestScript
;END AUTOCAST
;BEGIN CODE
;Start-Up
kmyQuest.pTGRShellQuest.Start()
kmyQuest.pTGLarcenyQuest.SetStage(10)
pTGTalkGate.Value = 1
RegisterForUpdate(5)
setObjectiveDisplayed(10,1)
setObjectiveDisplayed(20,1)
setObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE TG02BQuestScript
Quest __temp = self as Quest
TG02BQuestScript kmyQuest = __temp as TG02BQuestScript
;END AUTOCAST
;BEGIN CODE
;Spoke to Tonilia
Game.GetPlayer().AddItem(kmyQuest.pTG02BBoots,1)
Game.GetPlayer().AddItem(kmyQuest.pTG02BCuirass,1)
Game.GetPlayer().AddItem(kmyQuest.pTG02BGauntlets,1)
Game.GetPlayer().AddItem(kmyQuest.pTG02BHelmet,1)
kmyQuest.pTG02BArmor = 1
setObjectiveCompleted(30,1)
;Pop new stage for TGCrown, in case Player is holding at TGCrown Stage 5 or hasn't talked to anyone
if pTGCrown.GetStageDone(20) == 0
if pTGCrownGemCount.Value >= 1
pTGCrown.SetStage(10)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE TG02BQuestScript
Quest __temp = self as Quest
TG02BQuestScript kmyQuest = __temp as TG02BQuestScript
;END AUTOCAST
;BEGIN CODE
;Spoken to Delvin
kmyQuest.pTGRadiantGoDelvin.Value = 1
kmyQuest.pTG02BUnlock += 1
setObjectiveCompleted(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG02BQuestScript
Quest __temp = self as Quest
TG02BQuestScript kmyQuest = __temp as TG02BQuestScript
;END AUTOCAST
;BEGIN CODE
;Debug Start Up
kmyQuest.pTG00Quest.SetStage(200)
kmyQuest.pTG01Quest.SetStage(200)
kmyQuest.pTG02Quest.SetStage(20)
kmyQuest.pTG02Quest.SetStage(30)
kmyQuest.pTG02Quest.SetStage(35)
Game.GetPlayer().AddToFaction(kmyQuest.pTGFaction)
kmyQuest.pTGDoor.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE TG02BQuestScript
Quest __temp = self as Quest
TG02BQuestScript kmyQuest = __temp as TG02BQuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Completed
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE TG02BQuestScript
Quest __temp = self as Quest
TG02BQuestScript kmyQuest = __temp as TG02BQuestScript
;END AUTOCAST
;BEGIN CODE
;Spoken to Vex
kmyQuest.pTGRadiantGoVex.Value = 1
kmyQuest.pTG02BUnlock += 1
setObjectiveCompleted(10,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTGCrown  Auto  

GlobalVariable Property pTGCrownGemCount  Auto  

GlobalVariable Property pTGTalkGate  Auto  
