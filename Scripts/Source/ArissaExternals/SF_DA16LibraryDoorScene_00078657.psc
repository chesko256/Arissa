;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DA16LibraryDoorScene_00078657 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
pErandurAlias.GetActorRef().EvaluatePackage()
pDA16LibraryDoorRef.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pErandurAlias  Auto  

ObjectReference Property pDA16LibraryDoorRef  Auto  
