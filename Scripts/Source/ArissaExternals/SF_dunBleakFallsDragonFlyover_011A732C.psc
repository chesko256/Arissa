;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_dunBleakFallsDragonFlyover_011A732C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;actor dragonREF = ((getOwningQuest() as QF_dunBleakFAllsBarrowQST_000354CC).Alias_BleakFallsDragon.getReference()) as actor
actor dragonREF = dragon.getActorReference()
dragonRef.enable()
dragonRef.SetActorValue("aggression", 3)
dragonRef.startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Dragon  Auto  
