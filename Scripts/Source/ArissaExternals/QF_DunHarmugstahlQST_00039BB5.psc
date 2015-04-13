;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_DunHarmugstahlQST_00039BB5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SpiderCage02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SpiderCage02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderCage03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SpiderCage03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderCage01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SpiderCage01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lever
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Lever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Warlock
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Warlock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Adventurer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Adventurer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AdvSpider
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AdvSpider Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
HarmugstahlLocation.SetCleared()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_0 in script QF_DunHarmugstahlQST_00039BB5
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
alias_AdvSpider.GetReference().enable()
Actor AdvSpider = alias_AdvSpider.GetReference() as Actor
Actor Adventurer = alias_Adventurer.GetReference() as Actor
AdvSpider.StartCombat(Adventurer)
Adventurer.StartCombat(AdvSpider)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

location Property HarmugstahlLocation  Auto  
