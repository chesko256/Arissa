;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_DBSideContract01_0001EA5B Extends Quest Hidden

;BEGIN ALIAS PROPERTY DBSideContract01NarfiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBSideContract01NarfiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBSideContract01NazirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBSideContract01NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE DBSideContract01Script
Quest __temp = self as Quest
DBSideContract01Script kmyQuest = __temp as DBSideContract01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if DBScript.pNarfiAlreadyDead == 1
     SetStage (20)
     ;DBScript.FirstKill +1	 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DBSideContract01Script
Quest __temp = self as Quest
DBSideContract01Script kmyQuest = __temp as DBSideContract01Script
;END AUTOCAST
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE DBSideContract01Script
Quest __temp = self as Quest
DBSideContract01Script kmyQuest = __temp as DBSideContract01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DBSideContract01Script
Quest __temp = self as Quest
DBSideContract01Script kmyQuest = __temp as DBSideContract01Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pDB02a.SetStage (10)
kmyQuest.pDarkSideContractDialogue.Start()
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
;DBScript.FirstSet=1
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE DBSideContract01Script
Quest __temp = self as Quest
DBSideContract01Script kmyQuest = __temp as DBSideContract01Script
;END AUTOCAST
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE DBSideContract01Script
Quest __temp = self as Quest
DBSideContract01Script kmyQuest = __temp as DBSideContract01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkBrotherhoodQuest  Auto  

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  
