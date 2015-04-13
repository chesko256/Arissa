;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00028E27 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
;Set DB07.ArnbjornTalked to 1
DB07Script Script = pDB07 as DB07Script
Script.ArnbjornTalked = 1
pDB07.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB07  Auto  

GlobalVariable Property pFavorReward  Auto  
