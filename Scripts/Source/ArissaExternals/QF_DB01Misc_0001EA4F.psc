;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_DB01Misc_0001EA4F Extends Quest Hidden

;BEGIN ALIAS PROPERTY DB01MiscGuardImperial
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DB01MiscGuardImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DB01MiscGuardSons
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DB01MiscGuardSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoreiusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoreiusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurweAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CurweAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CiceroRoadAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CiceroRoadAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
If IsObjectiveDisplayed(10)
   SetObjectiveCompleted(10)
Endif

If IsObjectiveDisplayed(20)
   SetObjectiveCompleted(20)
Endif

If IsObjectiveDisplayed(30)
   SetObjectiveCompleted(30)
Endif

If IsObjectiveDisplayed(50)
   SetObjectiveCompleted(50)
Endif


SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
pDB01GuardScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
If IsObjectiveDisplayed(5)
   SetObjectiveDisplayed(5,0)
Endif

If IsObjectiveDisplayed(10)
   SetObjectiveCompleted(10)
Endif

If IsObjectiveDisplayed(30)
   SetObjectiveCompleted(30)
Endif

If IsObjectiveDisplayed(40)
   SetObjectiveCompleted(40)
Endif

If IsObjectiveDisplayed(50)
   SetObjectiveCompleted(50)
Endif

SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If IsObjectiveDisplayed(40)
   SetObjectiveCompleted(40)
Endif

If IsObjectiveDisplayed(50)
   SetObjectiveCompleted(50)
Endif

AchievementsQuest.IncSideQuests()

Utility.Wait(5)
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
If IsObjectiveDisplayed(5)
   SetObjectiveCompleted(5)
Endif

If IsObjectiveDisplayed(20)
   SetObjectiveCompleted(20)
Endif

If IsObjectiveDisplayed(30)
   SetObjectiveCompleted(30)
Endif

If IsObjectiveDisplayed(40)
   SetObjectiveCompleted(40)
Endif

If IsObjectiveDisplayed(50)
   SetObjectiveCompleted(50)
Endif

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
If IsObjectiveDisplayed(10)
   SetObjectiveCompleted(10)
Endif

If IsObjectiveDisplayed(20)
   SetObjectiveCompleted(20)
Endif

If IsObjectiveDisplayed(30)
   SetObjectiveCompleted(30)
Endif

If IsObjectiveDisplayed(40)
   SetObjectiveCompleted(40)
Endif

SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
If IsObjectiveDisplayed(5)
   SetObjectiveDisplayed(5,0)
Endif

If IsObjectiveDisplayed(10)
   SetObjectiveCompleted(10)
Endif

If IsObjectiveDisplayed(20)
   SetObjectiveCompleted(20)
Endif

If IsObjectiveDisplayed(40)
   SetObjectiveCompleted(40)
Endif

If IsObjectiveDisplayed(50)
   SetObjectiveCompleted(50)
Endif

SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pDB01GuardScene  Auto  
AchievementsScript Property AchievementsQuest Auto

