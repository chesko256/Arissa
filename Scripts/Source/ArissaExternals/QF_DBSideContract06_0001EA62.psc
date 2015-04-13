;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_DBSideContract06_0001EA62 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DBDeekusAlias
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_DBDeekusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBNazirAlias
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_DBNazirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if DBScript.pDeekusAlreadyDead == 1
     SetStage (20) 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DBSideContract06Script
Quest __temp = self as Quest
DBSideContract06Script kmyQuest = __temp as DBSideContract06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pDB02a.SetStage (200)
kmyQuest.pDB04a.SetStage (200)
kmyQuest.pDarkSideContractDialogue.Start()
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.ContractSet=5
DBScript.NextSet=1
DBScript.FirstSet=2
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(20)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkBrotherhoodQuest  Auto  

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  
