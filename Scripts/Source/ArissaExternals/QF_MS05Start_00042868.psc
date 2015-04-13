;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_MS05Start_00042868 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Viarmo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Viarmo Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has not talked to any bard or recieved the objective to investigate the Bard's College.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player has spoken to one of the bards and receives the objective to investigate the college.
SetObjectiveDisplayed (10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
