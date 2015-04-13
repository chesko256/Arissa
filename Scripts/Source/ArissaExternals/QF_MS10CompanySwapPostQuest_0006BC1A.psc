;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_MS10CompanySwapPostQuest_0006BC1A Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Debug.Trace("MS10: Swapping office setup after quest is over.")

AbandonedMarker.Disable()
InUseMarker.Enable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property InUseMarker  Auto  

ObjectReference Property AbandonedMarker  Auto  
