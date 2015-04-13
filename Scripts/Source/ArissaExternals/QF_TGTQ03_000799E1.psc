;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_TGTQ03_000799E1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGTQ03OlfridAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ03OlfridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ03Registry
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ03Registry Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ03Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ03Letter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player got the Letter
SetObjectiveCompleted(20,1)
SetStage(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Player has done both jobs... send back to Olfrid
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE TGTQ03QuestScript
Quest __temp = self as Quest
TGTQ03QuestScript kmyQuest = __temp as TGTQ03QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest completed
Game.GetPlayer().RemoveItem(kmyQuest.pTGTQ03Letter,1)
Game.GetPlayer().AddItem(pReward,1)
kmyQuest.pTGRShellQuest.SetStage(165)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE TGTQ03QuestScript
Quest __temp = self as Quest
TGTQ03QuestScript kmyQuest = __temp as TGTQ03QuestScript
;END AUTOCAST
;BEGIN CODE
;Counter and Quest Checker Stage
kmyQuest.pTGTQ03Count += 1

if kmyQuest.pTGTQ03Count >= 2
SetStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TGTQ03QuestScript
Quest __temp = self as Quest
TGTQ03QuestScript kmyQuest = __temp as TGTQ03QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has to steal the letter and forge the registry
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
SetObjectiveDisplayed(30,1)
kmyQuest.pTGTQ03Letter.Enable()
kmyQuest.PTGTQ03Registry.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug Quest Start
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TGTQ03QuestScript
Quest __temp = self as Quest
TGTQ03QuestScript kmyQuest = __temp as TGTQ03QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is sent to speak to Olfrid Battle-Born
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player forged the registry
SetObjectiveCompleted(30,1)
SetStage(45)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property pOlfrid  Auto  

LeveledItem Property pReward  Auto  
