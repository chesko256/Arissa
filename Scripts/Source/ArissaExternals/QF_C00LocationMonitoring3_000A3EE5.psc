;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_C00LocationMonitoring3_000A3EE5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE C00LocationMonitorScript
Quest __temp = self as Quest
C00LocationMonitorScript kmyQuest = __temp as C00LocationMonitorScript
;END AUTOCAST
;BEGIN CODE
if ( (kmyQuest.ParentQuest as CompanionsHousekeepingScript).AelaInReconMode )
; 	Debug.Trace("CRQ: Ensuring that Silver Hand recon missions are queued and ready.")
	if ( (kmyQuest.ParentQuest as CompanionsHousekeepingScript).AelaNextQuest == None)
; 		Debug.Trace("CRQ: There was no next quest lined for Aela; trying to queue another one.")
		(kmyQuest.ParentQuest as CompanionsHousekeepingScript).CycleRadiantQuests()
	endif
else
; 	Debug.Trace("CRQ: Picking radiant quests when player returns to Whiterun.")
	(kmyQuest.ParentQuest as CompanionsHousekeepingScript).CycleRadiantQuests()
endif


Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
