;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_MQ201PartyDistractionFrien_000665E9 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
MQ201PartyScript MQ201Party = GetOwningQuest() as MQ201PartyScript
MQ201QuestScript MQ201 = MQ201Party.MQ201 as MQ201QuestScript
MQ201.PartyDistractionState = 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(self + " ENDING")
MQ201PartyScript MQ201Party = GetOwningQuest() as MQ201PartyScript
MQ201QuestScript MQ201 = MQ201Party.MQ201 as MQ201QuestScript
MQ201Party.EndFriendDistractionScene()
MQ201.EndDistractionScene(self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; debug.trace(self + " STARTING")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
