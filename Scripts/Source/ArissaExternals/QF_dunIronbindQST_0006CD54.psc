;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname QF_dunIronbindQST_0006CD54 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Salma
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Salma Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InsideMarker02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InsideMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Beem_Ja
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Beem_Ja Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InsideMarker01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InsideMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DraugrBoss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DraugrBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Campfire
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Campfire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SalmaGoalAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SalmaGoalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeemJaGoalAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BeemJaGoalAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; set when party encounters locked portcullis
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; set when players enter the boss chamber
Alias_DraugrBoss.getActorReference().startcombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; quest beaten (either killed BeemJa or Gathrik, whichever came second)
; stop() - commenting this out in favor of stopping the quest when Salma's script does so
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; empty for now
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE QF_dunIronbindQST_0006CD54
Quest __temp = self as Quest
QF_dunIronbindQST_0006CD54 kmyQuest = __temp as QF_dunIronbindQST_0006CD54
;END AUTOCAST
;BEGIN CODE
; turn Beem-Ja against the player & Salma
((Alias_Beem_Ja.getReference() as actor).getActorBase()).setProtected(FALSE)
(Alias_Beem_Ja.getReference() as actor).removeFromAllFactions()
(Alias_Beem_Ja.getReference() as actor).startCombat(game.getPlayer())
(Alias_Beem_Ja.getReference() as actor).setFactionRank(draugrFaction,1)
(Alias_Salma.getReference() as actor).setFactionRank(dunPlayerAllyFaction, 1)
dunReanimateSelf.cast(Alias_DraugrBoss.getReference(),Alias_DraugrBoss.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; empty for now
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; set by lever when portcullis is opened
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; Players are about to encounter the warlord Draugr
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE QF_dunIronbindQST_0006CD54
Quest __temp = self as Quest
QF_dunIronbindQST_0006CD54 kmyQuest = __temp as QF_dunIronbindQST_0006CD54
;END AUTOCAST
;BEGIN CODE
; set on trigger once player is inside the dungeon
IntroScene.stop()
Alias_Beem_Ja.getReference().moveTo(Alias_InsideMarker01.getReference())
Alias_Salma.getReference().moveTo(Alias_InsideMarker02.getReference())
(Alias_Beem_Ja.getReference() as actor).setFactionRank(dunPlayerAllyFaction, 1)
(Alias_Salma.getReference() as actor).setFactionRank(dunPlayerAllyFaction, 1)
InteriorScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; player goes into the dungeon and/or tells Salma that will happen
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Party enters Hall of Stories
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE QF_dunIronbindQST_0006CD54
Quest __temp = self as Quest
QF_dunIronbindQST_0006CD54 kmyQuest = __temp as QF_dunIronbindQST_0006CD54
;END AUTOCAST
;BEGIN CODE
; kick off scene outside the cave entrance
IntroScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; temp
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;set when party enters the large tomb "exterior" chamber
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; Gathrik is Dead, Beem-Ja (if alive) begins his mini-monologue
(Alias_Beem_Ja.getReference() as actor).stopCombat()
(Alias_Beem_Ja.getReference() as actor).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property InteriorScene  Auto  

scene Property introScene  Auto  

faction Property dunPlayerAllyFaction  Auto  

Spell Property dunReanimateSelf  Auto  

Faction Property draugrFaction  Auto  
