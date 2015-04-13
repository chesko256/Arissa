;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_TGTQ02_000799E0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGTQ02ChestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ02ChestAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ02SabineAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ02SabineAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ02SabineChestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ02SabineChestAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ02NoteAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ02NoteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ02BalmoraBlueAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ02BalmoraBlueAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ02KeyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ02KeyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ02ErikurAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ02ErikurAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ02Safe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ02Safe Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE TGTQ02QuestScript
Quest __temp = self as Quest
TGTQ02QuestScript kmyQuest = __temp as TGTQ02QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Done
Game.GetPlayer().AddItem(pReward)
kmyQuest.pTGRShellQuest.SetStage(175)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player needs to Plant Balmora Blue on the Dainty Sload
SetObjectiveCompleted (20,1)
SetObjectiveDisplayed (30,1)
UnregisterForUpdate()
;Player returns to Erikur as long as Balmora Blue stays in chest
;Condition is based on TGTQ02Planted var
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player sent to Erikur in Solitude
SetObjectiveDisplayed (10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug Quest Started
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player needs to aquire Balmora Blue from Sabine Nytte
pDaintySloadMapMarker.AddToMap()
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
pTGTQ02Chest.Enable()
pSafe.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE TGTQ02QuestScript
Quest __temp = self as Quest
TGTQ02QuestScript kmyQuest = __temp as TGTQ02QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has acquired the Key
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pTGTQ02Chest  Auto  

LeveledItem Property pReward  Auto  

ObjectReference Property pDaintySloadMapMarker  Auto  

ObjectReference Property pSafe  Auto  
