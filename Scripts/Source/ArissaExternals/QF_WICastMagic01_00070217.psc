;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_WICastMagic01_00070217 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpellTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpellTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CastingActor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CastingActor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Child
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Child Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WICastMagic01Script
Quest __temp = self as Quest
WICastMagic01Script kmyQuest = __temp as WICastMagic01Script
;END AUTOCAST
;BEGIN CODE
;player told child he would make him invisible
kmyquest.WICastMagic01SceneA.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;player told the child to go away
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WICastMagic01Script
Quest __temp = self as Quest
WICastMagic01Script kmyQuest = __temp as WICastMagic01Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript

; debug.trace("WICastMagic01: stage 0" )
;debug.messagebox("WICastMagic01: stage 0" )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Child think's he's invisible (he may or may not be)
utility.wait(320)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
