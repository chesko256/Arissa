;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname TIF__00037CD2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_9
Function Fragment_9(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
TG07QuestScript pTG07Script = getowningquest() as TG07QuestScript
Game.GetPlayer().RemoveItem(pTG07Script.pTG07Plans,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
