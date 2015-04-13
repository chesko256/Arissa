;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_MQ01_JailTogether2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if GetOwningQuest().IsObjectiveDisplayed(101)
  GetOwningQuest().SetObjectiveCompleted(101)
endif
GetOwningQuest().SetObjectiveDisplayed(102)
GetOwningQuest().SetStage(74)
(GetOwningQuest() as _Arissa_MQ01_Data).JailedTogether = true
(GetOwningQuest() as _Arissa_MQ01_Data).JailBroken = true
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
