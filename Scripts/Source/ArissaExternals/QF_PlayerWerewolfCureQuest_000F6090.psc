;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_PlayerWerewolfCureQuest_000F6090 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfSpirit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WolfSpirit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sconce
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sconce Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(C00 as CompanionsHousekeepingScript).CurePlayer()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property C00  Auto  
