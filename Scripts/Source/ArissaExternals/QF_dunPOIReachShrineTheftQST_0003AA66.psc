;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_dunPOIReachShrineTheftQST_0003AA66 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Locket
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Locket Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gold
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Gold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dagger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dagger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hunter01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Hunter01.GetActorRef().SetAV("Aggression", 2)
Alias_Hunter02.GetActorRef().SetAV("Aggression", 2)
Alias_Hunter01.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Hunter02.GetActorRef().StartCombat(Game.GetPlayer())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
