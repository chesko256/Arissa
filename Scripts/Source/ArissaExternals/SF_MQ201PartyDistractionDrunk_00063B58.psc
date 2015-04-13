;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_MQ201PartyDistractionDrunk_00063B58 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
MQ201PartyScript MQ201Party = GetOwningQuest() as MQ201PartyScript
MQ201QuestScript MQ201 = MQ201Party.MQ201 as MQ201QuestScript
MQ201.PartyDistractionState = 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; debug.trace(self + " start")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(self + " end")
MQ201PartyScript MQ201Party = GetOwningQuest() as MQ201PartyScript
MQ201QuestScript MQ201 = MQ201Party.MQ201 as MQ201QuestScript
MQ201.EndDistractionScene(self)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
