;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_WIGreeting_000C7919 Extends Quest Hidden

;BEGIN ALIAS PROPERTY HomeOwner
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_HomeOwner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Merchant
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Merchant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;REMINDER: Innkeeper Greetings live in WITavern quest

; debug.Trace("WIGreeting Started.")
; debug.Trace("WIGreeting: " + Alias_Location + Alias_Location.GetLocation() )
; debug.Trace("WIGreeting: " + Alias_Merchant + Alias_Merchant .GetReference() )
; debug.Trace("WIGreeting: " + Alias_HomeOwner + Alias_HomeOwner.GetReference() )
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
