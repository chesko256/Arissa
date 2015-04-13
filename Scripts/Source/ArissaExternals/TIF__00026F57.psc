;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00026F57 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MS12QuestScript ms12script = GetOwningQuest() as MS12QuestScript

Game.GetPlayer().AddItem(Gold001, 5)
ms12script.GivenBrokenPhialToNurelion = true
Quintus.GetActorReference().EvaluatePackage()
akSpeaker.EvaluatePackage()
GetOwningQuest().SetStage(21)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Quintus  Auto  

MiscObject Property Gold001  Auto  
