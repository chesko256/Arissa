;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname _Arissa_Frag_MQ01_EndQuest Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(_Arissa_Dialogue_Main as _Arissa_iNPC_Behavior).EngageFollowBehavior()
GetOwningQuest().CompleteAllObjectives()
GetOwningQuest().SetStage(200)
akSpeaker.EvaluatePackage()
(_Arissa_Dialogue_Main as _Arissa_iNPC_Behavior).IncreaseRegardModerate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property _Arissa_Dialogue_Main  Auto  
