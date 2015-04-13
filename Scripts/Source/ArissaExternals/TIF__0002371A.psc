;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0002371A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DA16QuestScript pDA16Script = getowningquest() as DA16QuestScript
pDA16Script.pDA16FirstSceneBreak = 2
pDA16FirstSceneOutro.Start()
Game.EnablePlayerControls(true,false,false,true,false,false,false,true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pDA16FirstSceneOutro  Auto  
