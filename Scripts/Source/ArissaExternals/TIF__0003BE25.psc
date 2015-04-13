;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0003BE25 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; try making Arngeir say something in response
; debug.trace(self + "Arngeir no speak comment")
MQ00QuestScript myQuest = (GetOwningQuest() as MQ00QuestScript)
if myQuest.ArngeirRef.GetDistance(Game.GetPlayer()) < 800
	myQuest.MQArngeirNoSpeakFlag = true
	myQuest.ArngeirRef.Say(myQuest.MQArngeirNoSpeakTopic)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
