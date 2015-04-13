;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_WICastMagicNonHostileSpell_000A8A86 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WICastMagic05Script
Quest __temp = self as Quest
WICastMagic05Script kmyQuest = __temp as WICastMagic05Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript
; debug.trace("WICastMagic05: stage 0" )
;debug.messagebox("WICastMagic05: stage 0" )
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
