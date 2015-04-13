;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__011251C7 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; update state variable
MQ201PartyScript MQ201Party = GetOwningQuest() as MQ201PartyScript
MQ201QuestScript MQ201 = MQ201Party.MQ201 as MQ201QuestScript
MQ201.PartyDistractionDrunkState = 2
MQ201.StartDistractionScene(MQ201.PartyDistractionDrunkScene)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
