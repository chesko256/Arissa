;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CRHoldExpansion_000F9075 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Location holdLoc = Alias_Hold.GetLocation()
if (!AllowedHolds.HasForm(holdLoc))
; 	Debug.Trace("CRQ: Adding " + holdLoc + " to allowed Companions radiant holds.")
	AllowedHolds.AddForm(holdLoc)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AllowedHolds  Auto  
