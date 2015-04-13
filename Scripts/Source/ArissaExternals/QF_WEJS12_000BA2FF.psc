;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname QF_WEJS12_000BA2FF Extends Quest Hidden

;BEGIN ALIAS PROPERTY Necromancer02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Necromancer02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NecromancerMaleDarkElf
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NecromancerMaleDarkElf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SceneMarker03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SceneMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_NecromancerMaleDarkElf.GetReference().DeleteWhenAble()
Alias_Necromancer02.GetReference().DeleteWhenAble()


; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;add note to necromancer inventory if DA01 is completed
if da01.isCompleted()
     Alias_NecromancerMaleDarkElf.GetReference().AddItem(Alias_Note.GetReference())
else
     Alias_Note.GetReference().disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DA01Intro  Auto  

Quest Property DA01  Auto  
