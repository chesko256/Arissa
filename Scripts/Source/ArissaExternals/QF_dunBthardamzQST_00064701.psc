;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_dunBthardamzQST_00064701 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AfflictedMoreBarrels01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AfflictedMoreBarrels01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AfflictedSick01Target
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AfflictedSick01Target Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrayingFemale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrayingFemale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AfflictedMoreBarrels02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AfflictedMoreBarrels02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WarnAfflicted01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WarnAfflicted01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AfflictedSick02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AfflictedSick02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrayingMale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrayingMale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AfflictedSick01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AfflictedSick01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
MoreBarrelsScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
PrayingScene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
AfflictedWarn01Scene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
AfflictedSickScene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property PrayingScene01  Auto  

Scene Property AfflictedWarn01Scene  Auto  

Scene Property MoreBarrelsScene  Auto  

Scene Property AfflictedSickScene  Auto  
