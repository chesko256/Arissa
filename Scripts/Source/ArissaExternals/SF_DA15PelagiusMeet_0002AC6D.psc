;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DA15PelagiusMeet_0002AC6D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().setstage(95)
Pelagius.GetRef().PlaceAtMe(SummonTargetFXActivator)
Utility.wait(1)
Pelagius.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Pelagius  Auto  

Message Property TempLeavingMessage  Auto  

Activator Property SummonTargetFXActivator  Auto  
