;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_MQ01_EndQuest4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(_Arissa_DialogueMain as _Arissa_iNPC_Behavior).EngageFollowBehavior()
GetOwningQuest().CompleteAllObjectives()
GetOwningQuest().SetStage(200)
(_Arissa_DialogueMain as _Arissa_iNPC_Behavior).IncreaseRegardModerate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property _Arissa_DialogueMain  Auto  