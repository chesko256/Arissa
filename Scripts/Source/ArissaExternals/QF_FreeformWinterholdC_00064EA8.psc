;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_FreeformWinterholdC_00064EA8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Isabelle
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Isabelle Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dagur
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dagur Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vex
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vex Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ranmir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ranmir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Birna
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Birna Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;player has given letter to Ranmir
RanmirScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Vex has told the player where Isabelle went
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;player has found note on Isabelle's body
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Alias_Isabelle.GetActorreference().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player has been given quest by Dagur
Alias_Isabelle.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property RanmirScene  Auto  
