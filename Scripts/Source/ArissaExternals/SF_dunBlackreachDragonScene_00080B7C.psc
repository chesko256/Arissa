;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname SF_dunBlackreachDragonScene_00080B7C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; set landing marker to landing marker 1
;Alias_BlackreachDragon.GetActorRef().SetForcedLandingMarker(LandingMarker1)
CurrentLandingMarker.ForceRefTo(LandingMarker1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
Alias_BlackreachDragon.GetActorRef().SetAllowFlying(false)
; debug.trace("BLACKREACHDRAGON GROUNDED")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
Alias_BlackreachDragon.GetActorRef().SetAllowFlying(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property LandingMarker1  Auto  

ObjectReference Property LandingMarker2  Auto  


ReferenceAlias Property Alias_BlackreachDragon  Auto  

ReferenceAlias Property CurrentLandingMarker  Auto  
