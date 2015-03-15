;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_MQ01_ChooseLeave Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if GetOwningQuest().GetStage() == 99
   GetOwningQuest().SetStage(100)
endif
if GetOwningQuest().IsObjectiveDisplayed(20)
   GetOwningQuest().SetObjectiveCompleted(20)
   if GetOwningQuest().GetStage() == 100
       GetOwningQuest().SetObjectiveDisplayed(100)
   endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
