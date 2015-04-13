;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname QF_MQ205_0002D516 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Arngeir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Arngeir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ElderScrollActivator
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ElderScrollActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlftandWorldDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AlftandWorldDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlftandSecondCellDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AlftandSecondCellDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ElderScrollMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ElderScrollMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Esbern
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Esbern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Urag
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Urag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Paarthurnax
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Paarthurnax Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlftandZCellIntDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AlftandZCellIntDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TamrielToAlftand
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TamrielToAlftand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlackreachLock
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BlackreachLock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Septimus
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Septimus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ActualBlackreachDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ActualBlackreachDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; quickstart
; debug.trace("MQ Quickstart " + self)
; make sure P is enabled
Alias_Paarthurnax.GetRef().Enable()
MQ204.SetStage(1)
MQ204.SetStage(10)
MQ204.SetStage(80)
MQ204.SetStage(81)
MQ204.SetStage(82)
MQ204.SetStage(83)
MQ204.SetStage(86)
MQ204.SetStage(90)
MQ204.SetStage(95)
MQ204.SetStage(100)
MQ204.SetStage(120)
MQ204.SetStage(125)
MQ204.SetStage(135)
MQ204.SetStage(140)
MQ204.SetStage(150)
MQ204.SetStage(200)
MQ204.SetStage(210)
; debug.trace("MQ Quickstart DONE " + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
; player has spoken to Septimus
SetObjectiveCompleted(10)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
; player has spoken to Arngeir
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; shut down MQ204 - UNLESS player had Elder Scroll when completing MQ204
MQ204.SetStage(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; found Elder Scroll
UnregisterForUpdate()
SetObjectiveCompleted(10)
SetObjectiveCompleted(50)
; add achievement
Game.AddAchievement(6)
MQ206.SetStage(10)
MQ206.SetActive()


Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; player has talked to Delphine or Esbern
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; player has found out about Septimus
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
; start Paarthurnax quest -- Blades want you to kill him
; watch for player to get elder scroll
RegisterForUpdate(5)

;Enable the third batch of dragon mounds.
dunDragonMoundQST.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
MGMQBridge.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQPaarthurnax  Auto  

Quest Property MQ204  Auto  

Quest Property MQ206  Auto  

quest Property MGMQBridge  Auto  

Quest Property dunDragonMoundQST  Auto  
