;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_FreeformMarkarthL_0006099C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Tacitus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tacitus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ghorza
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ghorza Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;People dead, fail state
SetObjectiveFailed(10, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
Alias_Ghorza.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
Alias_Book.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
