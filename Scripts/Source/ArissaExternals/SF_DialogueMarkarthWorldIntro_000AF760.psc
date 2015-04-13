;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_DialogueMarkarthWorldIntro_000AF760 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
if Weylin.GetActorRef().PlayIdleWithTarget(SneakKillMove, Margret.GetActorRef())
;   Debug.Trace(self + " Weylin kills Margret")
else
;   Debug.Trace(self + "Function failed: Weylin doesn't kill Margret")
endIf
GetOwningQuest().SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
GetOwningQuest().SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Marker1  Auto  

ObjectReference Property Marker2  Auto  

ReferenceAlias Property Mulush  Auto  

ReferenceAlias Property Thonar  Auto  

ReferenceAlias Property Weylin  Auto  

ReferenceAlias Property Margret  Auto  

Idle Property SneakKillMove  Auto  
