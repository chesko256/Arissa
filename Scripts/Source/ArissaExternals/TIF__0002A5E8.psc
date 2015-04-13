;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0002A5E8 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DA06YamarzAlias.GetActorReference().SetAV("Health", 10)
(DA06YamarzAlias.GetActorReference().GetBaseObject() as ActorBase).SetEssential(False)
DA06QuestScript QuestScript = GetOwningQuest() as DA06QuestScript
QuestScript.YamarzGroveMarker=2
DA06YamarzAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property DA06YamarzAlias  Auto  

ObjectReference Property DA06GiantRef  Auto  

ReferenceAlias Property DA06GiantAlias  Auto  
