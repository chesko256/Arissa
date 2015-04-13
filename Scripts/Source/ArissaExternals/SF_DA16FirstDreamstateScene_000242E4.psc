;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_DA16FirstDreamstateScene_000242E4 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
DA16QuestScript pDA16Script = getowningquest() as DA16QuestScript
pDA16Script.pDA16VerenToggle = 1
pDA16Script.pDA16FirstSceneBreak = 1
pDA16Script.pDA16VerenAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Removed
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
