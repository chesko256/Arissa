;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DA08RumorPointer_000DC9E0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Balgruuf
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Balgruuf Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(10)

(DA08 as DA08QuestScript).PlayerGotRumor = True
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DA08  Auto  
