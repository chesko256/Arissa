;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00097FCB Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getowningquest().setstage (5)
pMQ202QS.CheckForGissurOverhearing(akSpeaker)
pMQ202Quest.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MQ202QuestScript Property pMQ202QS  Auto  

Quest Property pMQ202Quest  Auto  
