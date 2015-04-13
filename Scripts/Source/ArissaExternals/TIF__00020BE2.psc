;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00020BE2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Startquest DB02
;SetStage DB02 10
pDB02.SetStage (10)
;pAbandonedShackDoor.Lock (false)
Game.EnablePlayerControls()
pDBEntranceQuestScript EntranceScript = pDBEntranceQuest as pDBEntranceQuestScript
EntranceScript.pSleepyTime = 4
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB02  Auto  

ObjectReference Property pAbandonedShackDoor  Auto  

Quest Property pDBEntranceQuest  Auto  
