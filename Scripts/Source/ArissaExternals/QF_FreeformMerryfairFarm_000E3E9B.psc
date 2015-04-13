;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_FreeformMerryfairFarm_000E3E9B Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFMF01ChestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFMF01ChestAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFMF01DravinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFMF01DravinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFMF01BowAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFMF01BowAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player Go Get Bow
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player Found Bow - Go Back to Dravin
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;QuestStartup
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quest Completed
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
Game.GetPlayer().RemoveItem(Alias_FFMF01BowAlias.GetRef())
Game.GetPlayer().AddItem(pGems,5)
Alias_FFMF01DravinAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pGems  Auto  
