;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_dunFrostflowAbyssQST_00048121 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FrostflowAbyssLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_FrostflowAbyssLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Key
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Key Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sudi
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Sudi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ramati
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ramati Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossChaurus
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossChaurus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Urn
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Urn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Backpack
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Backpack Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HabdsSkull
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_HabdsSkull Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mani
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Mani Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LighthouseActivator
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LighthouseActivator Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;cremated the bones add boon, end quest
game.getPlayer().removeItem(alias_HabdsSkull.getReference(), 1)
game.getPlayer().placeAtMe(boonExplosion)
game.getPlayer().addSpell(dunFrostflowAbyssBoon)
game.getPlayer().addPerk(dunFrostflowAbyssPerk)
alias_LighthouseActivator.getReference().disable()
dunFrostflowResetMarker.disable()
utility.wait(5.0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;quest started, body found
setObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Giant Chaurus killed
setObjectiveCompleted(5)
HabdFound = TRUE
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Hole in basement found, explore Frostflow Abyss
FrostflowLocationReservation.clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;read journal
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;key picked up, proceed to dungeon
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Habd's Skull obtained
alias_LighthouseActivator.getReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;found Sabd
SabdFound = TRUE
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;found Sudi
SudiFound = TRUE
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

bool Property HabdFound  Auto  Conditional

bool Property SudiFound  Auto  Conditional

bool Property SabdFound  Auto  Conditional

spell Property Boon  Auto  

explosion Property BoonExplosion  Auto  

LocationAlias Property FrostflowLocationReservation  Auto  

Spell Property dunFrostflowAbyssBoon  Auto  

Perk Property dunFrostflowAbyssPerk  Auto  

ObjectReference Property dunFrostflowResetMarker  Auto  
