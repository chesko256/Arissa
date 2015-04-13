;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 147
Scriptname QF_MQ302FillAliases_000876E6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SonsMajorHoldMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SonsMajorHoldMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsMinorHoldCapital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SonsMinorHoldCapital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsMinorHold2Capital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SonsMinorHold2Capital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsMinorHoldMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SonsMinorHoldMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialMinorHold2
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ImperialMinorHold2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialMinorHoldMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ImperialMinorHoldMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialMinorHoldMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ImperialMinorHoldMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsMinorHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SonsMinorHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsMinorHoldMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SonsMinorHoldMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialMajorHoldMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ImperialMajorHoldMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialMajorHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ImperialMajorHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialMinorHoldCapital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ImperialMinorHoldCapital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsTownRaided
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SonsTownRaided Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialMinorHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ImperialMinorHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsMinorHold2
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SonsMinorHold2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialMajorHoldCapital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ImperialMajorHoldCapital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsMajorHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SonsMajorHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SonsMajorHoldCapital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SonsMajorHoldCapital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialMinorHold2Capital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ImperialMinorHold2Capital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialTownRaided
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ImperialTownRaided Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_145
Function Fragment_145()
;BEGIN CODE
; fill MQ302 aliases
; debug.trace(self + " filling MQ302 aliases:")
; debug.trace(self + "     SonsMajorHold=" + Alias_SonsMajorHold.GetLocation())
; debug.trace(self + "     SonsMinorHold=" + Alias_SonsMinorHold.GetLocation())
; debug.trace(self + "     SonsMinorHold2=" + Alias_SonsMinorHold2.GetLocation())

; debug.trace(self + "     ImperialMajorHold=" + Alias_ImperialMajorHold.GetLocation())
; debug.trace(self + "     ImperialMinorHold=" + Alias_ImperialMinorHold.GetLocation())
; debug.trace(self + "     ImperialMinorHold2=" + Alias_ImperialMinorHold2.GetLocation())

SonsMajorHold.ForceLocationTo(Alias_SonsMajorHold.GetLocation()) 
SonsMinorHold.ForceLocationTo(Alias_SonsMinorHold.GetLocation()) 
SonsMinorHold2.ForceLocationTo(Alias_SonsMinorHold2.GetLocation()) 

SonsMajorHoldCapital.ForceLocationTo(Alias_SonsMajorHoldCapital.GetLocation()) 
SonsMinorHoldCapital.ForceLocationTo(Alias_SonsMinorHoldCapital.GetLocation()) 
SonsMinorHold2Capital.ForceLocationTo(Alias_SonsMinorHold2Capital.GetLocation()) 

ImperialMajorHold.ForceLocationTo(Alias_ImperialMajorHold.GetLocation()) 
ImperialMinorHold.ForceLocationTo(Alias_ImperialMinorHold.GetLocation()) 
ImperialMinorHold2.ForceLocationTo(Alias_ImperialMinorHold2.GetLocation()) 

ImperialMajorHoldCapital.ForceLocationTo(Alias_ImperialMajorHoldCapital.GetLocation()) 
ImperialMinorHoldCapital.ForceLocationTo(Alias_ImperialMinorHoldCapital.GetLocation()) 
ImperialMinorHold2Capital.ForceLocationTo(Alias_ImperialMinorHold2Capital.GetLocation()) 

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property SonsMajorHold  Auto  
LocationAlias Property SonsMinorHold  Auto  
LocationAlias Property SonsMinorHold2  Auto  
LocationAlias Property SonsMajorHoldCapital  Auto  
LocationAlias Property SonsMinorHoldCapital  Auto  
LocationAlias Property SonsMinorHold2Capital  Auto  

LocationAlias Property ImperialMajorHold  Auto  
LocationAlias Property ImperialMinorHold  Auto  
LocationAlias Property ImperialMinorHold2  Auto  
LocationAlias Property ImperialMajorHoldCapital  Auto  
LocationAlias Property ImperialMinorHoldCapital  Auto  
LocationAlias Property ImperialMinorHold2Capital  Auto  




