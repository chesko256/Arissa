;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_CWFortObserver_000D5F08 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Fort
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Fort Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FortIsEmpty
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FortIsEmpty Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CWFortObserverScript
Quest __temp = self as Quest
CWFortObserverScript kmyQuest = __temp as CWFortObserverScript
;END AUTOCAST
;BEGIN CODE
; CWScript.Log("CWFortObserver", self + "Stage 0 Startupstage  - Fort:" + Alias_Fort.GetLocation())

;debug.messagebox("CLEARED Fort:" + Alias_Fort.GetLocation())

kmyquest.CWs.AddGarrisonBackToWar(Alias_Fort.GetLocation())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
