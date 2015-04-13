;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00021D28 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
T03QuestScript t03script = GetOwningQuest() as T03QuestScript

t03script.PlayerHeardAboutEldergleam = true
Maurice.GetActorReference().EvaluatePackage()
EldergleamMapMarker.AddToMap()
GetOwningQuest().SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Maurice  Auto  


ObjectReference Property EldergleamMapMarker  Auto  
