;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00059636 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
pDB06.SetStage (200)
pDB07.SetStage (10)
Game.GetPlayer().AddItem(LvlQuestReward03Large)
Game.GetPlayer().AddItem(pToken,1)
DB06Script Script = pDB06 as DB06Script
Script.pPlantedLetter=2
OlavaReadingQuest.SetStage (10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
;pDB06.SetStage (200)
;pDB07.SetStage (10)
;Game.GetPlayer().AddItem(LvlQuestReward03Large)
;Game.GetPlayer().AddItem(pToken,1)
;DB06Script Script = pDB06 as DB06Script
;Script.pPlantedLetter=2
;OlavaReadingQuest.SetStage (10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pGold  Auto  

MiscObject Property pToken  Auto  

Quest Property pDB06  Auto  

Quest Property pDB07  Auto  

GlobalVariable Property pFavorReward  Auto  

Quest Property OlavaReadingQuest  Auto  

LeveledItem Property LvlQuestReward03Large  Auto  
