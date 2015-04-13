;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_DA10StartScene_00023C43 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
GetOwningQuest().SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
pTyranus.GetActorRef().Enable()
pTyranus.GetActorRef().Moveto(pTyranusMarker)
pOgmund.GetActorRef().EvaluatePackage()
pOgmund.GetActorRef().Moveto(pOgmundMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pTyranus  Auto  

ReferenceAlias Property pOgmund  Auto  

ObjectReference Property pOgmundMarker  Auto  

ObjectReference Property pTyranusMarker  Auto  
