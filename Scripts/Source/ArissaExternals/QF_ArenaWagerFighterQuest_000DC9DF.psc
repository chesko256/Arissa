;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_ArenaWagerFighterQuest_000DC9DF Extends Quest Hidden

;BEGIN ALIAS PROPERTY FighterSpawn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FighterSpawn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fighter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fighter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Fighter.GetReference().Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
