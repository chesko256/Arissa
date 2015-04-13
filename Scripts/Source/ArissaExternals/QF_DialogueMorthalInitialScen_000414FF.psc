;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DialogueMorthalInitialScen_000414FF Extends Quest Hidden

;BEGIN ALIAS PROPERTY AslfurAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AslfurAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThonnirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThonnirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JorgenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JorgenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BenorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BenorAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_AslfurAlias.GetReference().MoveTo(AslfurMarker)
Alias_ThonnirAlias.GetReference().MoveTo(ThonnirMarker)
Alias_BenorAlias.GetReference().MoveTo(BenorMarker)
Alias_JorgenAlias.GetReference().MoveTo(JorgenMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property AslfurMarker  Auto  

ObjectReference Property ThonnirMarker  Auto  

ObjectReference Property BenorMarker  Auto  

ObjectReference Property JorgenMarker  Auto  
