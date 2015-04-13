;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_dunThrowVoiceQst_001075B1 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player learns last two words of Throw Voice

utility.wait(1)
game.TeachWord(WordMey)
utility.wait(1)
game.TeachWord(WordGut)
utility.wait(1)
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WordOfPower Property WordMey  Auto  

WordOfPower Property WordGut  Auto  
