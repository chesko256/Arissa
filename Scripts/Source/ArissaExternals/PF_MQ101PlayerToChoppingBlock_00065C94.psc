;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname PF_MQ101PlayerToChoppingBlock_00065C94 Extends Package Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
;Put the guard in the sit package next
Game.GetPlayer().PlayIdle(IdleWalkingCameraEnd)
GetOwningQuest().SetStage(97)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5(Actor akActor)
;BEGIN CODE
(GetOwningQuest() as MQ101QuestScript).CameraBobStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property IdleWalkingCameraEnd  Auto  
