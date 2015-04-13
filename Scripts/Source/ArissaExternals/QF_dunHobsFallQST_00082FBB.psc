;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_dunHobsFallQST_00082FBB Extends Quest Hidden

;BEGIN ALIAS PROPERTY DeadPrisoner
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_DeadPrisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RitualObserver02
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_RitualObserver02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlmostDeadPrisoner
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_AlmostDeadPrisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RitualObserver01
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_RitualObserver01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuildMaster
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_GuildMaster Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
alias_GuildMaster.getactorReference().enable()
alias_RitualObserver01.getactorReference().enable()
alias_RitualObserver02.getactorReference().enable()
alias_DeadPrisoner.getactorReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
alias_AlmostDeadPrisoner.getactorReference().disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
