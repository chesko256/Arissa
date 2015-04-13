;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_Scenes_CamillaHugArissa Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CamillaAlias.GetActorReference().PlayIdleWithTarget(pa_HugA, ArissaAlias.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ArissaAlias  Auto  

ReferenceAlias Property CamillaAlias  Auto  

Idle Property pa_HugA  Auto  
