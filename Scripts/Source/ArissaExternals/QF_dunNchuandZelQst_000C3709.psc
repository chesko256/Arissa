;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_dunNchuandZelQst_000C3709 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AlethiusNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlethiusNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StrommBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StrommBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CalcelmoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CalcelmoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ErjBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ErjBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KragBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KragBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FinalLever
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FinalLever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StaubsBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StaubsBook Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
setObjectiveCompleted(100)
completeQuest()

AchievementsQuest.IncSideQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
setObjectiveDisplayed(20,1)
setObjectiveDisplayed(30,1)
setObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
setObjectiveCompleted(50)
setObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
setObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
setObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

achievementsScript Property AchievementsQuest  Auto  
