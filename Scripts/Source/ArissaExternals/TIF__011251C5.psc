;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TIF__011251C5 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; update state variable
MQ201PartyScript MQ201Party = GetOwningQuest() as MQ201PartyScript
MQ201QuestScript MQ201 = MQ201Party.MQ201 as MQ201QuestScript
MQ201.PartyDistractionDrunkState = 1
; remove drink from player
MQ201.RemoveDrinkFromPlayer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
