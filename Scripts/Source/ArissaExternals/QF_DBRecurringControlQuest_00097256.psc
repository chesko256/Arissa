;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname QF_DBRecurringControlQuest_00097256 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Utility.Wait(2)
;DBRecurring.SetStage (10)
DBRecurringQuestScript Script = DBRecurring as DBRecurringQuestScript
Script.HaveContract = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

int Property pContractStage  Auto Conditional 

Quest Property DBRecurring  Auto  
