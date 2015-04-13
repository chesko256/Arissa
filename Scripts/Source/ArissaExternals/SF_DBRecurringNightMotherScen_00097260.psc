;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_DBRecurringNightMotherScen_00097260 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
DBRecurringQuestScript Script = DBRecurring as DBRecurringQuestScript
Script.HaveContract = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
pNightMotherRecurringScene2.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pNightMotherRecurringScene2  Auto  

Quest Property DBrecurring  Auto  
