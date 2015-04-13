;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_MQ102_PlayerAdmitsCrime Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(MainQuest as _Arissa_iNPC_Behavior).ArissaKnows_PlayerWasPrisoner = true
(MainQuest as _Arissa_iNPC_Behavior).ArissaTalkedAbout_MQ102_Helgen = true
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MainQuest  Auto  
