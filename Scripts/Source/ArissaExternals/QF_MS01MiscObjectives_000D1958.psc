;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_MS01MiscObjectives_000D1958 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eltrys
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eltrys Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has read the note
SetObjectiveCompleted(10, 1)
MS01.SetStage(15)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player is given the note
Alias_Note.GetRef().Enable()
Game.GetPlayer().AddItem(Alias_Note.GetRef())
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Ms01  Auto  
