;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname SF_MQResurrectDragonScene_000B399B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
if (Alduin.GetActorRef().GetAV("Variable06") == 0)
   (DragonMound.GetRef().GetLinkedRef(LinkCustom01) as FXDragonMoundScript).StartResurrection()
EndIf
Alduin.GetActorRef().SetAV("Variable06", 1)
Alduin.GetActorRef().EvaluatePackage()
Weather.ReleaseOverride()
; make dragon aggressive
Dragon.GetActorRef().SetAV("Aggression", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
AlduinWeather.SetActive(true, true)
(DragonMound.GetRef().GetLinkedRef(LinkCustom01) as FXDragonMoundScript).StartResurrection()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
AlduinWeather.SetActive(true, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property DragonMound  Auto  

ReferenceAlias Property Alduin  Auto  

Keyword Property LinkCustom01  Auto  

Weather Property AlduinWeather  Auto  

ReferenceAlias Property Dragon  Auto  
