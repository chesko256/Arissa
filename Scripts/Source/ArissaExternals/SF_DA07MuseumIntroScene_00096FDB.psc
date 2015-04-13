;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_DA07MuseumIntroScene_00096FDB Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Once the player is in the Museum, shut down the intro quest
pDA07Intro.SetStage(200)
pDA07.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;run tapestries scene
DA07MuseumTapestriesScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDA07Intro  Auto  

Quest Property pDA07  Auto  

Scene Property DA07MuseumTapestriesScene  Auto  
