;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_C00LocationMonitoring1_000A3EC5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE C00LocationMonitorScript
Quest __temp = self as Quest
C00LocationMonitorScript kmyQuest = __temp as C00LocationMonitorScript
;END AUTOCAST
;BEGIN CODE
(kmyQuest.ParentQuest as CompanionsHousekeepingScript).GiveVilkasBackHisSword()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
