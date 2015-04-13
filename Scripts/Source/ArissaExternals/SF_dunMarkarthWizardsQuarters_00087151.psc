;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_dunMarkarthWizardsQuarters_00087151 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetStage(22)
LabGuard01.GetActorRef().EvaluatePackage()
LabGuard02.GetActorRef().EvaluatePackage()
AicantarRef.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property LabGuard01  Auto  

ReferenceAlias Property LabGuard02  Auto  

ReferenceAlias Property AicantarRef  Auto  
