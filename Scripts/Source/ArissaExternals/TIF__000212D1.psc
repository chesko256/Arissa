;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000212D1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
pDB03.SetStage (50)
;Game.GetPlayer().AddItem(pGold,100)
Game.GetPlayer().AddItem(LvlQuestReward02Medium)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB03  Auto  

MiscObject Property pPendant  Auto  

MiscObject Property pGold  Auto  


GlobalVariable Property pFavorReward  Auto  

LeveledItem Property LvlQuestReward02Medium  Auto  
