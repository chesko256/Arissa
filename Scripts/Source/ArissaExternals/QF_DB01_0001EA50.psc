;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_DB01_0001EA50 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FrancoisAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FrancoisAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SamuelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SamuelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GrelodTheKindAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GrelodTheKindAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AventusAretinoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AventusAretinoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HroarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HroarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RunaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RunaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE DB01QuestScript
Quest __temp = self as Quest
DB01QuestScript kmyQuest = __temp as DB01QuestScript
;END AUTOCAST
;BEGIN CODE
; setting Angrenor up to move into the Aretino house (SJML)
WindhelmAretinoResidenceLockList.AddForm(Angrenor.GetActorBase())
Angrenor.AddItem(WindhelmAretinoResidenceKey, 1)

Alias_AventusAretinoAlias.GetActorRef().ModFavorPoints(pFavorReward.GetValueInt() )
SetObjectiveCompleted(30)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DB01QuestScript
Quest __temp = self as Quest
DB01QuestScript kmyQuest = __temp as DB01QuestScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(5)
   SetObjectiveCompleted(5)
Endif

SetObjectiveDisplayed (20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DB01QuestScript
Quest __temp = self as Quest
DB01QuestScript kmyQuest = __temp as DB01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed (5, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DB01QuestScript
Quest __temp = self as Quest
DB01QuestScript kmyQuest = __temp as DB01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed (30, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pFavorReward  Auto  

Actor Property Angrenor  Auto  

FormList Property WindhelmAretinoResidenceLockList  Auto  

Key Property WindhelmAretinoResidenceKey  Auto  
