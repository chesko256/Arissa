;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_MS08ArgueScene_00055FB4 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;test
MS08QuestScript MS08Script = MS08 as MS08QuestScript
MS08Script.InitialForcegreet =1
Warrior1.GetActorReference().EvaluatePackage()
Warrior2.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS08  Auto  

ReferenceAlias Property Warrior1  Auto  

ReferenceAlias Property Warrior2  Auto  
