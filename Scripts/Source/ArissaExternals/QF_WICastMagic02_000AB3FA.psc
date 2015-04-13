;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_WICastMagic02_000AB3FA Extends Quest Hidden

;BEGIN ALIAS PROPERTY CastingActor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CastingActor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpellTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpellTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WICastMagic02Script
Quest __temp = self as Quest
WICastMagic02Script kmyQuest = __temp as WICastMagic02Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript
; debug.trace("WICastMagic02: stage 0" )
;debug.messagebox("WICastMagic02: stage 0" )

kmyquest.startWICrowd(Game.GetPlayer())

RegisterForUpdate(5)	;used to poll player having an effect on that is dangerous (ie flamecloak) if not, we stop the crowd
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WICastMagic02Script
Quest __temp = self as Quest
WICastMagic02Script kmyQuest = __temp as WICastMagic02Script
;END AUTOCAST
;BEGIN CODE
kmyquest.stopWICrowd()
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
