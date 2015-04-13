;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0003BC61 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MS13LucanCamillaScene.Stop()
MS13QuestScript MyQuest
MyQuest = MS13 as MS13QuestScript
MyQuest.LucanForceGreet = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS13  Auto  

Scene Property MS13LucanCamillaScene  Auto  
