;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0003F406 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
pDB10.SetStage (40)
;Game.DisablePlayerControls()
pDB10Script Script = pDB10 as pDB10Script
Script.pPlayerWait = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB10  Auto  

GlobalVariable Property pFavorReward  Auto  
