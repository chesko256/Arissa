;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_MQKillDragon_00035D56 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
MQ304Alduin.SetInvulnerable(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; make Alduin invulnerable
MQ304Alduin.SetInvulnerable(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DragonsAbsorbed  Auto  

Scene Property MQKillDragonScene  Auto  

Armor Property DragonUnderskin  Auto  

Faction Property MQKillDragonFaction  Auto  

int Property VoicePointsReward = 50 Auto  
{for now, how many voice points to give player
eventually this may run through a formula}

Armor Property DragonDeadswap  Auto  

ActorBase Property MQ304Alduin  Auto  
