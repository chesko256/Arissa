;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CR08EditorMonitoring_0005478C Extends Quest Hidden

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CR08MonitoringScript
Quest __temp = self as Quest
CR08MonitoringScript kmyQuest = __temp as CR08MonitoringScript
;END AUTOCAST
;BEGIN CODE
(kmyQuest.ParentQuest as CR08QuestScript).LocationChangeCheck(Alias_NewLocation.GetLocation())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
