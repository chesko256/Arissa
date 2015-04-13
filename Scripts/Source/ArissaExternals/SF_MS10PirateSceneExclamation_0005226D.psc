;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_MS10PirateSceneExclamation_0005226D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Pirate1.GetReference().MoveTo(Pirate1Spot)
Pirate2.GetReference().MoveTo(Pirate2Spot)
Pirate3.GetReference().MoveTo(Pirate3Spot)
Stig.GetReference().MoveTo(StigSpot)
Waitress.GetReference().MoveTo(WaitressSpot)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Pirate1  Auto  
ReferenceAlias Property Pirate2  Auto  
ReferenceAlias Property Pirate3  Auto  
ReferenceAlias Property Stig  Auto  
ReferenceAlias Property Waitress Auto
ObjectReference Property Pirate1Spot Auto
ObjectReference Property Pirate2Spot Auto
ObjectReference Property Pirate3Spot Auto
ObjectReference Property StigSpot Auto
ObjectReference Property WaitressSpot Auto
