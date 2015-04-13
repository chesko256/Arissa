;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_DBSideContract03_0001EA5F Extends Quest Hidden

;BEGIN ALIAS PROPERTY DBBeitildAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBBeitildAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBNazirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBNazirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DBSideContract03Script
Quest __temp = self as Quest
DBSideContract03Script kmyQuest = __temp as DBSideContract03Script
;END AUTOCAST
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE DBSideContract03Script
Quest __temp = self as Quest
DBSideContract03Script kmyQuest = __temp as DBSideContract03Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE DBSideContract03Script
Quest __temp = self as Quest
DBSideContract03Script kmyQuest = __temp as DBSideContract03Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if DBScript.pBetildAlreadyDead == 1
     SetStage (20)
     ;DBScript.FirstKill +1	 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DBSideContract03Script
Quest __temp = self as Quest
DBSideContract03Script kmyQuest = __temp as DBSideContract03Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pDB02a.SetStage (10)
kmyQuest.pDarkSideContractDialogue.Start()
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.FirstSet=1
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DBSideContract03Script
Quest __temp = self as Quest
DBSideContract03Script kmyQuest = __temp as DBSideContract03Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE DBSideContract03Script
Quest __temp = self as Quest
DBSideContract03Script kmyQuest = __temp as DBSideContract03Script
;END AUTOCAST
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkBrotherhoodQuest  Auto  

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  
