;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_dunMS06_0001F142 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PotemaBossEntity
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PotemaBossEntity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PotemaMural
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PotemaMural Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PotemaSkeleton
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PotemaSkeleton Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PotemaMural02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PotemaMural02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntryGate
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntryGate Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveC_Enemy02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WaveC_Enemy02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveA_Enemy02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WaveA_Enemy02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PotemaThrallVampire
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PotemaThrallVampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanterVampireMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BanterVampireMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveC_Enemy01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WaveC_Enemy01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveB_Enemy01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WaveB_Enemy01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveA_Enemy01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WaveA_Enemy01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveC_Enemy03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WaveC_Enemy03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveB_Enemy02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WaveB_Enemy02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveB_Enemy03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WaveB_Enemy03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE QF_dunMS06_0001F142
Quest __temp = self as Quest
QF_dunMS06_0001F142 kmyQuest = __temp as QF_dunMS06_0001F142
;END AUTOCAST
;BEGIN CODE
; fired when player is about to be taunted by the mural @ catacomb start
muralScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Corpse Room in 03
corpseRoom.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Player enters room with Vampire and Draugr Dialog scene in cell 02
dunMS06ThrallBanter.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE QF_dunMS06_0001F142
Quest __temp = self as Quest
QF_dunMS06_0001F142 kmyQuest = __temp as QF_dunMS06_0001F142
;END AUTOCAST
;BEGIN CODE
; fire off the boss battle scene
bossBattle.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property MuralScene  Auto  

scene Property bossBattle  Auto  

scene Property corpseRoom  Auto  

scene Property dunMS06ThrallBanter  Auto  
