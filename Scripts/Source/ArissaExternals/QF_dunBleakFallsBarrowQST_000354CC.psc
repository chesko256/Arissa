;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_dunBleakFallsBarrowQST_000354CC Extends Quest Hidden

;BEGIN ALIAS PROPERTY BleakFallsDragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BleakFallsDragon Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
actor dragon = alias_BleakFAllsDragon.getActorReference()
;dragon.enable()
;dragon.SetActorValue("aggression", 3)
;dragon.startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Set when Dragon is killed
completeAllObjectives()
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; set when player hits trigger outside BFB.  Shows QT Marker
;setObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property FlyoverScene  Auto  
