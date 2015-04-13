;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_MGRitual05_000D0755 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DaggerDungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DaggerDungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dagger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dagger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tolfdir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tolfdir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DaggerContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DaggerContainer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(Heartscales,1)
Game.GetPlayer().AddItem(SpellTomeDragonskin, 1)
MGRitualAltBook.SetValue(0)
AlterationVendorChest.AddItem(SpellTomeMassParalysis, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
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

Spell Property Ritual02Spell  Auto  

Activator Property SummonFXActivator  Auto  

ObjectReference Property FXMarker  Auto  

Scene Property MGRitual04AugurEndScene  Auto  

Spell Property BaneoftheUndead  Auto  

miscobject Property Heartscales  Auto  

book Property SpellTomeDragonskin  Auto  

GlobalVariable Property MGRitualAltBook  Auto  

ObjectReference Property AlterationVendorChest  Auto  

Book Property SpellTomeMassParalysis  Auto  
