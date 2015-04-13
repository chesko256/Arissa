;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_T03PostQuest_000FE479 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Debug.Trace("T03: Resolving T03 post-quest tree.")
if     (T03.GetStageDone(100))
	; repair
; 	Debug.Trace("T03: Repairing tree.")
	TempleTreeDead.Disable()
	TempleTreeAlive.Enable()
elseif (T03.GetStageDone(105))
	; sapling
; 	Debug.Trace("T03: Replacing tree.")
	BigTreeClutter.Disable()
	SaplingAndClutter.Enable()
endif

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BigTreeClutter  Auto  
ObjectReference Property SaplingAndClutter  Auto  
ObjectReference Property TempleTreeDead  Auto  
ObjectReference Property TempleTreeAlive  Auto  

Quest Property T03  Auto  
