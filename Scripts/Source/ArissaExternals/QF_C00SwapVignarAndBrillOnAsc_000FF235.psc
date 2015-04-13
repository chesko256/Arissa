;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_C00SwapVignarAndBrillOnAsc_000FF235 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Vignar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vignar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brill
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Brill Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Debug.Trace("CW C00: Swapping Vignar and Brill's crime factions on their promotion to government.")
Alias_Vignar.GetActorReference().RemoveFromFaction(CompanionsFaction)
Alias_Vignar.GetActorReference().AddToFaction(CrimeFactionWhiterun)
Alias_Vignar.GetActorReference().SetCrimeFaction(CrimeFactionWhiterun)
Alias_Brill.GetActorReference().RemoveFromFaction(CompanionsFaction)
Alias_Brill.GetActorReference().AddToFaction(CrimeFactionWhiterun)
Alias_Brill.GetActorReference().SetCrimeFaction(CrimeFactionWhiterun)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property CompanionsFaction  Auto  

Faction Property CrimeFactionWhiterun  Auto  
