;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_MGRArniel04_0006A119 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Arniel
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Arniel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MGRArniel04LookAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MGRArniel04LookAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Keening
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Keening Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaptiveMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CaptiveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Courier
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Courier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enthir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Enthir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
Game.GetPlayer().RemoveItem(Alias_Keening.GetReference(), 1)
Alias_Arniel.GetReference().AddItem(MGRKeeningNonPlayable, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().AddSpell(ArnielSpell)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
GemRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Alias_Courier.GetActorRef().Kill()
ObjectReference KeeningRef=Alias_Courier.GetReference().PlaceAtMe(Keening,1)
Alias_Keening.ForceRefTo(KeeningRef)
Alias_Courier.GetReference().Additem(Alias_Keening.GetReference(), 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Spell Property ArnielSpell  Auto  

int Property DoOnce  Auto  

weapon Property Keening  Auto  

ObjectReference Property GemRef  Auto  

Weapon Property MGRKeeningNonPlayable  Auto  
