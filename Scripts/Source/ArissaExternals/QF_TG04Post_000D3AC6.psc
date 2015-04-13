;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_TG04Post_000D3AC6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG04PostTonilia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG04PostTonilia Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Choice made... award appropriate armor piece and remove old one
pTG04PQS.ArmorChoice()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Done
SetObjectiveCompleted(10,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Initiated at the end of TG04 if Player was rewarded
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

TG04PostQuestScript Property pTG04PQS  Auto  
