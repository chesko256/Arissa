;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DialogueWhiterunArgueScene_00037CC2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Idolaf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Idolaf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Olfina
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Olfina Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fralia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fralia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Commander_Caius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Commander_Caius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Olfrid
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Olfrid Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Fralia.GetReference().MoveTo(FraliaMarker)
Alias_Idolaf.GetReference().MoveTo(IdolafMarker)
Alias_Idolaf.GetActorReference().EvaluatePackage()
Alias_Olfrid.GetReference().Moveto(OlfridMarker)
Alias_Olfrid.GetActorReference().EvaluatePackage()
;If Alias_Jon.GetReference().GetCurrentLocation() == BanneredMare
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

objectReference Property OlfridMarker  Auto  

ObjectReference Property IdolafMarker  Auto  

ObjectReference Property FraliaMarker  Auto  

Location Property BanneredMare  Auto  
