;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_BardAudienceQuest_001062A7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BardLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_BardLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player_Follower
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player_Follower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AudienceLocation2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AudienceLocation2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AudienceLocation3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AudienceLocation3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AudienceLocation4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AudienceLocation4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AudienceLocation1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AudienceLocation1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bystander1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AudienceLocation5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AudienceLocation5 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
BardAudienceQuestScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BardAudienceQuestScene  Auto  
