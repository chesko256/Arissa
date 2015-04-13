;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_FreeformWinterholdCollegeA_0005D2E9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Notes
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Notes Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faralda
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faralda Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NotesMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NotesMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nirya
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nirya Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player's gotten his hands on the notes
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Faralda has made the player an offer
Alias_Notes.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Alias_Notes.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Reset.value = ( GameDaysPassed.value + 3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property Reset  Auto  
