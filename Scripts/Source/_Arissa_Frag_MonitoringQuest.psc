;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname _Arissa_Frag_MonitoringQuest Extends Quest Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE _Arissa_iNPC_MonitoringPlayerScript
Quest __temp = self as Quest
_Arissa_iNPC_MonitoringPlayerScript kmyQuest = __temp as _Arissa_iNPC_MonitoringPlayerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
