;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_dunPOIReachForswornRaidQST_000317D1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Forsworn3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Forsworn3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Forsworn1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Soldier01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forsworn2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Forsworn2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Soldier02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Any of the Forsworn are attacked.
Alias_Forsworn1.GetActorRef().SetAV("Aggression", 2)
Alias_Forsworn2.GetActorRef().SetAV("Aggression", 2)
Alias_Forsworn3.GetActorRef().SetAV("Aggression", 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player damages at least one of the Forsworn.
Alias_Forsworn1.GetActorRef().SetAV("Aggression", 2)
Alias_Forsworn2.GetActorRef().SetAV("Aggression", 2)
Alias_Forsworn3.GetActorRef().SetAV("Aggression", 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
