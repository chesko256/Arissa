;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_FreeformShorsStone01_000E49E7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFSS01MarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFSS01MarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFSS01FilnjarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFSS01FilnjarAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Clear the Mine!
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Quest Done
pShorsStoneMineOpen.Value = 1
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
Game.GetPlayer().AddItem(pReward,1)
Alias_FFSS01FilnjarAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Mine Cleared!
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Startup
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pReward  Auto  

GlobalVariable Property pShorsStoneMineOpen  Auto  
