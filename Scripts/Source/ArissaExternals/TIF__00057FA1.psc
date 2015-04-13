;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00057FA1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MS08QuestScript QuestScript = GetOwningQuest() as MS08QuestScript
QuestScript.SaadiaFollow=1
Saadia.GetActorReference().EvaluatePackage()
Kematu.GetReference().MoveTo(KematuAmbushMarker.GetReference())
Warrior01.GetReference().Disable()
Warrior02.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Saadia  Auto  

ReferenceAlias Property Kematu  Auto  

ReferenceAlias Property KematuAmbushMarker  Auto  

ReferenceAlias Property Warrior01  Auto  

ReferenceAlias Property Warrior02  Auto  
