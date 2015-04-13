;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_C06Extraction_001090D1 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Debug.Trace("C06: Starting extraction scene...")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Debug.Trace("C06: Calling extract on wolf spirit...")
(WolfSpirit.GetReference() as SpiritWolfScript).Extract(Kodlak.GetActorRef())
(GetOwningQuest() as C06QuestScript).WolfSpiritChill = false
WolfSpirit.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetStage(65)
Kodlak.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property WolfSpirit  Auto  

ReferenceAlias Property Kodlak  Auto  
