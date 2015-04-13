;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname PF_AlvorWork7x14_0001CB07 Extends Package Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
; Debug.Trace("AlvorWork7x14: on change")
;EquipmentMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
; Debug.Trace("AlvorWork7x14: on end")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
; Debug.Trace("AlvorWork7x14: on begin")
;EquipmentMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property EquipmentMarker  Auto  
{temp way to handle disabling outdoor vendor stuff}
