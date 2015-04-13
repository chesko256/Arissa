;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_WICastMagic03_000167D3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpellTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpellTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CastingActor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CastingActor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;guard talked to player

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WICastMagic03
Quest __temp = self as Quest
WICastMagic03 kmyQuest = __temp as WICastMagic03
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript
; debug.trace("WICastMagic03: stage 0" )
;debug.messagebox("WICastMagic03: stage 0" )

;kmyquest.startWICrowd(Game.GetPlayer()) -- causing weirdness late in project, safer to just turn this off

;RegisterForUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WICastMagic03
Quest __temp = self as Quest
WICastMagic03 kmyQuest = __temp as WICastMagic03
;END AUTOCAST
;BEGIN CODE
kmyquest.stopWICrowd()

UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
