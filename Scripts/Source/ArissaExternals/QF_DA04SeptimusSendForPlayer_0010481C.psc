;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DA04SeptimusSendForPlayer_0010481C Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Debug.Trace("DA04: Adding Septimus's letter to courier container.")
(CourierQuest as WICourierScript).AddItemToContainer(SeptimusLetter)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CourierQuest  Auto  

Book Property SeptimusLetter  Auto  
