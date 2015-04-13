;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_WindhelmBullyScene_000CD91F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(GetOwningQuest() as DialogueWindhelmScript).WindhelmBullyDone=1
Rolff.GetActorRef().EvaluatePackage()
Angrenor.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Set variable that denotes the end of the scene and gates packages

Angrenor.GetActorRef().EvaluatePackage()
Rolff.GetActorRef().EvaluatePackage()
Suvaris.GetActorRef().EvaluatePackage()
(GetOwningQuest() as DialogueWindhelmScript).SuvarisFree = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Angrenor  Auto  

ReferenceAlias Property Rolff  Auto  

ReferenceAlias Property Suvaris  Auto  

int Property WindhelmBullyDone  Auto  
