;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname TIF__00050C84 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
TG04SPQuestScript pTG04SPScript = getowningquest() as TG04SPQuestScript
pTG04SPScript.pTG04Quest.SetStage(44)
pTG04SPScript.pTG04SPQuest.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
