;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_MGR01Trigger_000E8B50 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
MGRShellScript MGRScript = MGRShell as MGRShellScript
; debug.Trace("MGR01TriggerRunning")
if (MGRScript.MGRTolfdirDay +1) < Gameday.GetValue()
; Debug.Trace("MGR01Trigger function sent")
MGRScript.StartTolfdirQuest()
endif
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MGRShell  Auto  

GlobalVariable Property GameDay  Auto  
