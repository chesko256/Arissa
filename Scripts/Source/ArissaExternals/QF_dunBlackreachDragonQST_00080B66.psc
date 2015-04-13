;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_dunBlackreachDragonQST_00080B66 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BlackreachDragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlackreachDragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentLandingMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CurrentLandingMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; kill quest when dragon dies
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; gong sound
QSTDwemerGong.Play(Game.GetPlayer())
; enable dragon
Alias_BlackreachDragon.GetRef().Enable()
; maybe start intro scene here?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; kill looping scene so dragon isn't trying to fly and ignore combat while grounded
dunBlackreachDragonScene.Stop()
; ground dragon forever
Alias_BlackreachDragon.GetActorRef().SetAllowFlying(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; do stuff?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; finished intro patrol, start looping scene
dunBlackreachDragonScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property dunBlackreachDragonScene  Auto  

Sound Property QSTDwemerGong  Auto  

ObjectReference Property GongRef  Auto  
