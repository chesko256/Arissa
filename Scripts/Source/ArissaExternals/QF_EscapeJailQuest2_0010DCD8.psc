;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_EscapeJailQuest2_0010DCD8 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; if JailQuest is running, set stage 20 to give objective
if JailQuest.IsRunning()
	JailQuest.SetStage(20)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property JailQuest  Auto  
