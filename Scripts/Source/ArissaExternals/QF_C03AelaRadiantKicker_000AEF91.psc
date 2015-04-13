;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_C03AelaRadiantKicker_000AEF91 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Debug.Trace("CRQ: Starting recon kicker quest.")
C00.KickOffReconQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CompanionsHousekeepingScript Property C00  Auto  
