;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000CEFB9 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDB02.SetStage (10)
Game.EnablePlayerControls()
pDBEntranceQuestScript EntranceScript = DBEntranceQuest as pDBEntranceQuestScript
EntranceScript.pSleepyTime = 4
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;pDB02.SetStage (10)
;Game.EnablePlayerControls()
;pDBEntranceQuestScript EntranceScript = DBEntranceQuest as pDBEntranceQuestScript
;EntranceScript.pSleepyTime = 4
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property pDB02  Auto  

Quest Property DBEntranceQuest  Auto  
