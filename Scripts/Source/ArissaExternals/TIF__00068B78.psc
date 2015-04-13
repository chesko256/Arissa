;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00068B78 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DB08.SetStage(200)
DB09.SetStage(5)
;Game.GetPlayer().AddItem(pGold,150)
Game.GetPlayer().AddItem(LvlQuestReward03Large)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property DB08  Auto  

Quest Property DB09  Auto  

MiscObject Property pGold  Auto  

LeveledItem Property LvlQuestReward02Medium  Auto  

LeveledItem Property LvlQuestReward01Small  Auto  

LeveledItem Property LvlQuestReward03Large  Auto  
