;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF_MQ201Malborn_0004CECE Extends Quest Hidden

;BEGIN ALIAS PROPERTY Malborn
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Malborn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AssassinWaitMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AssassinWaitMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brelas
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Brelas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaravanLeaderA
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CaravanLeaderA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Assassin
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Assassin Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player accepts quest
SetObjectiveDisplayed(10)
if Alias_Assassin.GetActorRef().IsDead()
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; Malborn dies, fail quest
if IsObjectiveDisplayed(10) && !IsObjectiveCompleted(10)
	SetObjectiveFailed(10)
endif
if IsObjectiveDisplayed(20) && !IsObjectiveCompleted(20)
	SetObjectiveFailed(20)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; assassin is dead
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Malborn escapes
Alias_Malborn.TryToDisable()
Alias_Brelas.TryToDisable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; player arrives in Windhelm - set caravan timer for 1 day
RegisterForSingleUpdateGameTime(24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Malborn leaves Windhelm
SetObjectiveCompleted(20)
; make assassin aggressive
Alias_Assassin.GetActorRef().SetActorValue("aggression", 1)
MQ201MalbornAssassinFaction.SetEnemy(MQMalbornFaction)
; give reward
Game.GetPlayer().AddItem(Reward)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; caravan timer runs out
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; Khajiit finger the assassin
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; quest starts for real when Malborn arrives in Windhelm
Alias_Assassin.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; assassin hostile to player
MQ201MalbornAssassinFaction.SetEnemy(MQMalbornFaction)
MQ201MalbornAssassinFaction.SetEnemy(PlayerFaction)
Alias_Assassin.GetActorRef().SetActorValue("aggression", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; tell Malborn to leave without actually killing anybody
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property MQMalbornFaction  Auto  

Faction Property MQ201MalbornAssassinFaction  Auto  

Faction Property PlayerFaction  Auto  

LeveledItem Property Reward  Auto  
