;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_dunShroudHearthBarrow_Phan_00072210 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Actor Wynd = Wyndelius as Actor
Wynd.MoveTo(WyndStartPoint)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Wynd = Wyndelius as Actor
Wynd.MoveTo(WyndTeleportPoint)
Wynd.setAV("Aggression", 2)
Wynd.RemoveFromFaction(dunPlayerAllyFaction)
Wynd.AddToFaction(dunPlayerEnemyFaction)
Wynd.evaluatePackage()
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference property Wyndelius Auto
Faction Property dunPlayerEnemyFaction  Auto  

ObjectReference Property WyndTeleportPoint  Auto  

Faction Property dunPlayerAllyFaction  Auto  

ObjectReference Property WyndStartPoint  Auto  
