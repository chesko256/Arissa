;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PF_DB09GiannaPostSoupStandPa_001058AC Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
Utility.Wait(1)
pDB09Script Script = pDB09 as pDB09Script
Script.pGiannaStand = 1
Gianna.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property pDB09  Auto  

ReferenceAlias Property Gianna  Auto  
