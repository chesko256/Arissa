;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PF_MQ101PlayerMoveLineMarker_000F46E4 Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
(GetOwningQuest() as MQ101QuestScript).CameraBobStop()
;make sure hands are bound
Game.GetPlayer().PlayIdle(OffsetBoundStandingStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
(GetOwningQuest() as MQ101QuestScript).CameraBobStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property OffsetBoundStandingStart  Auto  
