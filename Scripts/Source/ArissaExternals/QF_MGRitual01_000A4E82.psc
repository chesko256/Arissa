;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_MGRitual01_000A4E82 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Book03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pedestal03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pedestal03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pedestal02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pedestal02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book02Activator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book02Activator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book01Activator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book01Activator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MGHoldingChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MGHoldingChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faralda
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faralda Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book03Activator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book03Activator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pedestal01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pedestal01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
CompleteAllObjectives()
MGRitualDestBook.SetValue(0)
VendorChest.AddItem(Blizzard, 1)
VendorChest.AddItem(SpellTomeLightningStorm,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MGRitualDestBook  Auto  

Book Property Blizzard  Auto  

Book Property SpellTomeLightningStorm  Auto  

ObjectReference Property VendorChest  Auto  
