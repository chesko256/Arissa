;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname _Arissa_KnowledgePromptFrag Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Location loc = akSpeaker.GetCurrentLocation()
(_Arissa_DialogueMain as _Arissa_iNPC_Behavior).PlayPlaceKnowledgeDialogue(loc)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest property _Arissa_DialogueMain auto
