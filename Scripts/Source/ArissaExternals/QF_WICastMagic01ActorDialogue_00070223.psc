;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WICastMagic01ActorDialogue_00070223 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Actor1
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Actor1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExternalAliasChild
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_ExternalAliasChild Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor2NotChild
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Actor2NotChild Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExternalAliasChildIsActor1ORActor2
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_ExternalAliasChildIsActor1ORActor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor2
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Actor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor1NotChild
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Actor1NotChild Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ActorNotChild
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_ActorNotChild Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace("WICastMagic01ActorDialogueEvent stage 0:" + Alias_Actor1.GetReference() + " + " + Alias_Actor2.GetReference())
;debug.messagebox("WICastMagic01ActorDialogueEvent:" + Alias_Actor1.GetReference() + " + " + Alias_Actor2.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
