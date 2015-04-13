;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000B7861 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as T01QuestScript).PlayerViolatedInnerSanctum()

if (akSpeakerRef == Orla.GetRef())
	Anwen.GetActorRef().EvaluatePackage()
elseif (akSpeakerRef == Anwen.GetRef())
	Orla.GetActorRef().EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Orla  Auto  

ReferenceAlias Property Anwen  Auto  
