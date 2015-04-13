;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_TGBan_000B03A2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGBanNiruin
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanNiruin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanVipir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanVipir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanRavyn
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanRavyn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanVanrythAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanVanrythAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanMercer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanMercer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanCynricAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanCynricAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanBrynjolf
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanBrynjolf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanSyndusAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanSyndusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanArnskarAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanArnskarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanSapphireAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanSapphireAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanThrynnAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanThrynnAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGToniliaAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGToniliaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanDirgeAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanDirgeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanVekelAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanVekelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanRuneAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanRuneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanDelvin
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanDelvin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanGarthar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanGarthar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanHerluinAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanHerluinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGBanVex
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TGBanVex Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TGBanQuestScript
Quest __temp = self as Quest
TGBanQuestScript kmyQuest = __temp as TGBanQuestScript
;END AUTOCAST
;BEGIN CODE
;Pointer to Vex
SetObjectiveDisplayed (10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TGBanQuestScript
Quest __temp = self as Quest
TGBanQuestScript kmyQuest = __temp as TGBanQuestScript
;END AUTOCAST
;BEGIN CODE
;Reparation Assigned
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
if kmyQuest.pTGBanFirstTime == 0
kmyQuest.pTGBanFirstTime = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TGBanQuestScript
Quest __temp = self as Quest
TGBanQuestScript kmyQuest = __temp as TGBanQuestScript
;END AUTOCAST
;BEGIN CODE
;Gold brought to Vex and ban lifted
kmyQuest.pTGBanToggle.Value = 0
Game.GetPlayer().RemoveItem(kmyQuest.pTGGold,kmyQuest.pTGBanGoldTotal.GetValueInt())
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGBanQuestScript
Quest __temp = self as Quest
TGBanQuestScript kmyQuest = __temp as TGBanQuestScript
;END AUTOCAST
;BEGIN CODE
;Ban Initiated
kmyQuest.pTGBanToggle.Value = 1
kmyQuest.pTGBanMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
