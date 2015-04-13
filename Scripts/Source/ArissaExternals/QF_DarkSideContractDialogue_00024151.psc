;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_DarkSideContractDialogue_00024151 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DarkSideContractDialogue
Quest __temp = self as Quest
DarkSideContractDialogue kmyQuest = __temp as DarkSideContractDialogue
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB02.SetStage (20)
Start ()
DarkBrotherhood DBScript=kmyQuest.DarkBrotherhoodQuest as DarkBrotherhood
DBScript.FirstSet=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
