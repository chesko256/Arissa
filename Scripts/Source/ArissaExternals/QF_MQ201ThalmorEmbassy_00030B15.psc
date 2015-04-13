;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_MQ201ThalmorEmbassy_00030B15 Extends Quest Hidden

;BEGIN ALIAS PROPERTY InnerCourtyardGuard01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnerCourtyardGuard01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ201BackupEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MQ201BackupEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnerCourtyardGuard02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnerCourtyardGuard02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyGuard1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_chattyGuard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InsideSolarGuard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InsideSolarGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorEmbassyLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_ThalmorEmbassyLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyGuard2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_chattyGuard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolarGuard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SolarGuard Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
alias_MQ201BackupEnableMarker.getReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; player has exited kitchen
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
