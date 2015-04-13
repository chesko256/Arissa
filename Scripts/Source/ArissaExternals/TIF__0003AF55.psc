;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0003AF55 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MS09QuestScript MS09Script = MS09 as MS09QuestScript
MS09Script.MS09HomeSceneDone = 1
MS09AvulsteinAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS09  Auto  

ReferenceAlias Property MS09AvulsteinAlias  Auto  
