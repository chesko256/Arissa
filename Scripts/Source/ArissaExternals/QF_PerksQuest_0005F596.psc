;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF_PerksQuest_0005F596 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Imperial Luck - racial ability, not perk

GlobalImperialLuck.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Persuasion

SpeechEasy.SetValue(SpeechEasy.GetValue() * 0.7)
SpeechAverage.SetValue(SpeechAverage.GetValue() * 0.7)
SpeechHard.SetValue(SpeechHard.GetValue() * 0.7)
SpeechVeryHard.SetValue(SpeechVeryHard.GetValue() * 0.7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Treasure Hunter

SpecialLootChance.SetValue(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Daedric Mind

GlobalPerkDaedricMind.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Golden Touch

GlobalPerkGoldenTouch.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; Master Trader

PerkMasterTrader.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

globalvariable Property GlobalPerkDaedricMind  Auto  
GlobalVariable Property GlobalPerkGoldenTouch  Auto 
GlobalVariable Property GlobalImperialLuck  Auto  

GlobalVariable Property SpecialLootChance  Auto  

GlobalVariable Property PerkMasterTrader  Auto  

GlobalVariable Property SpeechAverage  Auto  

GlobalVariable Property SpeechEasy  Auto  

GlobalVariable Property SpeechHard  Auto  

GlobalVariable Property SpeechVeryHard  Auto  
