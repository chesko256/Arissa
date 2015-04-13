;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_C02Kicker_000A3EF8 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE C00LocationMonitorScript
Quest __temp = self as Quest
C00LocationMonitorScript kmyQuest = __temp as C00LocationMonitorScript
;END AUTOCAST
;BEGIN CODE
if (!C02.GetStageDone(1))
; 	Debug.Trace("CSQ: Kicking C02 on Whiterun entry.")
	(kmyQuest.ParentQuest as CompanionsHousekeepingScript).StartStoryQuest(C02)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CompanionsStoryQuest Property C02  Auto  
