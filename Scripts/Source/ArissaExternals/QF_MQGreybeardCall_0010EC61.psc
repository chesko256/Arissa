;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_MQGreybeardCall_0010EC61 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LookTarget3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LookTarget3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander7
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LookTarget1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LookTarget1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BystanderAnimal2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BystanderAnimal2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander9
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LookTarget2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LookTarget2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander10
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BystanderAnimal1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BystanderAnimal1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander8
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BystanderAnimal3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BystanderAnimal3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander6
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_looktarget1.GetRef().Delete()
Alias_looktarget2.GetRef().Delete()
Alias_looktarget3.GetRef().Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; move look target into the air
Alias_LookTarget1.GetRef().MoveTo(Game.GetPlayer(), 1000, 1000, 1000)
Alias_LookTarget2.GetRef().MoveTo(Game.GetPlayer(), -1000, 1000, 1000)
Alias_LookTarget3.GetRef().MoveTo(Game.GetPlayer(), -1000, -1000, 1000)

; greybeard summons
QSTGreybeardCall.Play(Game.GetPlayer())
game.shakeCamera(None, 0.85, 3)
game.shakeController(0.65, 0.65, 3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTGreybeardCall  Auto  
