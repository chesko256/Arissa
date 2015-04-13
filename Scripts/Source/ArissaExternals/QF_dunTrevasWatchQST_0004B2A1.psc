;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname QF_dunTrevasWatchQST_0004B2A1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY bodyguard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bodyguard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Stalleo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Stalleo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Backdoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Backdoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brurid
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Brurid Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DiningMelee
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DiningMelee Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bodyguard2Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bodyguard2Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bodyguard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bodyguard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DiningWizard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DiningWizard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StalleoMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StalleoMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY diningMissile
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_diningMissile Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lever
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BodyGuard1Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BodyGuard1Marker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(alias_Stalleo.getReference() as ACTOR).EvaluatePackage()
(alias_Stalleo.getReference() as ACTOR).moveTo(alias_StalleoMarker.getReference())
(alias_bodyguard1.getReference() as ACTOR).EvaluatePackage()
(alias_bodyguard1.getReference() as ACTOR).moveTo(alias_BodyGuard1Marker.getReference())
(alias_bodyguard2.getReference() as ACTOR).EvaluatePackage()
(alias_bodyguard2.getReference() as ACTOR).moveTo(alias_BodyGuard2Marker.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE QF_dunTrevasWatchQST_0004B2A1
Quest __temp = self as Quest
QF_dunTrevasWatchQST_0004B2A1 kmyQuest = __temp as QF_dunTrevasWatchQST_0004B2A1
;END AUTOCAST
;BEGIN CODE
kmyquest.SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
AchievementsQuest.IncSideQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
setObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

achievementsscript Property achievementsquest  Auto  
