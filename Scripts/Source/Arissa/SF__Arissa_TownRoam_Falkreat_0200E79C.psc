;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname SF__Arissa_TownRoam_Falkreat_0200E79C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
debug.trace("[Arissa] THEFT: Walk to Theft Target")
if Game.GetPlayer().HasLOS(Arissa.GetActorReference()) == false
   Arissa.TryToMoveTo(TavernOutsideMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
debug.trace("[Arissa] THEFT: Sneak back to entrance")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
debug.trace("[Arissa] THEFT: Run Theft Patrol Package")
utility.wait(0.5)
if Arissa.GetActorReference().IsSneaking() == false
   Arissa.GetActorReference().StartSneaking()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
debug.trace("[Arissa] THEFT: Hang out until player enters")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
debug.trace("[Arissa] THEFT: Pick the lock and go inside")
Arissa.GetActorReference().PlayIdle(IdleLockPick)
TheftTargetDoor.Lock(false)
Utility.Wait(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
debug.trace("[Arissa] Theft scene officially ended!")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
debug.trace("[Arissa] Theft scene officially started!")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
debug.trace("[Arissa] THEFT: Leave")
TheftTargetDoor.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property TheftInsideMarker  Auto  

ObjectReference Property TheftOutsideMarker  Auto  

ObjectReference Property TavernOutsideMarker  Auto  

ReferenceAlias Property Arissa  Auto  

Idle Property IdleLockPick  Auto  

ObjectReference Property TheftTargetDoor  Auto  
