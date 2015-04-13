;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_DBSideContract12_0001EA68 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DBSafiaAlias
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_DBSafiaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBNazirAlias
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_DBNazirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(20)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if DBScript.pSafiaAlreadyDead == 1
     SetStage (20) 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DBSideContract12Script
Quest __temp = self as Quest
DBSideContract12Script kmyQuest = __temp as DBSideContract12Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.pDB02a.SetStage (200)
kmyQuest.pDarkSideContractDialogue.Start()
DarkBrotherhood DBScript = kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.ContractSet=11
DBScript.NextSet=4
DBScript.FirstSet=2
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkBrotherhoodQuest  Auto  

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  
