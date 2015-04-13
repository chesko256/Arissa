;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DGArrestQuest_0006B94B Extends Quest Hidden

;BEGIN ALIAS PROPERTY ArrestingGuard
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_ArrestingGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Criminal
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Criminal Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; release criminal from arrest state
Alias_Criminal.GetActorRef().ClearArrested()
; have guard react
Alias_ArrestingGuard.GetActorRef().SendAssaultAlarm()
Alias_ArrestingGuard.GetActorRef().StartCombat(Alias_Criminal.GetActorRef())
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
