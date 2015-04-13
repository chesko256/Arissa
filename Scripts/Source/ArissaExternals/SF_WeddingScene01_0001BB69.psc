;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_WeddingScene01_0001BB69 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DB05Script pScript = GetOwningQuest() as DB05Script
pScript.pWeddingScene01 = 1
MusicScene.Start()
BrideScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MusicScene  Auto  

Scene Property BrideScene  Auto  
