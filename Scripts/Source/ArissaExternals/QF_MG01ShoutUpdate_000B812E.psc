;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_MG01ShoutUpdate_000B812E Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Utility.Wait(3)
(MG01 as MG01QuestScript).WaitingForShout=2
MG01FaraldaAlias.GetActorReference().EvaluatePackage()
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MG01  Auto  

ReferenceAlias Property MG01FaraldaAlias  Auto  
