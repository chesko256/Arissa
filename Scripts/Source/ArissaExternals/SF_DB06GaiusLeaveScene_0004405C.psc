;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DB06GaiusLeaveScene_0004405C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DB06Script pScript = GetOwningQuest() as DB06Script
pScript.pScene01 = 1
CommanderMaroAlias.GetActorReference().EvaluatePackage()
GaiusMaroAlias.GetActorReference().EvaluatePackage()
FaidaAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property CommanderMaroAlias  Auto  

ReferenceAlias Property FaidaAlias  Auto  

ReferenceAlias Property GaiusMaroAlias  Auto  
