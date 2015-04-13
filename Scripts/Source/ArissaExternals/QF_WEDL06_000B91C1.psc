;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_WEDL06_000B91C1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LouisLetrush
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LouisLetrush Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
alias_LouisLetrush.GetReference().DeleteWhenAble()
alias_Thug.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Thug killed, Lutresh attack player
LetrushAttackScene.start()
WEDL06LutreshFaction.setEnemy(PlayerFaction)
(alias_LouisLetrush.getReference() as actor).setAV("aggression", 2)
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
alias_LouisLetrush.getReference().moveTo(alias_TravelMarker1.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;scene over Lutresh and Thug fight
WEDL06ThugFaction.setEnemy(WEDL06LutreshFaction)
(alias_LouisLetrush.getReference() as actor).setav("health",1)
(alias_LouisLetrush.getReference() as actor).getactorBase().setprotected(false)
(alias_LouisLetrush.getReference() as actor).getactorBase().setEssential(false)
(alias_Thug.getReference() as actor).setAV("aggression", 1)
(alias_Thug.getReference() as actor).startCombat(alias_LouisLetrush.getReference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property WEDL06LutreshFaction  Auto  

Faction Property WEDL06ThugFaction  Auto  

Faction Property PlayerFaction  Auto  

Scene Property LetrushAttackScene  Auto  
