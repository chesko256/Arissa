;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00039626 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MS13BleakFallsBarrowArvelScene.Stop()
ArvelStuck.Stop()
(GetOwningQuest() as MS13QuestScript).ArvelShouted = 1
(GetOwningQuest() as MS13QuestScript).ArvelGreet = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MS13BleakFallsBarrowArvelScene  Auto  

Scene Property ArvelStuck  Auto  
