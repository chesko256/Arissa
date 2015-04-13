;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_dunNilheimQST_0001BAEC Extends Quest Hidden

;BEGIN ALIAS PROPERTY BanditB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditE
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditE Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nilheim_Camp
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nilheim_Camp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telrav
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telrav Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
AchievementsQuest.IncSideQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Telrav.getActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

achievementsScript Property achievementsQuest  Auto  
