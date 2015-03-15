;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_MQ102_HelgenUpdate Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
iNPCSystem.ArissaTalkedAbout_MQ102_Helgen = true
if MQ102.GetStage() < 30
    MQ102.SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
_Arissa_iNPC_Behavior Property iNPCSystem auto
Quest property MQ102 auto
