;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_WICastMagic04_00023EE4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CastingActor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CastingActor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpellTarget
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SpellTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WordWall
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WordWall Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
setObjectiveCompleted(10)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WICastMagic04Script
Quest __temp = self as Quest
WICastMagic04Script kmyQuest = __temp as WICastMagic04Script
;END AUTOCAST
;BEGIN CODE
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;player reads note

setObjectiveDisplayed (10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WICastMagic04Script
Quest __temp = self as Quest
WICastMagic04Script kmyQuest = __temp as WICastMagic04Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript
; debug.trace("WICastMagic04: stage 0" )
;debug.messagebox("WICastMagic04: stage 0" )

kmyquest.WICourierS.addAliasToContainer(Alias_Letter)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
