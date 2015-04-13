;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_dunDA14MorvunskarQST_000427A0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BlacksmithHelper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlacksmithHelper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Naris
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Naris Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlacksmithWarlock
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlacksmithWarlock Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
if(getStageDone(30))
  setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if(getStageDone(20))
  setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
