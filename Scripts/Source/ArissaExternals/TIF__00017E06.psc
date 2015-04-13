;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname TIF__00017E06 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MS13CamillaStage10Scene.Stop()
MS13QuestScript MyQuest
MyQuest = MS13 as MS13QuestScript
MyQuest.CamillaForceGreet = 0
;Camilla.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MS13CamillaEscortPlayerScene.Start()
MS13QuestScript MyQuest
MyQuest = MS13 as MS13QuestScript
MyQuest.CamillaEscort = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS13  Auto  

Scene Property MS13CamillaStage10Scene  Auto  

ReferenceAlias Property Camilla  Auto  

Scene Property MS13CamillaEscortPlayerScene  Auto  
