;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_ClearSkiesChangeLocationQu_0001E3C8 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; check if Clear Skies quest is running, if so, shut it down so it releases the weather override
if ClearSkiesQuest.IsRunning()
; 	debug.trace(self + " stopping ClearSkiesQuest")
	ClearSkiesQuest.Stop()
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property ClearSkiesQuest  Auto  
