;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_WEJS02_000B5D41 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BalbusFork
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BalbusFork Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AppropriateLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_AppropriateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Balbus
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Balbus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Heart
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Heart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY trollFat
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_trollFat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderEgg
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SpiderEgg Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Balbus.GetReference().DeleteWhenAble()


; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 0")

Alias_Balbus.GetReference().AddItem(Alias_BalbusFork.GetReference())
Alias_Balbus.GetReference().AddItem(Alias_Heart.GetReference())
Alias_Balbus.GetReference().AddItem(Alias_SpiderEgg.GetReference())
Alias_Balbus.GetReference().AddItem(Alias_TrollFat.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Alias_Balbus.GetReference().RemoveItem(Alias_BalbusFork.GetReference())
Alias_Balbus.GetReference().RemoveItem(Alias_Heart.GetReference())
Alias_Balbus.GetReference().RemoveItem(Alias_SpiderEgg.GetReference())
Alias_Balbus.GetReference().RemoveItem(Alias_TrollFat.GetReference())
game.getplayer().AddItem(Alias_BalbusFork.GetReference())
game.getplayer().AddItem(Alias_Heart.GetReference())
game.getplayer().AddItem(Alias_SpiderEgg.GetReference())
game.getplayer().AddItem(Alias_TrollFat.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
