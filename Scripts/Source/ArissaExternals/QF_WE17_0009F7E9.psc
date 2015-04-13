;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 0
Scriptname QF_WE17_0009F7E9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Soldier1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Soldier1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostEncounterSandboxRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSandboxRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 0, kill soldiers and remove all items")

Alias_Soldier1.GetActorReference().kill()
Alias_Soldier2.GetActorReference().kill()
Alias_Soldier3.GetActorReference().kill()

Alias_Soldier1.GetActorReference().RemoveAllItems()
Alias_Soldier2.GetActorReference().RemoveAllItems()
Alias_Soldier3.GetActorReference().RemoveAllItems()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;player pays "fine"
;--NOTE: WE17GoldAmount global and WEScript.Num1 value should be identical values
Game.GetPlayer().RemoveItem(kmyquest.WEParentS.Gold001, kmyquest.Num1 as int)
Alias_Bandit1.GetReference().AddItem(kmyquest.WEParentS.Gold001, kmyquest.Num1 as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 10, making bandits aggressive and attack player")

kmyquest.makeAliasAggressiveAndAttackPlayer(Alias_Bandit1)
kmyquest.makeAliasAggressiveAndAttackPlayer(Alias_Bandit2)
kmyquest.makeAliasAggressiveAndAttackPlayer(Alias_Bandit3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()

alias_Soldier1.GetReference().DeleteWhenAble()
alias_Soldier2.GetReference().DeleteWhenAble()
alias_Soldier3.GetReference().DeleteWhenAble()
alias_Bandit1.GetReference().DeleteWhenAble()
alias_Bandit2.GetReference().DeleteWhenAble()
alias_Bandit3.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
