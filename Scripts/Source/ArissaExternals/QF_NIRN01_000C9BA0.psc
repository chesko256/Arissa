;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_NIRN01_000C9BA0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NN01AvrusaAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NN01AvrusaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NN01PlayerAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NN01PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NN01SinderionCorpseAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NN01SinderionCorpseAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NN01JournalAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NN01JournalAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Found a crimson nirnroot before picking up Sinderion's Journal
SetObjectiveDisplayed(5,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Sinderion's Journal was Read... Assign Red Nirnoot Collection
if IsObjectiveDisplayed(5) == 1
SetObjectiveCompleted(5,1)
endif
UpdateCurrentInstanceGlobal(pNN01Count)
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Turned in Nirnroot with Avrusa, Get Sinderion's Alchemy Perk
AchievementsQuest.IncSideQuests()
Game.GetPlayer().RemoveItem(pNirnrootRed, 30)
Game.GetPlayer().AddItem(pNN01SinderionsTome,1)
;Game.GetPlayer().AddPerk(pNN01Perk)
Game.GetPlayer().AddSpell(pNN01Spell)
SetObjectiveCompleted(20,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Startup
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pNN01Count  Auto  

Book Property pNN01SinderionsTome  Auto  

Perk Property pNN01Perk  Auto  

Spell Property pNN01Spell  Auto  

Ingredient Property pNirnrootRed  Auto  

AchievementsScript Property AchievementsQuest  Auto  
