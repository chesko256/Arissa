;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_TutorialEnchanting_00105A60 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FarengarMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FarengarMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farengar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Farengar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FarengarEnchanter
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FarengarEnchanter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player leaves the area
Alias_Player.UnRegisterForUpdateGameTime()
SetObjectiveDisplayed(10, abdisplayed = false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; player has used the enchanter
Alias_Player.UnRegisterForUpdateGameTime()
SetObjectiveCompleted(10, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player is told to use the Arcane Enchanter
SetObjectiveDisplayed(10, 1)

;check to see if the player leaves
Alias_Player.RegisterForUpdateGameTime(0.2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
