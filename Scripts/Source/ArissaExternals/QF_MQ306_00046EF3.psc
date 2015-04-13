;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_MQ306_00046EF3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Arngeir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Arngeir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon8
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dragon8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon6
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dragon6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Odahviing
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Odahviing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dragon1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dragon4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dragon3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wulfgar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Wulfgar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon7
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dragon7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Esbern
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Esbern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Borri
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Borri Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tsun
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Tsun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Einarth
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Einarth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dragon2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dragon5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Paarthurnax
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Paarthurnax Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; player has spoken to Arngeir
ArngeirScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; dragon scene ends
OdahviingScene.Start()
; dragons fly away - used to disable them when complete
DragonsLeaveScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; start dragon scene
DragonEnableMarker.Enable()
DragonScene.Start()
; restart civil war
CW.SetStage(256)
; turn Dragonsreach clutter back on
MQDisableClutter.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; player leaves throat of the world
DragonEnableMarker.Disable()
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Paarthurnax has said his goodbye line
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; player has spoken to Delphine
DelphineEsbernScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player can now call Odahviing
OdahviingFaction.SetAlly(PlayerFaction)
; make sure
actor odahviing = Alias_Odahviing.GetActorRef()
odahviing.SetRestrained(false)
odahviing.SetAllowFlying(true)
odahviing.GetActorBase().SetInvulnerable(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; player has spoken to Paarthurnax
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Odahviing has spoken to player
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerFaction  Auto  

Faction Property OdahviingFaction  Auto  

Quest Property CW  Auto  

Scene Property OdahviingScene  Auto  

ObjectReference Property DragonEnableMarker  Auto  

Scene Property DragonScene  Auto  

Scene Property DragonsLeaveScene  Auto  

Scene Property ArngeirScene  Auto  

Scene Property DelphineEsbernScene  Auto  

ObjectReference Property MQDisableClutter  Auto  
