;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_dunFellglow_ReleaseDogs_0008A372 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Lever.Activate(Game.GetPlayer())
GetOwningQuest().SetStage(25)
JailGuard.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Wolf1.GetActorReference().EvaluatePackage()
Wolf2.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Wolf1  Auto  

ReferenceAlias Property Wolf2  Auto  

ObjectReference Property Lever  Auto  

ReferenceAlias Property JailGuard  Auto  
