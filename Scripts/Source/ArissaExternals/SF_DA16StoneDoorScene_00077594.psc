;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DA16StoneDoorScene_00077594 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
pStoneDoor.Activate(pErandur)
pDA16StoneDoorOpen.Value = 1
pErandurAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pStoneDoor  Auto  
ReferenceAlias Property pErandurAlias  Auto  
ObjectReference Property pErandur  Auto

GlobalVariable Property pDA16StoneDoorOpen  Auto  
