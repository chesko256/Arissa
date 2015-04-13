;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_MG01ClassroomScene_000206C5 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if DeadEnd== 0

WardScene.Start()
Game.EnablePlayerControls()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property WardScene  Auto  

ReferenceAlias Property MG01OnmundAlias  Auto  

ReferenceAlias Property MG01BrelynaAlias  Auto  

ReferenceAlias Property MG01JzargoAlias  Auto  

int Property DeadEnd  Auto  
