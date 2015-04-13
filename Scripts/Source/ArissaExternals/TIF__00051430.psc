;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00051430 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MG05QuestScript MG05Script = GetOwningQuest() as MG05QuestScript
MG05Script.MG05Aid =1
MG05Faralda.GetActorReference().EvaluatePackage()
MG05FaraldaBridgeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property MG05FaraldaBridgeScene  Auto  

ReferenceAlias Property MG05Faralda  Auto  
