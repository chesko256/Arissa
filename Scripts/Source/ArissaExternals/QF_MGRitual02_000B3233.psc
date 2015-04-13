;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_MGRitual02_000B3233 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Book2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Drevis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Drevis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10,1)
Game.GetPlayer().RemoveItem(Alias_book1.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_book2.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_book3.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_book4.GetReference(),1)
Game.GetPlayer().AddItem(SpellTomeHysteria,1)
MGRitualIllBook.SetValue(0)
VendorChest.Additem(SpellTomeMayhem,1)
VendorChest.Additem(SpellTomeHarmony,1)
VendorChest.Additem(SpellTomeCallToArms,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
Game.GetPlayer().Addspell(Ritual02Spell)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Spell Property Ritual02Spell  Auto  

book Property SpellTomeHysteria  Auto  

GlobalVariable Property MGRitualIllBook  Auto  

Book Property SpellTomeMayhem  Auto  

Book Property SpellTomeHarmony  Auto  

Book Property SpellTomeCallToArms  Auto  



ObjectReference Property VendorChest  Auto  
