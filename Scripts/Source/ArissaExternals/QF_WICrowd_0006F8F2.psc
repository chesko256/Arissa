;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_WICrowd_0006F8F2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Spectator3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RefToWatch1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RefToWatch1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RefToWatch2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RefToWatch2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrowdTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrowdTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator20 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator14 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Alias_CrowdTrigger as WICrowdTriggerScript).UnregisterForTriggerPositionUpdate()
Alias_CrowdTrigger.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Alias_CrowdTrigger as WICrowdTriggerScript).RegisterSpectatorAliases(Alias_Spectator1, Alias_Spectator2, Alias_Spectator3, Alias_Spectator4, Alias_Spectator5, Alias_Spectator6, Alias_Spectator7, Alias_Spectator8, Alias_Spectator9, Alias_Spectator10, Alias_Spectator11, Alias_Spectator12, Alias_Spectator13, Alias_Spectator14, Alias_Spectator15, Alias_Spectator16, Alias_Spectator17, Alias_Spectator18, Alias_Spectator19, Alias_Spectator20)
(Alias_CrowdTrigger as WICrowdTriggerScript).RegisterForUpdateTriggerPosition(Alias_RefToWatch1, 5)
(Alias_CrowdTrigger as WICrowdTriggerScript).UpdateTriggerPosition()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
