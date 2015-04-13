;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_WindhelmIntroScene_000A195C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(GetOwningQuest() as DialogueWindhelmScript).WindhelmIntroDone = 1

Ambarys.GetActorRef().EvaluatePackage()
LonelyGale.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Ambarys  Auto  

ReferenceAlias Property LonelyGale  Auto  
