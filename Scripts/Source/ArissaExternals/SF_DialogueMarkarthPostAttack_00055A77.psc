;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DialogueMarkarthPostAttack_00055A77 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;move everyone
Endon.GetActorRef().Moveto(MarkarthSceneEndonMarker)
Kerah.GetActorRef().Moveto(MarkarthSceneKerahMarker)
Adara.GetActorRef().Moveto(MarkarthSceneAdaraMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Endon  Auto  

ReferenceAlias Property Adara  Auto  

ReferenceAlias Property Kerah  Auto  

ObjectReference Property MarkarthSceneEndonMarker  Auto  

ObjectReference Property MarkarthSceneKerahMarker  Auto  

ObjectReference Property MarkarthSceneAdaraMarker  Auto  
