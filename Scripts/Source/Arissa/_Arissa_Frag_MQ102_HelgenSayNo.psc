;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname _Arissa_Frag_MQ102_HelgenSayNo Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(MainQuest as _Arissa_iNPC_Behavior).ArissaTalkedAbout_MQ102_Helgen = true
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property MainQuest  Auto  
