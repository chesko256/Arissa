;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_FreeformSarethiFarm_000E3308 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFSarethiAvrusaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFSarethiAvrusaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFSarethiPlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFSarethiPlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player needs to collect 20 jazbay grapes
pFFS01QS.GrapesCounted()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player Collected 20 jazbay grapes
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

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Remove the Grapes, Quest Completed
SetObjectiveCompleted(20,1)
pFFS01QS.EndSwap()
Alias_FFSarethiAvrusaAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FFSareth01QuestScript Property pFFS01QS  Auto  
