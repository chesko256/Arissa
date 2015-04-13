;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_DialogueWinterholdCollege_0003618F Extends Quest Hidden

;BEGIN ALIAS PROPERTY MGStaffofMagnus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MGStaffofMagnus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Onmund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Onmund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jzargo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jzargo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tolfdir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tolfdir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FellglowKeepLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FellglowKeepLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MGTorcAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MGTorcAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SavosArenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SavosArenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SaarthalLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SaarthalLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnthirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EnthirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;main quest line is finished
;EVP Tolfdir so he force-greets the player
Game.GetPlayer().AddPerk(MGEnthirVendorPerk)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

perk Property MGEnthirVendorPerk  Auto  
