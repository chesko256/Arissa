;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_WhiterunAmrenScene_0009E0B4 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DialogueWhiterunScript Script = WhiterunDialogue as DialogueWhiterunScript
Script.pAmrenScene = 1
AmrenSaffirScene2.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property WhiterunDialogue  Auto  

Scene Property AmrenSaffirScene2  Auto  
