;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0008BACA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DialogueRiftenQuestScript Script = pRiftenDialogue as DialogueRiftenQuestScript
Script.pHonorhallEnterScene = 1
(GetOwningQuest() As DialogueRiftenQuestScript). pHroarAlias.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DialogueRiftenQuestScript). pRunaAlias.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DialogueRiftenQuestScript). pSamuelAlias.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DialogueRiftenQuestScript). pFrancoisAlias.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DialogueRiftenQuestScript). pConstanceAlias.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DialogueRiftenQuestScript). pGrelodAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pRiftenDialogue  Auto  
