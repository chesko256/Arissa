;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_DA05FuneralScene_0001A336 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SpectatorQuest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SpectatorQuest.Start()
Indara.GetRef().MoveTo(IndaraMarker)
Mathies.GetRef().MoveTo(MathiesMarker)
Urunil.GetRef().MoveTo(UrunilMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MathiesMarker  Auto  

ObjectReference Property IndaraMarker  Auto  

ObjectReference Property UrunilMarker  Auto  

ReferenceAlias Property Mathies  Auto  

ReferenceAlias Property Indara  Auto  

ReferenceAlias Property Urunil  Auto  

Quest Property SpectatorQuest  Auto  
