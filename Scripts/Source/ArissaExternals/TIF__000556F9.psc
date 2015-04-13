;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000556F9 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
pDB01Misc.SetStage (200)
;Game.GetPlayer().AddItem(pGoldReward,50)
Game.GetPlayer().AddItem(LvlQuestReward01Small)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.DB01MiscResolved = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB01Misc  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

 

MiscObject Property pGoldReward  Auto  

GlobalVariable Property pFavorReward  Auto  

LeveledItem Property LvlQuestReward01Small  Auto  
