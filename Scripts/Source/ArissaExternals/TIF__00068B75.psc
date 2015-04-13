;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00068B75 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
pDB08.SetStage(200)
pDB09.SetStage(5)
Game.GetPlayer().AddItem(LvlQuestReward03Large)
Game.GetPlayer().AddItem(pRing,1)
pDB08Script Script = pDB08 as pDB08Script
Script.pFestusFirstTalk=1
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.FestusRespect=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
;pDB08.SetStage(200)
;pDB09.SetStage(5)
;Game.GetPlayer().AddItem(LvlQuestReward03Large)
;Game.GetPlayer().AddItem(pRing,1)
;pDB08Script Script = pDB08 as pDB08Script
;Script.pFestusFirstTalk=1
;DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
;DBScript.FestusRespect=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB08  Auto  

Quest Property pDB09  Auto  

MiscObject Property pGold  Auto  

Armor Property pRing  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

GlobalVariable Property pFavorReward  Auto  

LeveledItem Property LvlQuestReward03Large  Auto  
