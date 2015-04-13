;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0002157A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MS11QuestScript ms11script = GetOwningQuest() as MS11QuestScript

ms11script.QuestionedWitness3 = true

if (ms11script.QuestionedWitness1 && ms11script.QuestionedWitness2 && ms11script.QuestionedWitness3)
     GetOwningQuest().SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
