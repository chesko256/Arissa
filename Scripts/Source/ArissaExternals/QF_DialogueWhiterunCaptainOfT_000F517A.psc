;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DialogueWhiterunCaptainOfT_000F517A Extends Quest Hidden

;BEGIN ALIAS PROPERTY WRCGCaiusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WRCGCaiusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WRCGSinmirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WRCGSinmirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Whiterun is now under Stormcloak Rule!
pDWRCGS.StormcloakGo()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DWRCGScript Property pDWRCGS  Auto  
