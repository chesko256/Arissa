;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00025E5D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;GetOwningQuest().SetStage(76)
MS11QuestScript ms11script = GetOwningQuest() as MS11QuestScript

ms11script.SentViolaToHjerim = true
akSpeaker.EvaluatePackage()

ms11script.InvestigateViolaPointer = False
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
