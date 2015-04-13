;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0002243A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
pAstridNMEnterScene.Start()
DB04Script pDB04Script = pDB04 as DB04Script
pDB04Script.Listener = 2
GetOwningQuest().SetStage(40)
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pAstridNMEnterScene Auto  

Quest Property pDB04  Auto  

GlobalVariable Property pFavorReward  Auto  
