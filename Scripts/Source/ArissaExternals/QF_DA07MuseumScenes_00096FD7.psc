;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_DA07MuseumScenes_00096FD7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Silus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Silus Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; Play the Mythic Dawn Scabbard Scene
pScabbardScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Mythic Dawn Commentaries scene has played
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Mythic Dawn robes scene has played
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Play the Mythic Dawn Xarxes scene
pXarxesScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Mythic Dawn Tapestries Scene has played
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Play the Mythic Dawn Commentaries scene
pCommentariesScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Mythic Dawn Scabbard scene has played
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;run the Mythic Dawn robes scene
pRobesScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Mythic Dawn Xarxes scene has played
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Play the Mythic Dawn Tapestries Scene
pTapestriesScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pRobesScene  Auto  

Scene Property pCommentariesScene  Auto  

Scene Property pTapestriesScene  Auto  

Scene Property pXarxesScene  Auto  

quest Property pDA07Intro  Auto  

Scene Property pScabbardScene  Auto  
