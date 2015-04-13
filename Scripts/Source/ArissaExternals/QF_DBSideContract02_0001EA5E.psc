;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_DBSideContract02_0001EA5E Extends Quest Hidden

;BEGIN ALIAS PROPERTY DBEnnodiusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBEnnodiusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBNazirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBNazirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE DBSideContract02Script
Quest __temp = self as Quest
DBSideContract02Script kmyQuest = __temp as DBSideContract02Script
;END AUTOCAST
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DBSideContract02Script
Quest __temp = self as Quest
DBSideContract02Script kmyQuest = __temp as DBSideContract02Script
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
;BEGIN AUTOCAST TYPE DBSideContract02Script
Quest __temp = self as Quest
DBSideContract02Script kmyQuest = __temp as DBSideContract02Script
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

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DBSideContract02Script
Quest __temp = self as Quest
DBSideContract02Script kmyQuest = __temp as DBSideContract02Script
;END AUTOCAST
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE DBSideContract02Script
Quest __temp = self as Quest
DBSideContract02Script kmyQuest = __temp as DBSideContract02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
Alias_DBEnnodiusAlias.GetReference().Enable()

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if DBScript.pEnnodiusAlreadyDead == 1
    SetStage (20)
     ;DBScript.FirstKill +1	 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE DBSideContract02Script
Quest __temp = self as Quest
DBSideContract02Script kmyQuest = __temp as DBSideContract02Script
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
