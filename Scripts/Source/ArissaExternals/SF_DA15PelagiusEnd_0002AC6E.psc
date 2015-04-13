;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname SF_DA15PelagiusEnd_0002AC6E Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
DA15PelagiusWaitMarker.PlaceAtMe(SummonTargetFXActivator)
Utility.Wait(1)
Dervenin.GetRef().Moveto(DA15PelagiusWaitMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Dervenin.GetRef().PlaceAtMe(SummonTargetFXActivator)
Utility.Wait(1)
Dervenin.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Dervenin  Auto  

ObjectReference Property DA15PelagiusWaitMarker  Auto  

Activator Property SummonTargetFXActivator  Auto  
