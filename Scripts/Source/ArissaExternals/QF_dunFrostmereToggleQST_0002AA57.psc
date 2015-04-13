;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_dunFrostmereToggleQST_0002AA57 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Altar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Altar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PaleLady
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PaleLady Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, True, True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property dunFrostmereCryptQST  Auto  
