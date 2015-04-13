;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname SF_E3demoFoxAndTheHare_0009A74B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
QF_E3demo_00093637 E3demo = getOwningQuest() as QF_E3demo_00093637
;e3demo.Alias_Fox.getActorReference().startCombat(e3demo.Alias_Hare.getActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
QF_E3demo_00093637 E3demo = getOwningQuest() as QF_E3demo_00093637
e3demo.Alias_Hare.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
QF_E3demo_00093637 E3demo = getOwningQuest() as QF_E3demo_00093637
;e3demo.Alias_Fox.getActorReference().startCombat(e3demo.Alias_Hare.getActorReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
