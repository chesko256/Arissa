;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_RoriksteadFreeform_0004EC52 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Erik
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Erik Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mralki
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Mralki Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has changed Mralki's mind and needs to report back to Erik
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
FailAllObjectives()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has spoken to Erik, and Erik is waiting to get the key
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player declined to help Erik.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player talks to Erik
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player has reported back to Erik, who will now become Erik the Slayer on unload. Quest complete.
SetObjectiveCompleted(20,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
