;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_FreeformIvarstead03_000D9B65 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFI03PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI03PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFI03TembaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI03TembaAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player needs to collect 10 Bear Pelts of any type
pFFI03QS.PeltsCounted()
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
;Quest Startup
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Remove the Pelts, Quest Completed
SetObjectiveCompleted(20,1)
Alias_FFI03TembaAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
pFFI03QS.EndSwap()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FFI03QuestScript Property pFFI03QS  Auto  
