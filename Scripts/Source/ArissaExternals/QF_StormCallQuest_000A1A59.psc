;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_StormCallQuest_000A1A59 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE ClearSkiesQuestScript
Quest __temp = self as Quest
ClearSkiesQuestScript kmyQuest = __temp as ClearSkiesQuestScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + " stage 10 start")
kmyQuest.ClearSkiesStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE ClearSkiesQuestScript
Quest __temp = self as Quest
ClearSkiesQuestScript kmyQuest = __temp as ClearSkiesQuestScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + " stage 100")
if kmyQuest.ClearWeatherOverride
; 	debug.trace(self + " releasing weather override on " + kmyQuest.ClearWeatherOverride)
	Weather.ReleaseOverride()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ301  Auto  
