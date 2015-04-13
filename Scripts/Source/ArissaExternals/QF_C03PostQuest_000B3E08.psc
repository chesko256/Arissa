;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_C03PostQuest_000B3E08 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadSkjor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DeadSkjor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; aela mourning
RegisterForUpdate(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE C03PostQuestScript
Quest __temp = self as Quest
C03PostQuestScript kmyQuest = __temp as C03PostQuestScript
;END AUTOCAST
;BEGIN CODE
C00RadiantQuestgiver.ForceRefTo(Alias_Aela.GetRef())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
C00RadiantQuestgiver.Clear()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; aela heading back to Jorrvaskr
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property C00RadiantQuestgiver  Auto  
