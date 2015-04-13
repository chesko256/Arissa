;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF__0116E8F8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY IlliaTest
;ALIAS PROPERTY TYPE ReferenceAlias
;ReferenceAlias Property Alias_IlliaTest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Illia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Illia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Silvia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Silvia Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
dunDarklightIlliaIntro.stop()
dunDarklightIlliafollow.stop()
dunDarklightIlliaRejectFollow.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;if you say yes to Illia
dunDarklightIlliaIntro.stop()
dunDarklightIlliafollow.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property dunDarklightIlliaIntro  Auto  

scene Property dunDarklightIlliafollow  Auto  

scene Property dunDarklightilliaRejectFollow  Auto  
