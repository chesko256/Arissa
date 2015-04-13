;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_Exp_MQ01_Trust Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as _Arissa_iNPC_Behavior).IncreaseRegardMajor()
(GetOwningQuest() as _Arissa_iNPC_Behavior).IncreaseOpen()
(GetOwningQuest() as _Arissa_iNPC_Behavior).ArissaTalkedAbout_MQ01_Trust = true
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
